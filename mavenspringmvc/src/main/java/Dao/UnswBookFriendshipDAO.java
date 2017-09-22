package Dao;

import Entity.UnswBookFriendshipEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookFriendshipDAO {

    public static void saveOrUpdate(Entity.UnswBookFriendshipEntity friendship){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(friendship);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookFriendshipEntity retrieve(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        Entity.UnswBookFriendshipEntity friendship = session.get(Entity.UnswBookFriendshipEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return friendship;
    }

    public static List<Integer> getFriendByUserId(int uid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        String hql = "SELECT fid FROM UnswBookFriendshipEntity WHERE uid=:uid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        if (q==null){
            return null;
        }
        List list = q.list();

        session.close();
        return list;
    }

    public void delete(Entity.UnswBookFriendshipEntity friendship){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(friendship);
        session.getTransaction().commit();
        session.close();
    }
}
