package Servlet;

import Dao.UnswBookNotificationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PollingNotificationServlet")
public class PollingNotificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid= Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        int num= UnswBookNotificationDAO.getNotificationByUserId(uid).size();
        PrintWriter out = response.getWriter();
        StringBuffer json = new StringBuffer("{");
        json.append("\"msgNum\":"+num);
        json.append("}");
        out.write(json.toString());
        out.close();
    }
}
