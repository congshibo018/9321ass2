package Dao;

import Entity.UnswBookEntityEntity;
import Entity.UnswBookTripleEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookTripleDAO {


    public static void saveOrUpdate(UnswBookTripleEntity Entity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(Entity);
        session.getTransaction().commit();
        session.close();

    }


    public static UnswBookTripleEntity retrieve(int id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookTripleEntity Entity = session.get(UnswBookTripleEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return Entity;
    }


    public static List<UnswBookTripleEntity> findAll(){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE 1=1";
        Query q = session.createQuery(hql);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static List<UnswBookTripleEntity> getTripleByNodeFrom(String entityId){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE nodeFrom=:entityId";
        Query q =session.createQuery(hql);
        q.setParameter("entityId",entityId);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static List<UnswBookTripleEntity> getTripleByNodeTo(String entityId){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE nodeTo=:entityId";
        Query q =session.createQuery(hql);
        q.setParameter("entityId",entityId);
        if(q == null){
            return null;
        }
        List list = q.list();
        session.close();
        return list;
    }

    public static List<UnswBookTripleEntity> getTripleByFriendship(String entityId){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE nodeFrom=:entityId and edge=:edge";
        Query q =session.createQuery(hql);
        q.setParameter("entityId",entityId);
        q.setParameter("edge","E1");
        if(q == null){
            return null;
        }
        List list = q.list();

        String hql2 = "FROM UnswBookTripleEntity WHERE nodeTo=:entityId and edge=:edge";
        Query q2 =session.createQuery(hql2);
        q2.setParameter("entityId",entityId);
        q2.setParameter("edge","E1");
        if(q2 == null){
            return null;
        }
        List list2 = q2.list();
        session.close();

        list2.addAll(list);
        return list2;
    }

    public static UnswBookTripleEntity getVoteTripleId(String uid,String mid){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE nodeFrom=:uid and nodeTo=:mid";
        Query q = session.createQuery(hql);
        q.setParameter("uid",uid);
        q.setParameter("mid",mid);
        List list = q.list();
        UnswBookTripleEntity triple = null;
        Iterator iter = list.listIterator();

        if (iter.hasNext()){
            triple = (UnswBookTripleEntity) iter.next();
        }else{
            triple = new UnswBookTripleEntity();
            triple.setNodeFrom(uid);
            triple.setNodeTo(mid);
            triple.setEdge("E3");
        }
        session.getTransaction().commit();
        session.close();
        return triple;
    }
    public static void deleteRelated(String entityId){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookTripleEntity WHERE nodeTo=:entityId";
        Query q =session.createQuery(hql);
        q.setParameter("entityId",entityId);
        if(q == null){
            return ;
        }
        List list = q.list();
        for(Object entity:list){
            session.remove(entity);
        }
        session.getTransaction().commit();
        session.close();
    }
    public static void delete(UnswBookTripleEntity Entity){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(Entity);
        session.getTransaction().commit();
        session.close();
    }
}
