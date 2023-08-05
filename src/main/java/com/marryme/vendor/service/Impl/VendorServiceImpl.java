package com.marryme.vendor.service.Impl;

import java.time.LocalDate;
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
	
	public Vendor login(Vendor vendor) {
	    final String username = vendor.getVendorId();
	    final String password = vendor.getVendorPassword();

	    if (username == null || password == null) {
	        return null;
	    }

	    beginTransaction();
	    vendor = dao.selectForLogin(username, password);
	    try {
	        if (vendor == null) {
	            rollback();
	            return null;
	        } else {
	            commit();
	            return vendor;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return null;
	    }
	}
	
	public Vendor register(Vendor vendor) {
	    if (vendor.getVendorId() == null || vendor.getVendorPassword() == null) {
	        return null;
	    }

	    beginTransaction();
	    Vendor existingVendor = dao.selectByVendorId(vendor.getVendorId());
	    try {
	        if (existingVendor != null) {
	            rollback();
	            return null;
	        }
	        vendor.setVendorRegistrationTime(LocalDate.now());
	        dao.insert(vendor);
	        commit();
	        return vendor;
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return null;
	    }
	}
	
	@Override
	public Vendor edit(Vendor vendor) {
		if (vendor == null) {
			vendor = new Vendor();
            return vendor;
		}
		
		if (vendor.getVendorId() == null) {
            return vendor;
		}
		
		try {
			beginTransaction();
			dao.update(vendor);
			commit();
			return vendor;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		     return vendor;
		}
	}
	
}
