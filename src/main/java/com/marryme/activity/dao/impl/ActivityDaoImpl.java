/**
 * @Author Jeanny
 * @Create 2023/7/21 22:06
 * @Version 3.0
 */

package com.marryme.activity.dao.impl;

import static com.marryme.common.CommonString.ACTIVE;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.marryme.activity.dao.ActivityDao;
import com.marryme.activity.entity.Activity;

public class ActivityDaoImpl implements ActivityDao {

	@Override
	public List<Activity> selectAll() {
		String hql = "FROM Activity";
		return getSession().createQuery(hql, Activity.class).list();
	}

	@Override
	public Activity selectById(String discountCode) {
		return getSession().get(Activity.class, discountCode);
	}

	@Override
	public Integer insert(Activity activity) {
		getSession().persist(activity);
		return 1;
	}

	@Override
	public void update(String discountCode, Activity vo) {
		Activity activity = getSession().get(Activity.class, discountCode);
		// 只set 可以修改的欄位
		activity.setDiscountCode(vo.getDiscountCode());
		activity.setActivityName(vo.getActivityName());
		activity.setDiscount(vo.getDiscount());
		activity.setActivityStartTime(vo.getActivityStartTime());
		activity.setActivityEndTime(vo.getActivityEndTime());
		activity.setStatus(vo.getStatus());
		activity.setEditStatus(vo.getEditStatus());
		getSession().merge(activity);

	}

	@Override
	public void deleteById(String discountCode) {
		Session session = getSession();
		Activity activity = session.load(Activity.class, discountCode);
		session.remove(activity);
	}

	@Override
	public List<Activity> selectAllByVendorIdAndStatus(String vendorId, String statusType) {
		// 狀態 0下架 INACTIVE / 1上架 ACTIVE
		int status = ACTIVE.equals(statusType) ? 1 : 0;
		String hql = "FROM Activity WHERE vendorId = :vendorId AND status = :status";
		Query<Activity> query = getSession().createQuery(hql, Activity.class);
		query.setParameter("vendorId", vendorId);
		query.setParameter("status", status);
		return query.list();
	}

	@Override
	public void changeStatusToInactive(String discountCode) {
		Activity activity = getSession().get(Activity.class, discountCode);
		activity.setStatus(0); // 狀態改為下架
		getSession().merge(activity);
	}
}