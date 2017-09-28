package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookMessageDAO;
import Entity.UnswBookActivityEntity;
import Entity.UnswBookMessageEntity;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
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

        String fileName = String.valueOf(userId)+current_time+getFileName(pic);
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
        System.out.println(message.getUserId());
        UnswBookMessageDAO.saveOrUpdate(message);

        UnswBookActivityEntity activity = new UnswBookActivityEntity();
        activity.setActivity("post message: "+title);
        activity.setTime(current_time);
        activity.setUserId(userId);
        UnswBookActivityDAO.saveOrUpdate(activity);

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
