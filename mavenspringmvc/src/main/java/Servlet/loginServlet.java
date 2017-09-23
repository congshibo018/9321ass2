package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UnswBookFriendshipDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookMessageEntity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (UnswBookUserDAO.validity(username).equals(password)){
            int uid = UnswBookUserDAO.getUserId(username);
            List<Integer> friendlist = UnswBookFriendshipDAO.getFriendByUserId(uid);
            ArrayList messagelist = new ArrayList<UnswBookMessageEntity>();

            for(int i = 0;i<friendlist.size();i++){
                messagelist.addAll(UnswBookMessageDAO.getMessageByUserId(friendlist.get(i)));
            }
            request.getSession().setAttribute("messageList",messagelist);
            request.getSession().setAttribute("currentUserId",uid);
            request.getRequestDispatcher("mainpage.jsp").forward(request,response);
        }else{
            response.getWriter().append("login failed");
        }
    }
}
