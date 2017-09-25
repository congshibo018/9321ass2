package Servlet;

import Dao.UnswBookFriendshipDAO;
import Entity.UnswBookFriendshipEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "activateFriendServlet")
public class activateFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.valueOf(request.getParameter("userId").toString());
        int friendId = Integer.valueOf(request.getParameter("friendId").toString());
        String agree = request.getParameter("agree");

        int fsid1 = UnswBookFriendshipDAO.getFriendshipByTwoId(userId,friendId);
        int fsid2 = UnswBookFriendshipDAO.getFriendshipByTwoId(friendId,userId);
        UnswBookFriendshipEntity fs1 = UnswBookFriendshipDAO.retrieve(fsid1);
        UnswBookFriendshipEntity fs2 = UnswBookFriendshipDAO.retrieve(fsid2);
        if(agree.equals("1")){
            fs1.setStatus("1");
            fs2.setStatus("1");
            UnswBookFriendshipDAO.saveOrUpdate(fs1);
            UnswBookFriendshipDAO.saveOrUpdate(fs2);
        }else{
            UnswBookFriendshipDAO.delete(fs1);
            UnswBookFriendshipDAO.delete(fs2);
        }
        request.getSession().setAttribute("currentUserId",userId);
        request.getRequestDispatcher("mainpage.jsp").forward(request,response);

    }
}
