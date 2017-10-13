package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookEntityDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookTripleDAO;
import Entity.UnswBookActivityEntity;
import Entity.UnswBookEntityEntity;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookTripleEntity;
import unsw.curation.api.tokenization.ExtractionKeywordImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

@WebServlet(name = "postMessageServlet")
@MultipartConfig
public class postMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String url = request.getParameter("url");

        Part pic = request.getPart("image");

        int userId = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        Timestamp current_time = new Timestamp(System.currentTimeMillis());
        String fileName="";
        System.out.println(getFileName(pic));
        if(getFileName(pic).equals("")||getFileName(pic)==null){
            fileName = "nopic.jpg";
        }else{
            fileName = String.valueOf(userId)+current_time+getFileName(pic);
        }
        String imagePath = writeTo(fileName, pic);

        UnswBookMessageEntity message = new UnswBookMessageEntity();
        message.setUserId(userId);
        message.setTitle(title);
        message.setContent(content);
        message.setUrl(url);
        message.setTime(current_time);
        message.setThumbUp(0);
        message.setThumbDown(0);
        message.setImage(imagePath);
        UnswBookMessageDAO.saveOrUpdate(message);

        int mid = UnswBookMessageDAO.getMaxId();
        UnswBookEntityEntity entity1 = new UnswBookEntityEntity();
        UnswBookEntityEntity entity2 = new UnswBookEntityEntity();
        UnswBookEntityEntity entity3 = new UnswBookEntityEntity();
        entity1.setEntityId("M"+mid);
        entity1.setEntityAttribute("Type");
        entity1.setAttributeValue("Message");

        entity2.setEntityId("M"+mid);
        entity2.setEntityAttribute("Class");
        entity2.setAttributeValue("entityNode");

        entity3.setEntityId("M"+mid);
        entity3.setEntityAttribute("Title");
        entity3.setAttributeValue(message.getTitle());

        UnswBookEntityDAO.saveOrUpdate(entity1);
        UnswBookEntityDAO.saveOrUpdate(entity2);
        UnswBookEntityDAO.saveOrUpdate(entity3);

        UnswBookTripleEntity triple = new UnswBookTripleEntity();
        triple.setNodeFrom("P"+userId);
        triple.setNodeTo("M"+mid);
        triple.setEdge("E2");
        UnswBookTripleDAO.saveOrUpdate(triple);

        UnswBookActivityEntity activity = new UnswBookActivityEntity();
        activity.setActivity("post message: "+title);
        activity.setTime(current_time);
        activity.setUserId(userId);
        UnswBookActivityDAO.saveOrUpdate(activity);

        ExtractionKeywordImpl ek = new ExtractionKeywordImpl();
        String file = getServletConfig().getServletContext().getRealPath("/")+"englishStopwords.txt";
        String keys = "";
        try {
            keys = ek.ExtractSentenceKeyword(content,new File(file));
        } catch (Exception e) {
            e.printStackTrace();
        }
        ExtractionKeywordImpl ek2 = new ExtractionKeywordImpl();
        String bullyfile = getServletConfig().getServletContext().getRealPath("/")+"bullyWord.txt";
        String bullyWord = "";
        try {
            bullyWord = ek2.ExtractFileKeyword(new File(bullyfile),new File(file));
        } catch (Exception e) {
            e.printStackTrace();
        }

        String[] bullyWords = bullyWord.split("\\,");
        System.out.println(bullyWord);
        System.out.println(keys);
        int flag=0;
        String bullyWordUsed ="";
        for(String word:bullyWords){
            if (keys.contains(word)){
                flag = 1;
                bullyWordUsed = bullyWordUsed + ","+word;
            }
        }
        if (flag==1){
            UnswBookActivityEntity bullyactivity = new UnswBookActivityEntity();
            bullyactivity.setActivity("Bullying related word used: "+bullyWordUsed.replaceFirst(",",""));
            bullyactivity.setTime(current_time);
            bullyactivity.setUserId(userId);
            UnswBookActivityDAO.saveOrUpdate(bullyactivity);
            try {
                tools.emailTool.bullyRelatedPostMail(userId,bullyWordUsed.replaceFirst(",",""));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("mainpage.jsp").forward(request,response);

    }
    private String getFileName(Part part) {
        String header = part.getHeader("Content-Disposition");
        String fileName = header.substring(header.indexOf("filename=\"") + 10,
                header.lastIndexOf("\""));
        return fileName;
    }

    private String writeTo(String fileName, Part part) throws IOException, FileNotFoundException {
        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream(getServletContext().getRealPath("/")+fileName);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
        return fileName;
    }
}
