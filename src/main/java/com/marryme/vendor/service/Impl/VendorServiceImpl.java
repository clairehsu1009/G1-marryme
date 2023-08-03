package com.marryme.vendor.service.Impl;

import java.util.ArrayList;
import java.util.List;

import com.marryme.vendor.dao.VendorDao;
import com.marryme.vendor.dao.Impl.VendorDaoImpl;
import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.vo.Vendor;

public class VendorServiceImpl implements VendorService{
	
	
	private VendorDao dao;

	public VendorServiceImpl() {
		dao = new VendorDaoImpl();
	}
	
	
	@Override
	public List<Vendor> findAll() {
		List<Vendor> vendorList = new ArrayList<>();
        try {
            beginTransaction();
            vendorList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return vendorList;
    }
	
	public boolean login(Vendor vendor) {
	    final String username = vendor.getVendorId();
	    final String password = vendor.getVendorPassword();

	    if (username == null || password == null) {
	        return false;
	    }

	    beginTransaction();
	    vendor = dao.selectForLogin(username, password);
	    try {
	        if (vendor == null) {
	            rollback();
	            return false;
	        } else {
	            commit();
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return false;
	    }
	}

}
