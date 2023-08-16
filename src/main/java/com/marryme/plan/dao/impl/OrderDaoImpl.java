package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.OrderDao;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanOrder;
import org.hibernate.query.Query;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import static java.time.LocalTime.now;

/**
 * ClassName: OrderDaoImpl
 * Package: com.marryme.plan.dao.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/2 下午 09:23
 * @Version 1.0
 */
public class OrderDaoImpl implements OrderDao {
    @Override
    public List<PlanOrder> selectAll() {
        String hql = "FROM PlanOrder";
        return getSession().createQuery(hql, PlanOrder.class).list();
    }

    @Override
    public List<PlanOrder> selectAllByVendorId(String vendorId) {
        String hql = "SELECT po FROM PlanOrder po WHERE po.planProductId IN (SELECT pp.planProductId FROM Plan pp WHERE pp.vendorId = :vendorId)";

        Query<PlanOrder> query = getSession().createQuery(hql, PlanOrder.class);
        query.setParameter("vendorId", vendorId);
        return query.list();
    }

    @Override
    public List<PlanOrder> selectAllByMemberId(String memberId) {
        String hql = "FROM PlanOrder WHERE memberId = :memberId";
        Query<PlanOrder> query = getSession().createQuery(hql, PlanOrder.class);
        query.setParameter("memberId", memberId);
        return query.list();
    }

    @Override
    public PlanOrder selectById(Integer id) {
        return getSession().get(PlanOrder.class, id);
    }

    @Override
    public Integer insert(PlanOrder vo) {
        vo.setOrderStatus(vo.getOrderStatus() == null ? 0 : vo.getOrderStatus());
        vo.setPaymentMethod(vo.getPaymentMethod() == null ? 1 : vo.getPaymentMethod());
        vo.setPaymentState(vo.getPaymentState() == null ? 2 : vo.getPaymentState());
        vo.setOrderDateTime(vo.getOrderDateTime() == null ? new Timestamp(new Date().getTime()) : vo.getOrderDateTime());
        vo.setGrantAmount(vo.getGrantAmount() == null? 0 : vo.getGrantAmount());
        getSession().save(vo);
        return vo.getPlanOrderId();

    }

    @Override
    public void update(Integer id, PlanOrder vo) {

    }

    @Override
    public void deleteById(Integer id) {

    }
}
