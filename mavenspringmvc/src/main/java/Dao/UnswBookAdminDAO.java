package Dao;

import Entity.UnswBookAdminEntity;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

public class UnswBookAdminDAO {

    public static void saveOrUpdate(UnswBookAdminEntity admin){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.saveOrUpdate(admin);
        session.getTransaction().commit();
        session.close();

    }

    public static UnswBookAdminEntity retrieve(String id){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        UnswBookAdminEntity admin = session.get(UnswBookAdminEntity.class,id);
        session.getTransaction().commit();
        session.close();
        return admin;
    }

    public static String validity(String username){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();
        String hql = "FROM UnswBookAdminEntity WHERE username=:username";
        Query q = session.createQuery(hql);
        q.setParameter("username",username);
        if (q==null){
            return null;
        }
        List list = q.list();
        UnswBookAdminEntity admin = null;
        Iterator iter = list.listIterator();
        String password = "";
        if (iter.hasNext()){
            admin = (UnswBookAdminEntity) iter.next();
            password = admin.getPassword();
        }

        session.close();
        return password;
    }

    public void delete(UnswBookAdminEntity admin){
        Session session = HibernateUtil.SESSION_FACTORY.openSession();
        session.beginTransaction();

        session.remove(admin);
        session.getTransaction().commit();
        session.close();
    }
}
