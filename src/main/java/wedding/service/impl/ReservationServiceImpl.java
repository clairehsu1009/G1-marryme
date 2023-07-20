package wedding.service.impl;


import java.util.List;
import wedding.dao.ReservationDao;
import wedding.dao.impl.ReservationDaoImpl;
import wedding.service.ReservationService;
import wedding.vo.Reservation;

public class ReservationServiceImpl implements ReservationService{
	
	private static final long serialVersionUID = 1L;
	private ReservationDao reservationDao;
	
	public ReservationServiceImpl() {
		reservationDao = new ReservationDaoImpl();
	}
	
	//取得所有預約資訊
	@Override
	public List<Reservation> findAll() {
		return reservationDao.selectAll();
	}

	//刪除預約資訊
	public void deleteReservation(Integer reservationID) {
		reservationDao.deleteById(reservationID);
	}
	
	
	
	
	public ReservationDao getReservationDao() {
		return reservationDao;
	}

	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}
	
	public void ReservationDao() {
		this.reservationDao = new ReservationDaoImpl();
	}

	//新增預約資訊
	@Override
	public Reservation addReservation(Reservation reservation) {
		Reservation reservationIS = new Reservation();
		reservationIS.setVendorId(reservation.getVendorId());
		reservationIS.setMemberId(reservation.getMemberId());
		reservationIS.setContactName(reservation.getContactName());
		reservationIS.setContactNumber(reservation.getContactNumber());
		reservationIS.setEventDate(reservation.getEventDate());
		reservationIS.setReservationDate(reservation.getReservationDate());
		reservationIS.setReservationNotes(reservation.getReservationNotes());
		
		this.reservationDao.insert(reservationIS);
		return reservation;
	}



}
