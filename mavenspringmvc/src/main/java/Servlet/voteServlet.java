package Servlet;

import Dao.UnswBookMessageDAO;
import Dao.UnswBookNotificationDAO;
import Dao.UnswBookUserDAO;
import Dao.UnswBookVoteDAO;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookNotificationEntity;
import Entity.UnswBookUserEntity;
import Entity.UnswBookVoteEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "voteServlet")
public class voteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        int mid = Integer.valueOf(request.getParameter("messageId").toString());
        int like = Integer.valueOf(request.getParameter("like").toString());
        Timestamp current_time = new Timestamp(System.currentTimeMillis());

        UnswBookVoteEntity vote = UnswBookVoteDAO.getVote(uid,mid);
        vote.setThumbUp(like);
        UnswBookVoteDAO.saveOrUpdate(vote);

        UnswBookMessageEntity message = UnswBookMessageDAO.retrieve(mid);
        int messageUserId = message.getUserId();
        int thumbUp = UnswBookVoteDAO.getLike(mid);
        int thumbDown = UnswBookVoteDAO.getDislike(mid);
        message.setThumbUp(thumbUp);
        message.setThumbDown(thumbDown);
        UnswBookMessageDAO.saveOrUpdate(message);

        UnswBookUserEntity user = UnswBookUserDAO.retrieve(uid);
        UnswBookNotificationEntity notification = new UnswBookNotificationEntity();
        notification.setUid(messageUserId);
        notification.setTitle("Some one like your post!");
        notification.setText(user.getName()+" like your post!");
        notification.setTime(current_time);
        UnswBookNotificationDAO.saveOrUpdate(notification);
    }
}
