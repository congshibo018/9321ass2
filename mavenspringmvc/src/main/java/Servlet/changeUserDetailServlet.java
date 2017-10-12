package Servlet;

import Dao.UnswBookUserDAO;
import Entity.UnswBookUserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "changeUserDetailServlet")
@MultipartConfig
public class changeUserDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        UnswBookUserEntity user = UnswBookUserDAO.retrieve(id);

        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String doB =request.getParameter("doB");
        Part pic = request.getPart("image");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(!(email==null||email.equals(""))){
            user.setEmailAddress(email);
            user.setStatus("0");
        }
        if(!(password==null||password.equals(""))){
            user.setPassword(password);
        }
        if(!(name==null||name.equals(""))){
            user.setName(name);
        }
        if(!(gender==null||gender.equals(""))){
            user.setGender(gender);
        }
        if(!(doB==null||doB.equals(""))){
            Date dob = null;
            try {
                dob = sdf.parse(doB);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            java.sql.Date date = new java.sql.Date(dob.getTime());
            user.setDoB(date);
        }
        System.out.println(getServletContext().getRealPath("/"));
        String fileName = getFileName(pic);
        String imagePath = writeTo(fileName, pic);
        user.setPhoto(imagePath);
        UnswBookUserDAO.saveOrUpdate(user);
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
