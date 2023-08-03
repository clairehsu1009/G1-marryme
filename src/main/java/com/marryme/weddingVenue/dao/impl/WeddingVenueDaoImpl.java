package com.marryme.weddingVenue.dao.impl;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.marryme.core.util.HibernateUtil;
import com.marryme.weddingVenue.dao.WeddingVenueDao;
import com.marryme.weddingVenue.vo.WeddingVenue;
import com.marryme.vendor.vo.Vendor;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static com.marryme.common.CommonString.ACTIVE;

public class WeddingVenueDaoImpl implements WeddingVenueDao{



		@Override
	    public List<WeddingVenue> selectAll() {
	        String hql = "FROM WeddingVenue";
	        return getSession().createQuery(hql, WeddingVenue.class).list();
	    }

	    @Override
	    public WeddingVenue selectById(Integer id) {
	        return getSession().get(WeddingVenue.class, id);
	    }
	 

	    @Override
	    public void deleteById(Integer id) {
	        Session session = getSession();
	        WeddingVenue weddingVenue = session.get(WeddingVenue.class, id);
	        session.remove(weddingVenue);
	    }

	    @Override
	    public List<WeddingVenue> selectAllAndStatus(String statusType) {
	        // 狀態 0下架 INACTIVE /  1上架 ACTIVE
	        int status = ACTIVE.equals(statusType) ? 1 : 0;
	        String hql = "FROM WeddingVenue WHERE status = :status";
	        Query<WeddingVenue> query = getSession().createQuery(hql, WeddingVenue.class);
	        query.setParameter("status", status);
	        return query.list();

	    }
	    
	    @Override
	    public Optional<WeddingVenue> selectPhotoField(String placePicture) {
	        // 確認提供的 fieldName 是否為有效的圖片欄位名稱，
	        List<String> validPhotoFieldNames = List.of("placePicture");
	        if (!validPhotoFieldNames.contains(placePicture)) {
	            return Optional.empty();
	        }
	        // 根據提供的 fieldName 動態組裝 HQL 查詢語句，並只查詢該欄位的資料
	        String hql = "SELECT placePicture FROM WeddingVenue WHERE status = :status";
	        Query<WeddingVenue> query = getSession().createQuery(hql, WeddingVenue.class);

	        List<WeddingVenue> photos = query.list();

	        if (!photos.isEmpty()) {
	            // photos.get(0) 包含了查詢結果的圖片資料
	            return Optional.ofNullable(photos.get(0));
	        } else {
	            return Optional.empty();
	        }
	    }
	    
	 
	    
	    @Override
	    public Optional<List<byte[]>> getPlacePicAllById(Integer placeId) {
	        List<byte[]> pictures = new ArrayList<>();

	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            // 使用 HQL 查詢場地的圖片
	        	String hql = "SELECT placePicture, placePictures2, placePictures3, placePictures4, placePictures5 FROM WeddingVenue WHERE placeId = :placeId";
	            Query<Object[]> query = session.createQuery(hql);
	            query.setParameter("placeId", placeId);

	            // 執行查詢並取得結果
	            Object[] results = query.uniqueResult();

	            if (results != null) {
	                for(Object result : results) {
	                    if(result != null) {
	                        pictures.add((byte[]) result);
	                    }
	                }
	            }
	            return Optional.of(pictures);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return Optional.empty();
	    }

	    
	    
	    
	    @Override
	    public Optional<byte[]> getPlacePictureById(Integer id) {
	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            // 使用 HQL 查詢場地的圖片
	            String hql = "SELECT placePicture FROM WeddingVenue WHERE placeId = :placeId";
	            Query<byte[]> query = session.createQuery(hql, byte[].class);

	            query.setParameter("placeId", id);
	            System.out.println(query.list());
	            // 執行查詢並取得結果
	            List<byte[]> photos = query.list();

	            if (!photos.isEmpty()) {
	                return Optional.ofNullable(photos.get(0));
	            } else {
	                return Optional.empty();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return Optional.empty();
	    }


	    @Override
	    public Vendor getVendorbyId(String id) {
	        String hql = "FROM Vendor v " + // 注意這裡我使用了Vendor而不是完整的資料表名，因為在HQL中我們使用的是Java實體類名稱
	                     "JOIN v.planPlace p " + // 假設Vendor實體中有planPlace屬性
	                     "WHERE p.vendorId = :vendorId"; // 注意這裡的變量名稱

	        Query<Vendor> query = getSession().createQuery(hql, Vendor.class);
	        query.setParameter("vendorId", id);
	        return query.uniqueResult(); // 返回單一結果
	    }


		
	    
	    
	    
	    
		@Override
		public Integer insert(WeddingVenue pojo) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public void update(Integer id, WeddingVenue pojo) {
			// TODO Auto-generated method stub
			
		}

		
	}
	








