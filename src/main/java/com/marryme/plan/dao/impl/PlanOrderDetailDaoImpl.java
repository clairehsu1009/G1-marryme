package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.PlanOrderDetailDao;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanOrderDetail;
import org.hibernate.query.Query;

import java.util.List;

/**
 * ClassName: PlanOrderDetailDao
 * Package: com.marryme.plan.dao.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/16 下午 05:54
 * @Version 1.0
 */
public class PlanOrderDetailDaoImpl implements PlanOrderDetailDao {
    @Override
    public List<PlanOrderDetail> selectAllByOrderId(Integer planOrderId) {
        String hql = "FROM PlanOrderDetail WHERE planOrderId = :planOrderId";
        Query<PlanOrderDetail> query = getSession().createQuery(hql, PlanOrderDetail.class);
        query.setParameter("planOrderId", planOrderId);
        return query.list();
    }

    @Override
    public List<PlanOrderDetail> selectAll() {
        return null;
    }

    @Override
    public PlanOrderDetail selectById(Integer id) {
        return null;
    }

    @Override
    public Integer insert(PlanOrderDetail pojo) {
        return null;
    }

    @Override
    public void update(Integer id, PlanOrderDetail pojo) {

    }

    @Override
    public void deleteById(Integer id) {

    }
}
