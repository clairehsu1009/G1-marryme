package com.marryme.reservation.dao.impl;

import com.marryme.reservation.dao.ReservationDao;
import com.marryme.reservation.vo.Reservation;
import com.marryme.vendor.vo.Vendor;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

import static com.marryme.common.CommonString.ACTIVE;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class ReservationDaoImpl implements ReservationDao{

	@Override
	public List<Reservation> selectAll(){
		String hql = "FROM Reservation";
		return getSession().createQuery(hql, Reservation.class).list();
	}
	
	@Override
	public Reservation selectById(Integer id) {
		return getSession().get(Reservation.class, id);
	}
	
	@Override
	public Integer insert(Reservation vo) {
		vo.setStatus(vo.getStatus() == null ? 1 : vo.getStatus());
		return(Integer) getSession().save(vo);
	}
	
	@Override
	public void update(Integer id, Reservation vo) {
		Reservation reservation = getSession().get(Reservation.class, id);
		reservation.setContactName(vo.getContactName());
		reservation.setContactNumber(vo.getContactNumber());
		reservation.setEventDate(vo.getEventDate());
		reservation.setReservationDate(vo.getReservationDate());
		reservation.setReservationNotes(vo.getReservationNotes());
		
		
		getSession().merge(reservation);
		
	}
	
	
	@Override
	public void deleteById(Integer id) {
		Session session = getSession();
		Reservation reservation = session.load(Reservation.class, id);
		session.remove(reservation);
	}
	
	@Override
	public List<Reservation> seleteAllByVendorAndStatus(String vendorId,String statusType){
		
		int status = ACTIVE.equals(statusType) ? 1 : 0;
		String hql = "FROM Reservation WHERE vendorId = :vendorId AND status = :status";
		
		Query<Reservation> query = getSession().createQuery(hql, Reservation.class);
		query.setParameter("vendorId", vendorId);
		query.setParameter("status", status);
		return query.list();
	}
	
	

	@Override
	public List<Object[]> seleteVendorAllByMemberId(String memberId){
		 String sql = "select vendor_name, vendor_phone, event_date, reservation_date, reservation_notes " +
                 "from Reservation r " +
                 "join Vendor v on r.vendor_id = v.vendor_id " +
                 "where r.member_id = :member_id";

	    Query<Object[]> query = getSession().createNativeQuery(sql);
	    query.setParameter("member_id", memberId);
	    List<Object[]> results = query.getResultList(); // 結果將是物件陣列的列表
	    
	    return results;
	}
	
	
	
	@Override
	public void ChangeStatusToCancel (Integer reservationStatus) {
		Reservation reservation = getSession().get(Reservation.class, reservationStatus);
		getSession().merge(reservation);
	}
	
	

	
}
