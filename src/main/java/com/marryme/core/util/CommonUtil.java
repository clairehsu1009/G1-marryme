package com.marryme.core.util;

//import static core.util.Constants.DATASOURCE;
import static com.marryme.core.util.Constants.GSON;
import static com.marryme.core.util.Constants.JSON_MIME_TYPE;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class CommonUtil {
	
	
		 public final static String URL = "jdbc:mysql://localhost:3306/marryme?serverTimezone=Asia/Taipei";
		 public final static String USER = "root";
		 public final static String PASSWORD = "password";
		 
		 public static Connection getConnectionLily() throws SQLException {
			    return DriverManager.getConnection(URL, USER, PASSWORD);
		 };
	

	public static <P> P json2Pojo(HttpServletRequest request, Class<P> classOfPojo) {
		try (BufferedReader br = request.getReader()) {
			return GSON.fromJson(br, classOfPojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static <P> void writePojo2Json(HttpServletResponse response, P pojo) {
		response.setContentType(JSON_MIME_TYPE);
		try (PrintWriter pw = response.getWriter()) {
			pw.print(GSON.toJson(pojo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
