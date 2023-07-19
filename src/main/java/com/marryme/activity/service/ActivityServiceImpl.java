/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import com.marryme.activity.dao.ActivityDao;
import com.marryme.activity.dao.ActivityDaoImpl;
import com.marryme.activity.vo.Activity;

public class ActivityServiceImpl implements ActivityService {
	private ActivityDao dao;

	public ActivityServiceImpl() {
		dao = new ActivityDaoImpl();
	}

	// 取得所有活動
	@Override
	public List<Activity> findAll() {
		return dao.selectAll();
	}

	// 新增活動
	@Override
	public Activity addActivity(String discount_code, String vendor_id, String activity_name, BigDecimal discount,
			Timestamp activity_start_time, Timestamp activity_end_time, String activity_detail) {

		Activity activity = new Activity();

		activity.setDiscount_code(discount_code);
		activity.setVendor_id(vendor_id);
		activity.setActivity_name(activity_name);
		activity.setDiscount(discount);
		activity.setActivity_start_time(activity_start_time);
		activity.setActivity_end_time(activity_end_time);
		activity.setActivity_detail(activity_detail);
		dao.insert(activity);

		return activity;
	}

	// 刪除活動
	@Override
	public void deleteActivity(String discount_code) {
		dao.delete(discount_code);
	}

	// 更新活動
	@Override
	public Activity updateActivity(String discount_code, String vendor_id, String activity_name, BigDecimal discount,
			Timestamp activity_start_time, Timestamp activity_end_time, String activity_detail) {

		Activity activity = new Activity();

		activity.setDiscount_code(discount_code);
		activity.setVendor_id(vendor_id);
		activity.setActivity_name(activity_name);
		activity.setDiscount(discount);
		activity.setActivity_start_time(activity_start_time);
		activity.setActivity_end_time(activity_end_time);
		activity.setActivity_detail(activity_detail);
		dao.update(activity);

		return activity;
	}

	// 根據折扣代碼獲取活動
	@Override
	public Activity getOneActivity(String discount_code) {
		return dao.findByPrimaryKey(discount_code);
	}
}
