package com.marryme.weddingVenue.dao;

import java.util.List;
import java.util.Optional;

import com.marryme.core.dao.CoreDao;
import com.marryme.vendor.vo.Vendor;
import com.marryme.weddingVenue.vo.WeddingVenue;



public interface WeddingVenueDao extends CoreDao<WeddingVenue, Integer>  {

	    /** 取得廠商符合狀態的資料 */
	    List<WeddingVenue> selectAllAndStatus(String statusType);

	    /** 取得場地photo */
	    Optional<WeddingVenue> selectPhotoField(String fieldName);
	

	    Optional<List<byte[]>> getPlacePicAllById(Integer placeId);
	    
	    Optional<byte[]> getPlacePictureById(Integer id);
	    

	    Vendor getVendorbyId(String id);
		
}
