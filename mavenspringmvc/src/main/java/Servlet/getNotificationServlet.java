package Servlet;

import Dao.UnswBookNotificationDAO;
import Entity.UnswBookNotificationEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "getNotificationServlet")
public class getNotificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        List<UnswBookNotificationEntity> notificationlist = UnswBookNotificationDAO.getNotificationByUserId(uid);
        request.setAttribute("notificationList",notificationlist);
        request.getRequestDispatcher("myNotification.jsp").forward(request,response);

    }
}
