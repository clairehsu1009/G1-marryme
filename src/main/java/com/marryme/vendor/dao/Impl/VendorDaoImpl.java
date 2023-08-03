package com.marryme.vendor.dao.Impl;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;


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
	
	@Override
	public int update(Vendor vendor) {
		final StringBuilder hql = new StringBuilder()
				.append("UPDATE Vendor SET ");
		final String password = vendor.getVendorPassword();
		if (password != null && !password.isEmpty()) {
			hql.append("password = :password,");
		}
		hql.append("vendorName = :vendorName, ")
			.append("vendorPhone = :vendorPhone, ")
			.append("vendorLocation = :vendorLocation, ")
			.append("vendorAddress = :vendorAddress, ")
			.append("vendorWebsite = :vendorWebsite, ")
			.append("vendorFb = :vendorFb, ")
			.append("vendorIg = :vendorIg, ")
			.append("companyId = :companyId, ")
			.append("contactPerson = :contactPerson, ")
			.append("basicIntroduction = :basicIntroduction, ")
			.append("googlemap = :googlemap, ")
			.append("vendorRegistrationTime = NOW() ")
			.append("WHERE vendorId = :vendorId");
		Query query = getSession().createQuery(hql.toString());
		if (password != null && !password.isEmpty()) {
			query.setParameter("password", vendor.getVendorPassword());
		}
		return query.setParameter("vendorName", vendor.getVendorName())
		        .setParameter("vendorPhone", vendor.getVendorPhone())
		        .setParameter("vendorLocation", vendor.getVendorLocation())
		        .setParameter("vendorAddress", vendor.getVendorAddress())
		        .setParameter("vendorWebsite", vendor.getVendorWebsite())
		        .setParameter("vendorFb", vendor.getVendorFb())
		        .setParameter("vendorIg", vendor.getVendorIg())
		        .setParameter("companyId", vendor.getCompanyId())
		        .setParameter("contactPerson", vendor.getContactPerson())
		        .setParameter("basicIntroduction", vendor.getBasicIntroduction())
		        .setParameter("googlemap", vendor.getGooglemap())
		        .setParameter("vendorId", vendor.getVendorId())
				.executeUpdate();
	}
	
	
	
	@Override
	public Vendor selectById(String vendorId) {
		return getSession().get(Vendor.class, vendorId);
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
		Session session = getSession();
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Vendor> criteriaQuery = criteriaBuilder.createQuery(Vendor.class);
		Root<Vendor> root = criteriaQuery.from(Vendor.class);
		criteriaQuery.where(criteriaBuilder.equal(root.get("vendorId"), vendorId));
		return session.createQuery(criteriaQuery).uniqueResult();
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
