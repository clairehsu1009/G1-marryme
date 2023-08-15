package com.marryme.member.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Constants {

	public static final Gson GSON = new GsonBuilder().create();
	public static final String JSON_MIME_TYPE = "application/json";
	public static final String PREFIX_FRONT_END = "/front-end";
	public static final String USER_LOGIN_PAGE = "/front-end/user/userLogin.jsp";
	public static final String USER_REGISTER_PAGE = "/front-end/user/userRegister.jsp";
	public static final String USER_MATERIAL_PAGE = "/front-end/user/userMaterial.jsp";
	public static final String USER_USERINDEX_PAGE = "/front-end/user/userIndex.jsp";
	public static final String USER_PASSWORD_PAGE = "/front-end/user/password.jsp";
	public static final String USER_BASICINFORMATION_PAGE = "/front-end/user/userBasicinformation.jsp";
	
}
