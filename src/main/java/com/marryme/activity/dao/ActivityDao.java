/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.dao;

import java.util.List;

import com.marryme.activity.vo.Activity;

public interface ActivityDao {

	// select * from activity
	List<Activity> selectAll();

	// insert into activity
	void insert(Activity activity);

	// delete from activity where discount_code = ?
	void delete(String discountCode);

	// update activity set vendor_id = ?, activity_name = ?, discount = ?,
	// activity_start_time = ?, activity_end_time = ?, activity_detail = ? where
	// discount_code = ?
	void update(Activity activity);

	// select * from activity where discount_code = ?
	Activity findByPrimaryKey(String discountCode);

}