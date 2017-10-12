package tools;


import Dao.UnswBookAdminDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookAdminEntity;
import Entity.UnswBookFriendshipEntity;
import Entity.UnswBookUserEntity;
import org.springframework.messaging.MessagingException;
import sun.jvm.hotspot.debugger.AddressException;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class emailTool {
    public static final String FROM = "congshibo018@gmail.com";
    public static final String PWD = "as6377658";
    public static final String URL = "http://localhost:8080";
    public static final int TIMELIMIT = 1000*60*60*24;
    public static final String TITLE = "UNSWBook activite mail";
    public static final String HOST = "smtp.gmail.com";
    public static final String SMTP = "smtp";


    public static UnswBookUserEntity activateMail(UnswBookUserEntity u) throws AddressException, MessagingException, NoSuchAlgorithmException {
        String to  = u.getEmailAddress();
        Long curTime = System.currentTimeMillis();
        Long activateTime = curTime+TIMELIMIT;
        String token = to+curTime;
        u.setCode(emailTool.md5(token));
        u.setStatus("0");
        token = u.getCode();
        Timestamp a= new Timestamp(activateTime);
        System.out.println(activateTime);
        u.setActivateTime(a);
        String content = "<p>activite your UNSWBOOK account"
                +"<br><a href='"+URL+"/activatemail?token="+token+"&email="+to+"'>"
                +URL+"/activatemail?token="+token+"&email="+to+"</a></p>";
        emailTool.sendMail(to, TITLE, content);
        return u;
    }

    public static void friendRequestMail(int userId, int friendId) throws AddressException, MessagingException, NoSuchAlgorithmException {
        UnswBookUserEntity friend = UnswBookUserDAO.retrieve(friendId);
        UnswBookUserEntity currentUser = UnswBookUserDAO.retrieve(userId);

        Long curTime = System.currentTimeMillis();
        String token = emailTool.md5(friend.getName()+curTime);

        String content = "<p>UNSWBOOK friend request from"+currentUser.getName()
                +"<br><a href='"+URL+"/activateFriend?agree=1"+"&friendId="+friendId+"&userId="+userId+"'> YES"+"</a>    "
                +"<a href='"+URL+"/activateFriend?agree=0"+"&friendId="+friendId+"&userId="+userId+"'> NO"+"</a></p>";
        emailTool.sendMail(friend.getEmailAddress(), TITLE, content);
    }

    public static void bullyRelatedPostMail(int userId, String bullyword) throws AddressException, MessagingException, NoSuchAlgorithmException {
        UnswBookUserEntity user = UnswBookUserDAO.retrieve(userId);

        String content = "<p>UNSWBOOK user "+user.getName()+" posted a bully related message <br>using words: "+bullyword+"</p>";
        List<UnswBookAdminEntity> adminList = UnswBookAdminDAO.findAll();
        for (UnswBookAdminEntity admin:adminList){
            emailTool.sendMail(admin.getEmailAddress(), TITLE, content);
        }

    }

    public static void sendMail(String to,String title,String content) throws AddressException, MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(props);
        try {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(title);
        message.setContent(content, "text/html;charset=gbk");
        message.saveChanges();

        Transport transport = session.getTransport(SMTP);
        transport.connect(FROM, PWD);
        transport.sendMessage(message, message.getAllRecipients());

            transport.close();
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }
    }
    public static String md5(String str) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str.getBytes());
        return new BigInteger(1,md.digest()).toString(16);
    }

}
