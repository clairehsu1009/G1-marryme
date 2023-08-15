package com.marryme.weddingVenue.service;

import java.util.List;
import java.util.Optional;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Plan;


public interface WeddingPlanService extends CoreService{

	/** 取得廠商符合狀態的資料 */
    List<Plan> findAllByVendorIdAndStatus(String vendorId, String statusType);
    
    /** 取得廠商符合狀態的資料 */
    List<Plan> findAllAndStatus(String statusType);
    
    
    Plan getOne (Integer id);
    
    /** 取得場地photo */
    Optional<byte[]> getPlacePhoto(Integer planProductId, String fieldName);
}
