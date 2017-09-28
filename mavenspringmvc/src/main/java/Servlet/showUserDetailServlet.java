package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookFriendshipDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookActivityEntity;
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
        String role = request.getSession().getAttribute("role").toString();
        boolean isFriend = false;
        boolean isBanned = false;
        UnswBookUserEntity user = UnswBookUserDAO.retrieve(uid);

        isFriend = UnswBookFriendshipDAO.checkFriendship(uid,currentUserId);
        if(UnswBookUserDAO.retrieve(uid).getStatus().equals("1")){
            isBanned=false;
        }else {
            isBanned=true;
        }
        ArrayList messagelist = new ArrayList<UnswBookMessageEntity>();
        ArrayList activitylist = new ArrayList<UnswBookActivityEntity>();
        messagelist.addAll(UnswBookMessageDAO.getMessageByUserId(uid));
        activitylist.addAll(UnswBookActivityDAO.getActivityByUserId(uid));
        request.getSession().setAttribute("messageList",messagelist);
        request.setAttribute("user",user);
        if (role.equals("user")){
            request.setAttribute("isFriend",isFriend);
        }

        if(role.equals("admin")){
            request.setAttribute("isBanned",isBanned);
            request.setAttribute("activityList",activitylist);
        }
        request.getRequestDispatcher("userDetail.jsp").forward(request,response);
    }
}
