/**
 * @Author Jeanny
 * @Create 2023/7/21 22:06
 * @Version 3.0
 */

package com.marryme.activity.dao;

import java.util.List;

import com.marryme.activity.entity.Activity;
import com.marryme.core.dao.CoreDao;

public interface ActivityDao extends CoreDao<Activity, String>{

	/** 取得廠商符合狀態的資料 */
	List<Activity> selectAllByVendorIdAndStatus(String vendorId, String statusType);

	/** 修改優惠券狀態為下架 */
	void changeStatusToInactive(String discountCode);
	
}