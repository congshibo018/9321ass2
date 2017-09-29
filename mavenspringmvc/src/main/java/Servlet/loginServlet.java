package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.*;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookVoteEntity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (role.equals("user")) {
            if (UnswBookUserDAO.validity(username).equals(password)) {
                int uid = UnswBookUserDAO.getUserId(username);
                List<Integer> friendlist = UnswBookFriendshipDAO.getFriendByUserId(uid);
                ArrayList messagelist = new ArrayList<UnswBookMessageEntity>();

                ArrayList votelist = new ArrayList<UnswBookVoteEntity>();
                for (int i = 0; i < friendlist.size(); i++) {
                    messagelist.addAll(UnswBookMessageDAO.getMessageByUserId(friendlist.get(i)));
                }
                for(int j =0;j < messagelist.size();j++){
                    UnswBookMessageEntity m = (UnswBookMessageEntity) messagelist.get(j);
                    int mid = m.getId();
                    votelist.add(UnswBookVoteDAO.getVote(uid,mid));
                }
                request.getSession().setAttribute("messageList", messagelist);
                request.getSession().setAttribute("voteList",votelist);
                request.getSession().setAttribute("currentUserId", uid);
                request.getSession().setAttribute("role",role);
                request.getRequestDispatcher("mainpage.jsp").forward(request, response);
            } else {
                response.getWriter().append("login failed");
            }
        }

        if(role.equals("admin")){
            if(UnswBookAdminDAO.validity(username).equals(password)){
                int uid = UnswBookAdminDAO.getUserId(username);
                request.getSession().setAttribute("currentUserId",uid);
                request.getSession().setAttribute("role",role);
                request.getRequestDispatcher("advancedSearch.jsp").forward(request, response);
            }else {
                response.getWriter().append("login failed");
            }
        }
    }
}
