package com.marryme.core.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 * ClassName: HibernateUtil
 * Package: marryme.core.util
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/14 上午 11:15
 * @Version 1.0
 */
public class HibernateUtil {
    private static StandardServiceRegistry registry; //介面定義了建立和配置服務註冊表的操作
    private static SessionFactory sessionFactory;

    private static void buildSessionFactory() {
        try {
            registry = new StandardServiceRegistryBuilder().configure().build();
            MetadataSources metadataSource = new MetadataSources(registry);
            Metadata metadata = metadataSource.getMetadataBuilder().build();
            sessionFactory = metadata.getSessionFactoryBuilder().build();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            buildSessionFactory();
        }
        return sessionFactory;
    }

    public static void shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
}
