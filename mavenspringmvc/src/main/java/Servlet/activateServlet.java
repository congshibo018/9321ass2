package Servlet;

import Dao.UnswBookUserDAO;
import Entity.UnswBookUserEntity;
import tools.emailTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "activateServlet")
public class activateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String token = request.getParameter("token");
        Long time = System.currentTimeMillis();
        int uid = UnswBookUserDAO.getUserIdByEmailAddress(email);
        UnswBookUserEntity u = UnswBookUserDAO.retrieve(uid);

        if (u != null) {

            if (u.getStatus().equals("0") && u.getActivateTime().getTime() > time) {
                System.out.println(token);
                System.out.println(u.getCode());
                if (u.getCode().equals(token)) {
                    u.setStatus("1");
                    token = u.getEmailAddress() + time;
                    try {
                        u.setCode(emailTool.md5(token));
                    } catch (NoSuchAlgorithmException e) {
                        e.printStackTrace();
                    }
                    UnswBookUserDAO.saveOrUpdate(u);
                } else {
                    System.out.println("token");
                }
            } else {
                System.out.println("already activated");
            }
        }
    }
}
