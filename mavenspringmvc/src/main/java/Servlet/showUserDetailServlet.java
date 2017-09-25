package Servlet;

import Dao.UnswBookFriendshipDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookUserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "showUserDetailServlet")
public class showUserDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.valueOf(request.getParameter("uid"));
        int currentUserId = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        boolean isFriend = false;
        UnswBookUserEntity user = UnswBookUserDAO.retrieve(uid);

        isFriend = UnswBookFriendshipDAO.checkFriendship(uid,currentUserId);

        ArrayList messagelist = new ArrayList<UnswBookMessageEntity>();
        messagelist.addAll(UnswBookMessageDAO.getMessageByUserId(uid));

        request.getSession().setAttribute("messageList",messagelist);
        request.setAttribute("user",user);
        request.setAttribute("isFriend",isFriend);
        request.getRequestDispatcher("userDetail.jsp").forward(request,response);
    }
}
