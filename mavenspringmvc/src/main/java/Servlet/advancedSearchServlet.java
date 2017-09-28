package Servlet;

import Dao.UnswBookUserDAO;
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
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "advancedSearchServlet")
public class advancedSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        String gender = request.getParameter("gender");
        String doB = request.getParameter("doB");
        String email = request.getParameter("emailAddress");
        String role = request.getSession().getAttribute("role").toString();
        java.sql.Date date =null;
        if (!(doB ==null||doB.equals(""))) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = null;
            try {
                dob = sdf.parse(doB);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            date = new java.sql.Date(dob.getTime());
        }
        ArrayList userlist = new ArrayList<UnswBookUserEntity>();
        if (role.equals("user")){
            userlist.addAll(UnswBookUserDAO.getUserByFactor(nickname,gender,date,email));
        }else{
            userlist.addAll((UnswBookUserDAO.adminGetUserByFactor(nickname,gender,date,email)));
        }
        request.setAttribute("userlist",userlist);
        if(userlist.isEmpty()){
            response.getWriter().append("no user found");
        }else{
            request.getRequestDispatcher("searchResult.jsp").forward(request,response);
        }
    }
}
