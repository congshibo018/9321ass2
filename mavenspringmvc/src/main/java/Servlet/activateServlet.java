package Servlet;

import Dao.UnswBookEntityDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookEntityEntity;
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

                    UnswBookEntityEntity entity1 = new UnswBookEntityEntity();
                    UnswBookEntityEntity entity2 = new UnswBookEntityEntity();
                    UnswBookEntityEntity entity3 = new UnswBookEntityEntity();
                    entity1.setEntityId("P"+u.getId());
                    entity1.setEntityAttribute("Type");
                    entity1.setAttributeValue("Person");

                    entity2.setEntityId("P"+u.getId());
                    entity2.setEntityAttribute("Class");
                    entity2.setAttributeValue("entityNode");

                    entity3.setEntityId("P"+u.getId());
                    entity3.setEntityAttribute("Name");
                    entity3.setAttributeValue(u.getName());

                    UnswBookEntityDAO.saveOrUpdate(entity1);
                    UnswBookEntityDAO.saveOrUpdate(entity2);
                    UnswBookEntityDAO.saveOrUpdate(entity3);

                    request.getRequestDispatcher("login?role=user&username="+u.getUsername()+"&password="+u.getPassword()).forward(request,response);
                } else {
                    request.getSession().setAttribute("failReason","token");
                    request.getRequestDispatcher("registeFail.jsp").forward(request,response);
                }
            } else {
                request.getSession().setAttribute("failReason","already activated");
                request.getRequestDispatcher("registeFail.jsp").forward(request,response);
            }
        }
    }
}
