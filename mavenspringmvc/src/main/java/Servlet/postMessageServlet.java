package Servlet;

import Dao.UnswBookActivityDAO;
import Dao.UnswBookMessageDAO;
import Entity.UnswBookActivityEntity;
import Entity.UnswBookMessageEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "postMessageServlet")
public class postMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String url = request.getParameter("url");
        int userId = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        Timestamp current_time = new Timestamp(System.currentTimeMillis());

        UnswBookMessageEntity message = new UnswBookMessageEntity();
        message.setUserId(userId);
        message.setTitle(title);
        message.setContent(content);
        message.setUrl(url);
        message.setTime(current_time);
        message.setThumbUp(0);
        message.setThumbDown(0);
        System.out.println(message.getUserId());
        UnswBookMessageDAO.saveOrUpdate(message);

        UnswBookActivityEntity activity = new UnswBookActivityEntity();
        activity.setActivity("post message: "+title);
        activity.setTime(current_time);
        activity.setUserId(userId);
        UnswBookActivityDAO.saveOrUpdate(activity);

        request.getRequestDispatcher("mainpage.jsp").forward(request,response);

    }
}
