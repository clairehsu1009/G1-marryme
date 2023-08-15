package com.marryme.weddingVenue.service;

import java.util.List;
import java.util.Optional;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Plan;
import com.marryme.product.entity.Product;
import com.marryme.vendor.vo.Vendor;
import com.marryme.weddingVenue.vo.WeddingVenue;

public interface WeddingVenueService extends CoreService{


	    /** 取得廠商符合狀態的資料 */
	    List<WeddingVenue> findAllAndStatus(String statusType);
	    
	    /** 取得方案符合狀態的資料 */
	    List<Plan> findPlanAllAndStatus(String statusType);
	    
	    /** 取得方案符合狀態的資料 */
	    List<Product> findProductAllAndStatus(String statusType);
	    
	    /** 取得Vendor廠商的資料 */
	    List<Vendor> findVendorAllByVendorId(String vendorId);
	    
	    /** 取得所有方案場地 */
	    Optional<List<byte[]>> findWeddingVenuePlacePicById(Integer id);
	    
	    
	    Optional<byte[]> findWeddingVenueById(Integer id);

	    /*取圖片*/
	    Optional<WeddingVenue> getPlacePicture(String fieldName);
	    
	    
	    List<WeddingVenue> findAll();
	    
	    WeddingVenue getOne (Integer id);
	    
	    String findVendorLocationbyId(String id);
	    
	    String findVendorIdByPlaceId(Integer placeId);
	    
	    String findVendorLocationByPlaceId(String placeId);

	    String findVendorAllString(String id);
	    
	    
}
