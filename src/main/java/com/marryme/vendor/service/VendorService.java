package com.marryme.vendor.service;

import java.util.List;

import com.marryme.core.service.CoreService;
import com.marryme.vendor.vo.Vendor;


public interface VendorService extends CoreService{
	

	List<Vendor> findAll();
	
	Vendor login(Vendor vendor);
	
	Vendor register(Vendor vendor);
	
	Vendor edit(Vendor vendor);


}
