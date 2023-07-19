/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.marryme.activity.vo.Activity;

public class ActivityDaoImpl implements ActivityDao {
	private DataSource ds;

	public ActivityDaoImpl() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/marryme");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// select * from activity
	@Override
	public List<Activity> selectAll() {
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("select * from activity");
				ResultSet rs = pstmt.executeQuery();) {
			List<Activity> list = new ArrayList<>();
			while (rs.next()) {
				Activity activity = new Activity();
				activity.setDiscount_code(rs.getString("discount_code"));
				activity.setVendor_id(rs.getString("vendor_id"));
				activity.setActivity_name(rs.getString("activity_name"));
				activity.setDiscount(rs.getBigDecimal("discount"));
				activity.setActivity_start_time(rs.getTimestamp("activity_start_time"));
				activity.setActivity_end_time(rs.getTimestamp("activity_end_time"));
				activity.setActivity_detail(rs.getString("activity_detail"));
				list.add(activity);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// insert into activity
	@Override
	public void insert(Activity activity) {
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
						"insert into activity (discount_code, vendor_id, activity_name, discount, activity_start_time, activity_end_time, activity_detail) "
								+ "values (?, ?, ?, ?, ?, ?, ?)")) {
			pstmt.setString(1, activity.getDiscount_code());
			pstmt.setString(2, activity.getVendor_id());
			pstmt.setString(3, activity.getActivity_name());
			pstmt.setBigDecimal(4, activity.getDiscount());
			pstmt.setTimestamp(5, activity.getActivity_start_time());
			pstmt.setTimestamp(6, activity.getActivity_end_time());
			pstmt.setString(7, activity.getActivity_detail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete from activity where discount_code = ?
	@Override
	public void delete(String discountCode) {
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("delete from activity where discount_code = ?")) {
			pstmt.setString(1, discountCode);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// update activity set vendor_id = ?, activity_name = ?, discount = ?,
	// activity_start_time = ?, activity_end_time = ?, activity_detail = ? where
	// discount_code = ?
	@Override
	public void update(Activity activity) {
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("update activity set vendor_id = ?, activity_name = ?, discount = ?, "
								+ "activity_start_time = ?, activity_end_time = ?, activity_detail = ? where discount_code = ?")) {
			pstmt.setString(1, activity.getVendor_id());
			pstmt.setString(2, activity.getActivity_name());
			pstmt.setBigDecimal(3, activity.getDiscount());
			pstmt.setTimestamp(4, activity.getActivity_start_time());
			pstmt.setTimestamp(5, activity.getActivity_end_time());
			pstmt.setString(6, activity.getActivity_detail());
			pstmt.setString(7, activity.getDiscount_code());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// select * from activity where discount_code = ?
	@Override
	public Activity findByPrimaryKey(String discountCode) {
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("select * from activity where discount_code = ?")) {
			pstmt.setString(1, discountCode);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					Activity activity = new Activity();
					activity.setDiscount_code(rs.getString("discount_code"));
					activity.setVendor_id(rs.getString("vendor_id"));
					activity.setActivity_name(rs.getString("activity_name"));
					activity.setDiscount(rs.getBigDecimal("discount"));
					activity.setActivity_start_time(rs.getTimestamp("activity_start_time"));
					activity.setActivity_end_time(rs.getTimestamp("activity_end_time"));
					activity.setActivity_detail(rs.getString("activity_detail"));
					return activity;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
