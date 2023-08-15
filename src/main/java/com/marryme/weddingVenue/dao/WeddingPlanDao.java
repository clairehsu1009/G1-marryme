package com.marryme.weddingVenue.dao;

import java.util.List;
import java.util.Optional;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Plan;

public interface WeddingPlanDao extends CoreDao<Plan, Integer>{

	/** 取得廠商符合狀態的資料 */
	List<Plan> selectAllByVendorIdAndStatus(String vendorId, String statusType);
	
	  /** 取得廠商符合狀態的資料 */
    List<Plan> selectAllAndStatus(String statusType);
	
	/** 取得場地photo */
    Optional<byte[]> selectPhotoByIdAndField(Integer planProductId, String fieldName);
}
