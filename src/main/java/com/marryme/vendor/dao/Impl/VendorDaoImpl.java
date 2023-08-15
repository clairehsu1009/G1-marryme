package com.marryme.vendor.dao.Impl;


import java.util.List;

import org.hibernate.Session;
import com.marryme.vendor.dao.VendorDao;
import com.marryme.vendor.vo.Vendor;

public class VendorDaoImpl implements VendorDao {
	
	
	public void insert(Vendor vendor) {
		getSession().persist(vendor);
	
	}
	
	@Override
	public int deleteById(Integer id) {
		Session session = getSession();
		Vendor vendor = session.load(Vendor.class, id);
		session.remove(vendor);
		return 1;
	}
	
//	public void update(Vendor vendor) {
//        // 只set 可以修改的欄位
//		vendor.setVendorName(vendor.getVendorName());
//		vendor.setVendorPhone(vendor.getVendorPhone());
//		vendor.setVendorAddress(vendor.getVendorAddress());
//		vendor.setVendorLocation(vendor.getVendorLocation());
//		vendor.setCompanyId(vendor.getCompanyId());
//		vendor.setContactPerson(vendor.getContactPerson());
//		vendor.setVendorWebsite(vendor.getVendorWebsite());
//		vendor.setVendorFb(vendor.getVendorFb());
//		vendor.setVendorIg(vendor.getVendorIg());
//		vendor.setGooglemap(vendor.getGooglemap());
//
//        getSession().merge(vendor);
//
//    }
	
	public void update(Vendor vendor) {
	    if (vendor == null || vendor.getVendorId() == null) {
	        return;
	    }
	    
	    Vendor existingVendor = getSession().get(Vendor.class, vendor.getVendorId());
	    
	    if (existingVendor == null) {
	        return;
	    }
	    
	    if (vendor.getVendorName() != null) {
	    	existingVendor.setVendorName(vendor.getVendorName());
	    }
	    
	    if (vendor.getVendorPhone() != null) {
	    	existingVendor.setVendorPhone(vendor.getVendorPhone());
	    }
	    
	    if (vendor.getVendorAddress() != null) {
	    	existingVendor.setVendorAddress(vendor.getVendorAddress());
	    }
	    
	    if (vendor.getVendorLocation() != null) {
	    	existingVendor.setVendorLocation(vendor.getVendorLocation());
	    }
	    
	    if (vendor.getVendorPassword() != null) {
	    	existingVendor.setVendorPassword(vendor.getVendorPassword());
	    }
	    
	    if (vendor.getVendorWebsite() != null) {
	    	existingVendor.setVendorWebsite(vendor.getVendorWebsite());
	    }
	    
	    if (vendor.getVendorFb() != null) {
	    	existingVendor.setVendorFb(vendor.getVendorFb());
	    }
	    
	    if (vendor.getVendorIg() != null) {
	    	existingVendor.setVendorIg(vendor.getVendorIg());
	    }
	    
	    if (vendor.getCompanyId() != null) {
	    	existingVendor.setCompanyId(vendor.getCompanyId());
	    }
	    
	    if (vendor.getContactPerson() != null) {
	    	existingVendor.setContactPerson(vendor.getContactPerson());
	    }
	    
	    getSession().merge(existingVendor);
	}
	
	
	

	@Override
	public List<Vendor> selectAll() {
		final String hql = "FROM Vendor ORDER BY vendorId";
		return getSession()
				.createQuery(hql, Vendor.class)
				.getResultList();
	}
	
	
	@Override
	public Vendor selectByVendorId(String vendorId) {
		return getSession().get(Vendor.class, vendorId);
	}
	
	
	@Override
	public Vendor selectForLogin(String vendorId, String vendorPassword) {
		final String sql = "select * from Vendor "
				+ "where vendor_id = :vendorId and vendor_password = :vendorPassword";
		return getSession().createNativeQuery(sql, Vendor.class)
				.setParameter("vendorId", vendorId)
				.setParameter("vendorPassword", vendorPassword)
				.uniqueResult();
	}
	
	
	

}
