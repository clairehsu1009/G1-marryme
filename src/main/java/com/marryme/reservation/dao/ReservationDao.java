package com.marryme.reservation.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.reservation.vo.Reservation;

import java.util.List;

public interface ReservationDao extends CoreDao<Reservation, Integer>{
	
	/*取得成功預約資料*/
	List<Reservation> seleteAllByVendorAndStatus(String vendorId,String statusType);
	
	/*更改為取消預約*/
	void ChangeStatusToCancel (Integer reservationStatus);

}