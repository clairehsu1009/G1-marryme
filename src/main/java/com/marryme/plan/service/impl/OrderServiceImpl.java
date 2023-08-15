package com.marryme.plan.service.impl;

import com.marryme.plan.dao.OrderDao;
import com.marryme.plan.dao.UnavailableDateDao;
import com.marryme.plan.dao.impl.OrderDaoImpl;
import com.marryme.plan.dao.impl.UnavailableDateDaoImpl;
import com.marryme.plan.service.OrderService;
import com.marryme.plan.vo.PlanOrder;
import com.marryme.plan.vo.PlanOrderDetail;
import com.marryme.plan.vo.UnavailableDates;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: OrderServiceImpl
 * Package: com.marryme.plan.service.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/2 下午 09:43
 * @Version 1.0
 */
public class OrderServiceImpl implements OrderService {
    private final OrderDao dao;
    private final UnavailableDateDao unavailableDateDao;

    public OrderServiceImpl(){
        dao = new OrderDaoImpl();
        unavailableDateDao = new UnavailableDateDaoImpl();
    }


    @Override
    public Integer insertUnavailableDateAndOrder(UnavailableDates unavailableDates, PlanOrder planOrder, List<Integer> items) {
        Integer planOrderId = null;
        try {
            beginTransaction();
            Integer unavailableDatesId = unavailableDateDao.insertValues(unavailableDates);
            planOrder.setUnavailableDatesId(unavailableDatesId);

            planOrderId = dao.insert(planOrder);
            planOrder.setPlanOrderId(planOrderId);

            // 創建對應數量的 PlanDetail
            List<PlanOrderDetail> planOrderDetails = new ArrayList<>();

            for (int i = 0; i < items.size(); i++) {
                PlanOrderDetail planOrderDetail = new PlanOrderDetail();
                planOrderDetail.setPlanOrderId(planOrder.getPlanOrderId());
                // 判斷是否為null
                if(items.get(i) != null) {
                    planOrderDetail.setPlanItemId(items.get(i));
                }
                planOrderDetails.add(planOrderDetail);
            }
            // 把 planOrderDetails 加入到 PlanOrder 的 planOrderDetail 屬性中

            planOrder.setPlanOrderDetail(planOrderDetails);

            // 儲存 PlanOrder 物件，Hibernate 會自動處理 planOrderDetail 的保存
//            planOrderId = dao.insert(planOrder); 暫時先註解
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planOrderId;
    }

    @Override
    public List<PlanOrder> findAllByMemberId(String memberId) {
        List<PlanOrder> orderList = new ArrayList<>();
        try {
            beginTransaction();
            orderList = dao.selectAllByMemberId(memberId);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public List<PlanOrder> findAll() {
        List<PlanOrder> orderList = new ArrayList<>();
        try {
            beginTransaction();
            orderList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public PlanOrder getOne(Integer id) {
        PlanOrder planOrder = null;
        try {
            beginTransaction();
            planOrder = dao.selectById(id);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planOrder;
    }
}
