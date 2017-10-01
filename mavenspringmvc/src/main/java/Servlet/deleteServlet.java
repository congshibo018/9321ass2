package Servlet;

import Dao.UnswBookMessageDAO;
import Dao.UnswBookNotificationDAO;
import Dao.UnswBookVoteDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteServlet")
public class deleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String item = request.getParameter("item");
        if(item.equals("message")){
            int mid = Integer.valueOf(request.getParameter("id"));
            UnswBookMessageDAO.delete(UnswBookMessageDAO.retrieve(mid));
        }
        if(item.equals("notification")){
            int nid = Integer.valueOf(request.getParameter("id"));
            UnswBookNotificationDAO.delete(UnswBookNotificationDAO.retrieve(nid));
        }
    }
}
