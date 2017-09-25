package Dao;

import Entity.UnswBookFriendshipEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookFriendshipDAO {

    public static void saveOrUpdate(UnswBookFriendshipEntity friendship){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(friendship);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookFriendshipEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookFriendshipEntity friendship = session.get(UnswBookFriendshipEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return friendship;
    }

    public static List<Integer> getFriendByUserId(int uid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        String hql = "SELECT fid FROM UnswBookFriendshipEntity WHERE status='1' and uid=:uid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        if (q==null){
            return null;
        }
        List list = q.list();

        session.close();
        return list;
    }

    public static boolean checkFriendship(int uid,int fid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        String hql = "FROM UnswBookFriendshipEntity WHERE status='1' and uid=:uid and fid=:fid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        q.setParameter("fid",fid);
        if (q==null){
            return false;
        }
        if (q.list().size()==0){
            return false;
        }
        session.close();
        return true;
    }

    public static int getFriendshipByTwoId(int uid,int fid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookFriendshipEntity fs = null;
        String hql = "FROM UnswBookFriendshipEntity WHERE uid=:uid and fid=:fid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        q.setParameter("fid",fid);
        int fsid = -1;
        if (q==null){
            return -1;
        }
        if (q.list().size()==0){
            return -1;
        }
        List list = q.list();
        Iterator iter = list.listIterator();
        if (iter.hasNext()){
            fs = (UnswBookFriendshipEntity) iter.next();
            fsid = fs.getId();
        }
        session.close();
        return fsid;
    }

    public static void delete(UnswBookFriendshipEntity friendship){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(friendship);
        session.getTransaction().commit();
        session.close();
    }
}
