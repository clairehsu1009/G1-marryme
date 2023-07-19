package com.marryme.core.service;


import com.marryme.core.util.HibernateUtil;
import org.hibernate.Transaction;

/**
 * ClassName: CoreService
 * Package: marryme.core.service
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/14 下午 01:42
 * @Version 1.0
 */
public interface CoreService {

    // 開始執行交易
    default Transaction beginTransaction() {
        return HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
    }

    // 交易結束儲存
    default void commit() {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
    }

    // 取消交易 全部恢復原狀
    default void rollback() {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
    }
}
