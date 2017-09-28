package Dao;

import Entity.UnswBookActivityEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class UnswBookActivityDAO {
    public static void saveOrUpdate(UnswBookActivityEntity activity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(activity);
        session.getTransaction().commit();
        session.close();
    }
    public static UnswBookActivityEntity retrieve(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookActivityEntity user = session.get(UnswBookActivityEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return user;
    }
    public static List<UnswBookActivityEntity> getActivityByUserId(int uid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookActivityEntity WHERE userId=:userId";
        Query q = session.createQuery(hql);
        q.setParameter("userId",uid);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;

    }
    public static void delete(UnswBookActivityEntity activity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(activity);
        session.getTransaction().commit();
        session.close();
    }
}
