package Servlet;

import Dao.UnswBookUserDAO;
import Entity.UnswBookUserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changeUserStatusServlet")
public class changeUserStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.valueOf(request.getParameter("uid").toString());
        System.out.println(uid);
        UnswBookUserEntity user = UnswBookUserDAO.retrieve(uid);
        if(user.getStatus().equals("1")){
            user.setStatus("0");
        }else{
            user.setStatus("1");
        }
        UnswBookUserDAO.saveOrUpdate(user);
        request.getRequestDispatcher("mainpage.jsp").forward(request,response);
    }
}
