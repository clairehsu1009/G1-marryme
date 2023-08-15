package com.marryme.weddingVenue.service.impl;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.marryme.plan.vo.Plan;
import com.marryme.product.entity.Product;
import com.marryme.vendor.vo.Vendor;
import com.marryme.weddingVenue.dao.WeddingVenueDao;
import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.vo.WeddingVenue;

import com.marryme.weddingVenue.dao.impl.WeddingVenueDaoImpl;



public class WeddingVenueServiceImpl implements WeddingVenueService{

	    private final WeddingVenueDao dao;

	    
	    public WeddingVenueServiceImpl(){
	        dao = new WeddingVenueDaoImpl();
	    }

	    @Override
	    public List<WeddingVenue> findAllAndStatus(String statusType) {
	        List<WeddingVenue> weddingVenueList = new ArrayList<>();
	        try {
	            beginTransaction();
	            weddingVenueList = dao.selectAllAndStatus(statusType);
	            commit();
	        } catch (Exception e) {
	            rollback();
	            e.printStackTrace();
	        }

	        return weddingVenueList;
	    }
	    
	    @Override
	    public List<Plan> findPlanAllAndStatus(String statusType) {
	    	List<Plan> PlanList = new ArrayList<>();
	    	try {
	    		beginTransaction();
	    		PlanList = dao.selectPlanAllAndStatus(statusType);
	    		commit();
	    	} catch (Exception e) {
	    		rollback();
	    		e.printStackTrace();
	    	}
	    	
	    	return PlanList;
	    }
	    
	    @Override
	    public List<Product> findProductAllAndStatus(String statusType) {
	    	List<Product> ProductList = new ArrayList<>();
	    	try {
	    		beginTransaction();
	    		ProductList = dao.selectProductAllAndStatus(statusType);
	    		commit();
	    	} catch (Exception e) {
	    		rollback();
	    		e.printStackTrace();
	    	}
	    	
	    	return ProductList;
	    }

	   

	    @Override
	    public Optional<byte[]> findWeddingVenueById(Integer id) {
	        try {
	            beginTransaction();
	            commit();
	        } catch (Exception e) {
	            rollback();
	            e.printStackTrace();
	        }
	        return Optional.empty();
	    }


	  

	    @Override
	    public Optional<WeddingVenue> getPlacePicture(String fieldName) {
	    	 Optional<WeddingVenue> photo = Optional.empty();
	         try {
	             beginTransaction();
	             photo = dao.selectPhotoField(fieldName);
	             commit();
	         } catch (Exception e) {
	             rollback();
	             e.printStackTrace();
	         }
	         return photo;
	     }

		@Override
		public List<WeddingVenue> findAll() {
			// TODO Auto-generated method stub
			return null;
		}
	

		
		
		@Override
		public WeddingVenue getOne(Integer placeId) {
			WeddingVenue weddingVenue = null;
	        try {
	            beginTransaction();
	            weddingVenue = dao.selectById(placeId);
	            commit();
	        } catch (Exception e) {
	            rollback();
	            e.printStackTrace();
	        }
			return weddingVenue;
		}

		
		
		@Override
		public Optional<List<byte[]>> findWeddingVenuePlacePicById(Integer placeId) {
		     try {
		         beginTransaction();
		         //從數據庫中獲取婚禮場地的圖片
		         Optional<List<byte[]>> pictures = dao.getPlacePicAllById(placeId);
		         commit();	  		         		         
		         if (pictures.isPresent()) {
		             int size = pictures.get().size();  // 這裡取得pictures的size		             
		         }		         		         		         
		         return pictures;  // 將查詢到的結果回傳
		     } catch (Exception e) {
		         rollback();
		         e.printStackTrace();
		     }
		     return Optional.empty(); // 如果有錯誤或異常則回傳空的Optional
		}

		
		@Override
		public String findVendorLocationbyId(String id) {
		    Vendor vendor = null;
		    try {
		        beginTransaction();
		        vendor = dao.getVendorbyId(id);
		        commit();
		    } catch (Exception e) {
		        rollback();
		        e.printStackTrace();
		    }

		    if (vendor != null) {
		        return vendor.getVendorLocation();
		    } else {
		        return null; // 或是回傳其他預設值，例如 "位置未知"
		    }
		}

		@Override
		public String findVendorIdByPlaceId(Integer placeId) {
		    String vendorId = null;
		    try {
		        beginTransaction();
		        vendorId = dao.getVendorIdByPlaceId(placeId);
		        commit();  
		    } catch (Exception e) {
		        rollback();
		        e.printStackTrace();
		    }
		    return vendorId;
		}


		@Override
		public String findVendorLocationByPlaceId(String placeId) {
		    String vendorLocation = null;
		    try {
		        beginTransaction();
		        vendorLocation = dao.getVendorLocationByVendorId(placeId);
		        commit();  
		    } catch (Exception e) {
		        rollback();
		        e.printStackTrace();
		    }
		    return vendorLocation;
		}





}
