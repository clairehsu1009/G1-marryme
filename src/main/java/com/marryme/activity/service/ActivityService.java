package marryme.activity.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import marryme.activity.vo.Activity;

public interface ActivityService {

	// 取得所有活動
	public List<Activity> findAll();

	// 新增活動

	public Activity addActivity(String discount_code, String vendor_id, String activity_name, BigDecimal discount,
			Timestamp activity_start_time, Timestamp activity_end_time, String activity_detail);

	// 刪除活動
	public void deleteActivity(String discount_code);

	// 更新活動

	public Activity updateActivity(String discount_code, String vendor_id, String activity_name, BigDecimal discount,
			Timestamp activity_start_time, Timestamp activity_end_time, String activity_detail);

	// 根據折扣代碼獲取活動
	public Activity getOneActivity(String discount_code);

}