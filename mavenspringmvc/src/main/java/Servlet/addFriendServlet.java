package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookFriendshipDAO;
import Entity.UnswBookActivityEntity;
import Entity.UnswBookFriendshipEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

@WebServlet(name = "addFriendServlet")
public class addFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        int friendId = Integer.valueOf(request.getParameter("fid").toString());
        if(UnswBookFriendshipDAO.getFriendshipByTwoId(userId,friendId)==-1) {
            UnswBookFriendshipEntity friendship = new UnswBookFriendshipEntity();
            friendship.setUid(userId);
            friendship.setFid(friendId);
            friendship.setStatus("0");

            UnswBookFriendshipEntity friendship2 = new UnswBookFriendshipEntity();
            friendship2.setUid(friendId);
            friendship2.setFid(userId);
            friendship2.setStatus("0");

            UnswBookActivityEntity activity = new UnswBookActivityEntity();
            activity.setActivity(userId + " send friend request to " + friendId);
            Timestamp current_time = new Timestamp(System.currentTimeMillis());
            activity.setTime(current_time);
            activity.setUserId(userId);

            UnswBookActivityDAO.saveOrUpdate(activity);
            UnswBookFriendshipDAO.saveOrUpdate(friendship);
            UnswBookFriendshipDAO.saveOrUpdate(friendship2);

            if (UnswBookFriendshipDAO.checkFriendship(userId, friendId) == false) {
                try {
                    tools.emailTool.friendRequestMail(userId, friendId);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }

            }
        }
        request.getRequestDispatcher("mainpage.jsp").forward(request,response);
    }
}
