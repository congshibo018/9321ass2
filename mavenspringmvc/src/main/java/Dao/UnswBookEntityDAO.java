package Dao;

import Entity.UnswBookEntityEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

public class UnswBookEntityDAO {


    public static void saveOrUpdate(UnswBookEntityEntity Entity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(Entity);
        session.getTransaction().commit();
        session.close();

    }


    public static UnswBookEntityEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookEntityEntity Entity = session.get(UnswBookEntityEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return Entity;
    }


    public static List<UnswBookEntityEntity> findAll(){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookEntityEntity WHERE 1=1";
        Query q = session.createQuery(hql);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static List<UnswBookEntityEntity> getEntityByEntityId(String entityId){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookEntityEntity WHERE entityId=:entityId";
        Query q =session.createQuery(hql);
        q.setParameter("entityId",entityId);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static void delete(UnswBookEntityEntity Entity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(Entity);
        session.getTransaction().commit();
        session.close();
    }
}
