package Servlet;

import Dao.UnswBookVoteDAO;
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
        int uid = Integer.valueOf(request.getParameter("currentUserId").toString());
        int mid = Integer.valueOf(request.getParameter("messageId").toString());
        int like = Integer.valueOf(request.getParameter("like").toString());
        UnswBookVoteEntity vote = new UnswBookVoteEntity();
        vote.setMessageId(mid);
        vote.setUserId(uid);
        vote.setThumbUp(like);
        UnswBookVoteDAO.saveOrUpdate(vote);

    }
}
