package com.marryme.plan.service.impl;

import com.marryme.plan.dao.PlaceDao;
import com.marryme.plan.dao.PlanDao;
import com.marryme.plan.dao.impl.PlaceDaoImpl;
import com.marryme.plan.dao.impl.PlanDaoImpl;
import com.marryme.plan.service.PlanService;
import com.marryme.plan.vo.Place;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanDetail;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: PlanServiceImpl
 * Package: marryme.plan.service
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 02:07
 * @Version 1.0
 */
public class PlanServiceImpl implements PlanService {
    private final PlanDao dao;

    public PlanServiceImpl(){
        dao = new PlanDaoImpl();
    }

    @Override
    public List<Plan> findAllByVendorId(String vendorId) {
        List<Plan> planList = new ArrayList<>();
        try {
            beginTransaction();
            planList = dao.selectAllByVendorId(vendorId);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planList;
    }

    @Override
    public List<Plan> findAllByVendorIdAndStatus(String vendorId, String statusType) {
        List<Plan> planList = new ArrayList<>();
        try {
            beginTransaction();
            planList = dao.selectAllByVendorIdAndStatus(vendorId, statusType);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planList;
    }
    @Override
    public List<Plan> findAll() {
        List<Plan> planList = new ArrayList<>();
        try {
            beginTransaction();
            planList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planList;
    }

    @Override
    public Plan getOne(Integer id) {
        Plan plan = null;
        try {
            beginTransaction();
            plan = dao.selectById(id);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return plan;
    }



    @Override
    public Integer insertPlanWithDetails(Plan plan, List<Integer> places) {
        Integer planId = null;
        try {
            beginTransaction();
        // 創建對應數量的 PlanDetail
            List<PlanDetail> planDetails = new ArrayList<>();


        for (int i = 0; i < places.size(); i++) {
            PlanDetail planDetail = new PlanDetail();
            // 判斷是否為null
            if(places.get(i) != null) {
                planDetail.setPlaceId(places.get(i));
            }
            planDetails.add(planDetail);
        }
        // 把 PlanDetail 加入到 Plan 的 PlanDetail 屬性中
            plan.setPlanDetail(planDetails);

        // 儲存 Plan 物件，Hibernate 會自動處理 PlanDetail 的保存
            planId = dao.insert(plan);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planId;
    }

    @Override
    public boolean update(Integer id, Plan plan) {
        boolean result = false;
        try {
            beginTransaction();
            dao.update(id, plan);
            commit();
            result = true;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean changeStatusToInactive(Integer id) {
        boolean result = false;
        try {
            beginTransaction();
            dao.changeStatusToInactive(id);
            commit();
            result = true;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return result;
    }




}
