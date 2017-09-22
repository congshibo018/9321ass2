package Dao;

import org.hibernate.Session;
import Entity.UnswBookUserEntity;
import Util.HibernateUtil;
import org.hibernate.query.Query;

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
    public void delete(UnswBookUserEntity user){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(user);
        session.getTransaction().commit();
        session.close();
    }
}
