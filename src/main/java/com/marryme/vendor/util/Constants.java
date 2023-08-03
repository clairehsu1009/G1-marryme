package com.marryme.vendor.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Constants {
	
	
	public static final Gson GSON = new GsonBuilder().create();
	public static final String JSON_MIME_TYPE = "application/json";
	public static final String USER_REGISTER_PAGE = "/front-end/vendor/vendorRegister.jsp";
	public static final String VENDOR_MATERIAL_PAGE = "/front-end/vendor/vendorMaterial.jsp";
	public static final String USER_BASICINFORMATION_PAGE = "/front-end/vendor/vendorBasicinformation.jsp";

}
