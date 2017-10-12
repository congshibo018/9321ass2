package Servlet;

import Dao.UnswBookFriendshipDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookUserDAO;
import Dao.UnswBookVoteDAO;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookVoteEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "showMessageServlet")
public class showMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getSession().getAttribute("role").toString();
        int userId = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        if (role.equals("user")) {

                int uid = userId;
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
                request.getRequestDispatcher("mainpage.jsp").forward(request, response);

        }
    }
}
