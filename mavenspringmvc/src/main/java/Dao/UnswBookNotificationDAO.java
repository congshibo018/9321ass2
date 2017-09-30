package Dao;

import Entity.UnswBookNotificationEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class UnswBookNotificationDAO {
    public static void saveOrUpdate(UnswBookNotificationEntity message){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(message);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookNotificationEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookNotificationEntity message = session.get(UnswBookNotificationEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return message;
    }

    public static List<UnswBookNotificationEntity> getNotificationByUserId(int uid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookNotificationEntity WHERE uid=:uid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;

    }
    public static void delete(UnswBookNotificationEntity message){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(message);
        session.getTransaction().commit();
        session.close();
    }
}
