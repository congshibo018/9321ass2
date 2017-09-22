package Dao;

import Entity.UnswBookLikeEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class UnswBookLikeDAO {

    public static void saveOrUpdate(UnswBookLikeEntity like){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(like);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookLikeEntity retrieve(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookLikeEntity like = session.get(UnswBookLikeEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return like;
    }



    public void delete(UnswBookLikeEntity like){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(like);
        session.getTransaction().commit();
        session.close();
    }
}
