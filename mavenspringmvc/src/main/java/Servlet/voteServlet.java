package Servlet;

import Dao.*;
import Entity.*;

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

        UnswBookTripleEntity triple = UnswBookTripleDAO.getVoteTripleId("P"+String.valueOf(uid),"M"+String.valueOf(mid));
        if(like==1){
            triple.setEdge("E3");
            UnswBookTripleDAO.saveOrUpdate(triple);
        }
        if(like==-1){
            triple.setEdge("E4");
            UnswBookTripleDAO.saveOrUpdate(triple);
        }
        if(like==0){
            UnswBookTripleDAO.delete(triple);
        }
    }
}
