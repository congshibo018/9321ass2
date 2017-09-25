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

        session.saveOrUpdate(user);
        session.getTransaction().commit();
        session.close();

    }

    public static void activiteUser(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        String hql = "FROM UnswBookUserEntity WHERE status=0 and id=:id";
        Query q = session.createQuery(hql);
        q.setParameter("id",id);
        List list = q.list();
        UnswBookUserEntity user = null;
        Iterator iter = list.listIterator();
        if (iter.hasNext()){
            user = (UnswBookUserEntity) iter.next();
        }
        user.setStatus("1");
        session.close();

    }

    public static UnswBookUserEntity retrieve(int id){
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
        String hql = "FROM UnswBookUserEntity WHERE status=1 and username=:username";
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

    public static int getUserIdByEmailAddress(String emailAddress){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookUserEntity WHERE emailAddress=:emailAddress";
        Query q = session.createQuery(hql);
        q.setParameter("emailAddress",emailAddress);

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
        String hql = "FROM UnswBookUserEntity WHERE status=1 and username<>:username";
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
        String hql = "FROM UnswBookUserEntity WHERE status=1";
        if(!(nickname==null||nickname.equals(""))){
            hql += " and name=:nickname";
        }
        if(!(gender==null||gender.equals(""))){
            hql += " and gender=:gender";
        }
        if(!(dob==null||dob.equals(""))){
            hql += " and DoB=:dob";
        }
        if(!(email==null||email.equals(""))){
            hql += " and emailAddress=:email";
        }
        Query q =session.createQuery(hql);
        if(!(nickname==null||nickname.equals(""))){
            q.setParameter("nickname",nickname);
        }
        if(!(gender==null||gender.equals(""))){
            q.setParameter("gender",gender);
        }
        if(!(dob==null||dob.equals(""))){
            q.setParameter("dob",dob);
        }
        if(!(email==null||email.equals(""))){
            q.setParameter("email",email);
        }
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }
    public static void delete(UnswBookUserEntity user){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(user);
        session.getTransaction().commit();
        session.close();
    }
}
