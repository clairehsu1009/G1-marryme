package com.marryme.member.util;

import com.marryme.emp.service.EmpService;
import com.marryme.emp.service.Impl.EmpServiceImpl;
import com.marryme.member.service.*;
import com.marryme.member.service.Impl.*;
import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.service.Impl.VendorServiceImpl;


public class MemberConstants {

	public static final MemberService SERVICE = new MemberServiceImpl();
	public static final VendorService SERVICE2 = new VendorServiceImpl();
	public static final EmpService SERVICE3 = new EmpServiceImpl();
}
