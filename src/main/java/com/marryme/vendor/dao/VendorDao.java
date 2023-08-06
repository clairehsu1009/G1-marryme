package com.marryme.vendor.dao;

import java.util.List;

import org.hibernate.Session;

import com.marryme.core.util.HibernateUtil;

import com.marryme.vendor.vo.Vendor;

public interface VendorDao{

	List<Vendor> selectAll();
	
	void insert(Vendor vendor);

	void update(Vendor vendor);
	
	int deleteById(Integer id);
	
	/** 搜尋廠商帳號 */
	Vendor selectByVendorId(String vendorId);
	
	/** 搜尋登入廠商帳號密碼 */
	Vendor selectForLogin(String vendorId, String vendorPassword);

	
	
	 default Session getSession() {
	        return HibernateUtil.getSessionFactory().getCurrentSession();
	    }

}
