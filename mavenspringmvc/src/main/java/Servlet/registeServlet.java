package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookActivityEntity;
import Entity.UnswBookUserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "registeServlet")
public class registeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String doB = request.getParameter("doB");
        String emailAddress = request.getParameter("emailAddress");


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = sdf.parse(doB);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        java.sql.Date date = new java.sql.Date(dob.getTime());

        UnswBookUserEntity user = new UnswBookUserEntity();
        user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        user.setGender(gender);
        user.setDoB(date);
        user.setEmailAddress(emailAddress);
        System.out.println("new username"+UnswBookUserDAO.validity(username));
        if(UnswBookUserDAO.getUserId(username)== -1){
            UnswBookUserDAO.saveOrUpdate(user);

            UnswBookActivityEntity activity = new UnswBookActivityEntity();
            activity.setActivity("regist");
            Timestamp current_time = new Timestamp(System.currentTimeMillis());
            activity.setTime(current_time);
            activity.setUserId(UnswBookUserDAO.getUserId(username));
            UnswBookActivityDAO.saveOrUpdate(activity);

            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("registeFail.jsp").forward(request,response);
        }
    }
}
