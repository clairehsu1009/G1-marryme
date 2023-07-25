package com.marryme.vendor.service.Impl;


import java.util.ArrayList;
import java.util.List;

import com.marryme.member.dao.impl.MemberDaoImpl;
import com.marryme.member.vo.Member;
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

}
