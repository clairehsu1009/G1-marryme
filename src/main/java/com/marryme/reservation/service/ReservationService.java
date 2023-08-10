package com.marryme.reservation.service;

import com.marryme.core.service.CoreService;
import com.marryme.reservation.vo.Reservation;
import com.marryme.vendor.vo.Vendor;

import java.util.List;

public interface ReservationService extends CoreService {
	
	List<Reservation> findAllByVendorIdAndStatus(String vendorId, String statusType);
	
	List<Object[]> findVendorAllByMember(String memberId);
	
	List<Reservation> findAll();
	
	Reservation getOne (Integer id);
	
	Integer insert (Reservation reservation);
	
	boolean update (Integer id,Reservation reservation);
	
	boolean changeStatusToCancel(Integer id);
	

}
