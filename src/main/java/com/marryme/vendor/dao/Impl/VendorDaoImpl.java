package com.marryme.vendor.dao.Impl;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.marryme.member.vo.Member;
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
	
	public void update(Vendor vendor) {
        // 只set 可以修改的欄位
		vendor.setVendorName(vendor.getVendorName());
		vendor.setVendorPhone(vendor.getVendorPhone());
		vendor.setVendorAddress(vendor.getVendorAddress());
		vendor.setVendorLocation(vendor.getVendorLocation());
		vendor.setCompanyId(vendor.getCompanyId());
		vendor.setContactPerson(vendor.getContactPerson());
		vendor.setVendorWebsite(vendor.getVendorWebsite());
		vendor.setVendorFb(vendor.getVendorFb());
		vendor.setVendorIg(vendor.getVendorIg());
		vendor.setGooglemap(vendor.getGooglemap());
//		vendor.setManufacturerCategory(vendor.getManufacturerCategory());

        getSession().merge(vendor);

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
