package wedding.service;

import java.util.List;

import core.service.CoreService;
import wedding.vo.Reservation;

public interface ReservationService extends CoreService {
	
	//取得所有預約資訊
	public List<Reservation> findAll();
	
	
	//增加預約日期
	Reservation addReservation(Reservation reservation); 
	
	
	//刪除預約日期
	public void deleteReservation(Integer reservationID);
	
	
	//更新預約資料
	
	
	
}
