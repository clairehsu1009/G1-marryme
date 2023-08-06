package com.marryme.weddingVenue.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
	

}
