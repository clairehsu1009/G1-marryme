package com.marryme.reservation.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.reservation.vo.Reservation;
import com.marryme.vendor.vo.Vendor;

import java.util.List;

public interface ReservationDao extends CoreDao<Reservation, Integer>{
	
	/*取得成功預約資料*/
	List<Reservation> seleteAllByVendorAndStatus(String vendorId,String statusType);
	

	List<Object[]> seleteVendorAllByMemberId(String memberId);
	
	/*更改為取消預約*/
	void ChangeStatusToCancel (Integer reservationStatus);
	
	

}
