package com.marryme.core.dao;

import com.marryme.core.util.HibernateUtil;
import org.hibernate.Session;
import java.util.List;



/**
 * ClassName: CoreDao
 * Package: marryme.core.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/14 下午 01:44
 * @Version 1.0
 */
public interface CoreDao<P, I> {

    List<P> selectAll();
    P selectById(I id);
    Integer insert(P pojo);
    void update(I id, P pojo);
    void deleteById(I id);

    default Session getSession() {
        return HibernateUtil.getSessionFactory().getCurrentSession();
    }
}
