package marryme.activity.dao;

import java.util.List;

import marryme.activity.vo.Activity;

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