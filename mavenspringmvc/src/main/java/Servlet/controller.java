package Servlet;

import Dao.UnswBookUserDAO;
import Entity.UnswBookUserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tools.emailTool;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

public class controller {
    public String hello(HttpServletRequest request, Model model) throws IOException, AddressException, MessagingException, NoSuchAlgorithmException {
        String email = request.getParameter("email");
        String token = request.getParameter("token");
        Long time = System.currentTimeMillis();
        int uid = UnswBookUserDAO.getUserIdByEmailAddress(email);
        UnswBookUserEntity u = UnswBookUserDAO.retrieve(uid);

        if (u != null) {
            if (u.getStatus() == "0" && u.getActivateTime().getTime() < time) {
                if (u.getCode().equals(token)) {
                    u.setStatus("1");
                    token = u.getEmailAddress() + time;
                    u.setCode(emailTool.md5(token));
                    UnswBookUserDAO.saveOrUpdate(u);
                } else {
                    System.out.println("token");
                }
            } else {
                System.out.println("already activated");
            }
        }
        return "activatemail";
    }
}
