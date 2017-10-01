package Servlet;

import Dao.UnswBookMessageDAO;
import Entity.UnswBookMessageEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getMyMessageServlet")
public class getMyMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer uid = Integer.valueOf(request.getSession().getAttribute("currentUserId").toString());
        ArrayList mymessagelist = new ArrayList<UnswBookMessageEntity>();
        mymessagelist.addAll(UnswBookMessageDAO.getMessageByUserId(uid));
        request.setAttribute("myMessageList",mymessagelist);
        request.getRequestDispatcher("myMessage.jsp").forward(request,response);

    }
}
