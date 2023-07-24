/**
 * @Author Jeanny
 * @Create 2023/7/21 22:33
 * @Version 3.0
 *
 */

package com.marryme.activity.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.marryme.activity.dao.ActivityDao;
import com.marryme.activity.dao.impl.ActivityDaoImpl;
import com.marryme.activity.entity.Activity;
import com.marryme.activity.service.ActivityService;

public class ActivityServiceImpl implements ActivityService {
	private ActivityDao dao;

	public ActivityServiceImpl() {
		dao = new ActivityDaoImpl();
	}

	// 取得所有活動
	@Override
	public List<Activity> findAll() {
		List<Activity> activityList = new ArrayList<>();
		try {
			beginTransaction();
			activityList = dao.selectAll();
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return activityList;
	}

	// 新增活動
	@Override
	public Activity add(Activity activity) {
		try {
			beginTransaction();
			activity.setStatus(1);
			activity.setEditStatus(0);
			final int resultCount = dao.insert(activity);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return activity;
	}

	// 更新活動(已結束活動的不能修改, 進行中的優惠只能修改活動名稱、結束時間、活動細項, 尚未進行的除了折扣代碼外其餘皆可修改)
	@Override
	public boolean edit(String discountCode, Activity active) {
		boolean result = false;
		try {
			beginTransaction();
			dao.update(discountCode, active);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Activity getOne(String discountCode) {
		Activity activity = null;
		try {
			beginTransaction();
			activity = dao.selectById(discountCode);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return activity;
	}

	@Override
	public boolean remove(String discountCode) {
		boolean result = false;
		try {
			beginTransaction();
			dao.deleteById(discountCode);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Activity> findAllByVendorIdAndStatus(String vendorId, String statusType) {
		List<Activity> activityList = new ArrayList<>();
		try {
			beginTransaction();
			activityList = dao.selectAllByVendorIdAndStatus(vendorId, statusType);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return activityList;
	}

	// 調整狀態為下架
	@Override
	public boolean changeStatusToInactive(String discountCode) {
		boolean result = false;
		try {
			beginTransaction();
			dao.changeStatusToInactive(discountCode);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}
}