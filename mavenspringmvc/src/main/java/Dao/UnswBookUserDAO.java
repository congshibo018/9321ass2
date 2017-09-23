package Dao;

import org.hibernate.Session;
import Entity.UnswBookUserEntity;
import Util.HibernateUtil;
import org.hibernate.query.Query;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UnswBookUserDAO {


    public static void saveOrUpdate(UnswBookUserEntity user){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.save(user);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookUserEntity retrieve(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookUserEntity user = session.get(UnswBookUserEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return user;
    }

    public static String validity(String username){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookUserEntity WHERE username=:username";
        Query q = session.createQuery(hql);
        q.setParameter("username",username);
        if (q==null){
            return null;
        }
        List list = q.list();
        UnswBookUserEntity user = null;
        Iterator iter = list.listIterator();
        String password = "";
        if (iter.hasNext()){
            user = (UnswBookUserEntity) iter.next();
            password = user.getPassword();
        }

        session.close();
        return password;
    }

    public static int getUserId(String username){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookUserEntity WHERE username=:username";
        Query q = session.createQuery(hql);
        q.setParameter("username",username);

        List list = q.list();
        UnswBookUserEntity user = null;
        Iterator iter = list.listIterator();
        int uid=-1;
        if (iter.hasNext()){
            user = (UnswBookUserEntity) iter.next();
            uid = user.getId();
        }
        session.close();
        return uid;
    }
    public static List<UnswBookUserEntity> findAll(String username){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookUserEntity WHERE username<>:username";
        Query q = session.createQuery(hql);
        q.setParameter("username",username);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static List<UnswBookUserEntity> getUserByFactor(String nickname,String gender, Date dob,String email){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookUserEntity WHERE 1=1";
        System.out.println("1"+nickname+"1");
        System.out.println(email);
        if(!nickname.equals("")){
            hql += " and name=:nickname";
        }
        if(!gender.equals("")){
            hql += " and gender=:gender";
        }
        if(!dob.equals("")){
            hql += " and DoB=:dob";
        }
        if(!email.equals("")){
            hql += " and emailAddress=:email";
        }
        Query q =session.createQuery(hql);
        if(!nickname.equals("")){
            q.setParameter("nickname",nickname);
        }
        if(!gender.equals("")){
            q.setParameter("gender",gender);
        }
        if(!dob.equals("")){
            q.setParameter("dob",dob);
        }
        if(!email.equals("")){
            q.setParameter("email",email);
        }
        if(q == null){
            return null;
        }
        List list = q.list();
        System.out.println(hql);
        session.close();
        return list;
    }
    public void delete(UnswBookUserEntity user){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(user);
        session.getTransaction().commit();
        session.close();
    }
}
