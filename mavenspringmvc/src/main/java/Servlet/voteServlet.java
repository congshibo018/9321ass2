package Servlet;

import Dao.UnswBookMessageDAO;
import Dao.UnswBookVoteDAO;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookVoteEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "voteServlet")
public class voteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        int mid = Integer.valueOf(request.getParameter("messageId").toString());
        int like = Integer.valueOf(request.getParameter("like").toString());
        UnswBookVoteEntity vote = UnswBookVoteDAO.getVote(uid,mid);

        vote.setThumbUp(like);
        UnswBookVoteDAO.saveOrUpdate(vote);

        UnswBookMessageEntity message = UnswBookMessageDAO.retrieve(mid);
        int thumbUp = UnswBookVoteDAO.getLike(mid);
        int thumbDown = UnswBookVoteDAO.getDislike(mid);
        message.setThumbUp(thumbUp);
        message.setThumbDown(thumbDown);
        UnswBookMessageDAO.saveOrUpdate(message);
    }
}
