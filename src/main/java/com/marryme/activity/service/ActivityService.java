/**
 * @Author Jeanny
 * @Create 2023/7/21 22:33
 * @Version 3.0
 */

package com.marryme.activity.service;

import java.util.List;

import com.marryme.activity.entity.Activity;
import com.marryme.core.service.CoreService;

public interface ActivityService extends CoreService {

	// 取得所有活動
	List<Activity> findAll();
	
	Activity getOne(String discountCode);
	
	Activity add(Activity activity);
	
	boolean edit(String discountCode, Activity activity);
	
	boolean remove(String discountCode);
	
	List<Activity> findAllByVendorIdAndStatus(String vendorId, String active);

	// 修改優惠券狀態為下架 
	boolean changeStatusToInactive(String discountCode);
}