package com.marryme.reservation.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.marryme.reservation.service.ReservationService;
import com.marryme.reservation.dao.ReservationDao;
import com.marryme.reservation.dao.impl.ReservationDaoImpl;
import com.marryme.reservation.vo.Reservation;
import com.marryme.vendor.vo.Vendor;

public class ReservationServiceImpl implements ReservationService {
	
	private final ReservationDao dao;
	
	
	public ReservationServiceImpl() {
		dao = new ReservationDaoImpl();
	}
	
	@Override
	public List<Reservation> findAllByVendorIdAndStatus(String vendorId, String statusType) {
		List<Reservation> reservationList = new ArrayList<>();
		try {
			beginTransaction();
			reservationList = dao.seleteAllByVendorAndStatus(vendorId, statusType);
			commit();
		}catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return reservationList;
	}
	
	
	@Override
	public List<Object[]> findVendorAllByMember(String memberId) {
		List<Object[]> vendorList = new ArrayList<>();
		try {
			beginTransaction();
			vendorList = dao.seleteVendorAllByMemberId(memberId);
			commit();
		}catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return vendorList;
	}
	
	
	 
	@Override
	public List<Reservation> findAll(){
		List<Reservation> reservationList = new ArrayList<>();
		try {
			beginTransaction();
			reservationList = dao.selectAll();
			commit();
		} catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return reservationList;
	}
	
	
	@Override
	public Reservation getOne(Integer id) {
		Reservation reservation = null;
        try {
            beginTransaction();
            reservation = dao.selectById(id);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
		return reservation;
	}
	

	
	@Override
	public Integer insert(Reservation reservation) {
		Integer id = null;
		try {
			beginTransaction();
			id = dao.insert(reservation);
			commit();
		} catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return id;
	}
	
	
	@Override
	public boolean update(Integer id, Reservation reservation) {
		boolean result = false;
		try {
			beginTransaction();				
			dao.update(id, reservation);
			commit();
			result = true;
		} catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public boolean changeStatusToCancel(Integer id){
		boolean result = false;
		try {
			beginTransaction();
			dao.deleteById(id);
			commit();
			result = true;
		} catch (Exception e) {
			rollback ();
			e.printStackTrace();
		}
		return result;
	}





}
