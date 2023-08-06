package com.marryme.weddingVenue.service;

import java.util.List;
import java.util.Optional;

import com.marryme.core.service.CoreService;
import com.marryme.weddingVenue.vo.WeddingVenue;

public interface WeddingVenueService extends CoreService{


	    /** 取得廠商符合狀態的資料 */
	    List<WeddingVenue> findAllAndStatus(String statusType);
	    /** 取得所有方案場地 */
//	    Optional<WeddingVenue> findWeddingVenueById(Integer id);	  
	    Optional<byte[]> findWeddingVenueById(Integer id);

	    /*取圖片*/
	    Optional<WeddingVenue> getPlacePicture(String fieldName);
	    
	    
	    List<WeddingVenue> findAll();
	    
	    
}
