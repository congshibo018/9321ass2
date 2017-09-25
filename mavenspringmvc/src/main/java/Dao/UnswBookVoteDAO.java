package Dao;

import Entity.UnswBookVoteEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookVoteDAO {

    public static void saveOrUpdate(UnswBookVoteEntity vote){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(vote);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookVoteEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookVoteEntity vote = session.get(UnswBookVoteEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return vote;
    }


    public static int getVote(int uid,int mid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        String hql = "FROM UnswBookVoteEntity WHERE userId=:uid and messageId=:mid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        q.setParameter("mid",mid);

        List list = q.list();
        UnswBookVoteEntity vote = null;
        Iterator iter = list.listIterator();
        int like=0;
        if (iter.hasNext()){
            vote = (UnswBookVoteEntity) iter.next();
            like = vote.getThumbUp();
        }
        session.close();
        return like;
    }

    public static void delete(UnswBookVoteEntity vote){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(vote);
        session.getTransaction().commit();
        session.close();
    }
}
