package com.marryme.weddingVenue.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.marryme.reservation.vo.Reservation;
import com.marryme.weddingVenue.dao.WeddingPlanDao;
import com.marryme.weddingVenue.dao.impl.WeddingPlanDaoImpl;
import com.marryme.weddingVenue.service.WeddingPlanService;
import com.marryme.plan.vo.Plan;


public class WeddingPlanServiceImpl implements WeddingPlanService{
	
    private final WeddingPlanDao dao;
    
    public WeddingPlanServiceImpl(){
        dao = new WeddingPlanDaoImpl();
    }
	
	
	
	@Override
    public List<Plan> findAllByVendorIdAndStatus(String vendorId, String statusType) {
        List<Plan> weddingPlaceList = new ArrayList<>();
        try {
            beginTransaction();
            weddingPlaceList = dao.selectAllByVendorIdAndStatus(vendorId, statusType);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }

        return weddingPlaceList;
    }
	
	
	
	@Override
    public List<Plan> findAllAndStatus(String statusType) {
        List<Plan> WeddingPlanList = new ArrayList<>();
        try {
            beginTransaction();
            WeddingPlanList = dao.selectAllAndStatus(statusType);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }

        return WeddingPlanList;
    }
	
	
	
	/** 取得場地photo */
    @Override
    public Optional<byte[]> getPlacePhoto(Integer planProductId, String fieldName) {
        Optional<byte[]> photo = Optional.empty();
        try {
            beginTransaction();
            photo = dao.selectPhotoByIdAndField(planProductId, fieldName);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return photo;
    }
    
    
    @Override
	public Plan getOne(Integer planProductId) {
		Plan weddingPlan = null;
        try {
            beginTransaction();
            weddingPlan = dao.selectById(planProductId);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
		return weddingPlan;
	}
    
    
    
}
