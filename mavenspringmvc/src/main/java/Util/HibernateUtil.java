package Util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
    public static final SessionFactory SESSION_FACTORY = buildSessionFactory();
    private static SessionFactory buildSessionFactory(){
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        try{
            return new MetadataSources(registry).buildMetadata().buildSessionFactory();
        }catch (Exception e ){
            StandardServiceRegistryBuilder.destroy(registry);
            throw new RuntimeException(e);
        }
    }

    public static void shutdown(){
        if (SESSION_FACTORY != null){
            SESSION_FACTORY.close();
        }
    }
}

