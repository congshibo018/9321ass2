package Dao;

import Entity.UnswBookMessageEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookMessageDAO {

    public static void saveOrUpdate(UnswBookMessageEntity message){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(message);
        session.getTransaction().commit();
        session.close();
    }

    public static UnswBookMessageEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookMessageEntity message = session.get(UnswBookMessageEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return message;
    }

    public static List<UnswBookMessageEntity> getMessageByUserId(int uid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookMessageEntity WHERE userId=:userId";
        Query q = session.createQuery(hql);
        q.setParameter("userId",uid);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;

    }
    public static void delete(UnswBookMessageEntity message){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(message);
        session.getTransaction().commit();
        session.close();
    }
    public static int getMaxId(){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "SELECT max(id)FROM UnswBookMessageEntity WHERE 1=1";
        Query q = session.createQuery(hql);
        int id = (Integer)q.uniqueResult();
        return id;
    }
}
