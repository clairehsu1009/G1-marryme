package  wedding.dao.impl;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.dialect.pagination.SQL2008StandardLimitHandler;


import wedding.dao.ReservationDao;
import wedding.vo.Reservation;
import core.util.CommonUtil;

public class ReservationDaoImpl implements ReservationDao {
	
//	@Override
//	public int insert(Reservation reservation) {
//		getSession().persist(reservation);
//		return 1;
//	}

	@Override
	public int insert(Reservation reservation) {
		final String sql = "insert into RESERVATION(VENDOR_ID, MEMBER_ID,CONTACT_NAME,CONTACT_NUMBER,EVENT_DATE,RESERVATION_DATE,RESERVATION_NOTES)"
				+ "VALUES(?,?,?,?,?,?,?)";
		try (
			Connection connection = CommonUtil.getConnectionLily(); 
			PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, reservation.getVendorId());
			pstmt.setString(2, reservation.getMemberId());
			pstmt.setString(3, reservation.getContactName());
			pstmt.setString(4, reservation.getContactNumber());
			pstmt.setTimestamp(5, reservation.getEventDate());
			pstmt.setTimestamp(6, reservation.getReservationDate());
			pstmt.setString(7, reservation.getReservationNotes());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

//	@Override
//	public List<Reservation> selectAll() {
//		final String hql = "FROM Reservation ORDER BY id";
//		return getSession().createQuery(hql, Member.class).getResultList();
//	}
	
	
	@Override
	public List<Reservation> selectAll() {
		final String sql = "select * from RESERVATION";
		try (
			Connection conn = CommonUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()){
			var list = new ArrayList<Reservation>();
			
			while(rs.next()) {
					Reservation reservation = new Reservation();
					reservation.setContactName(rs.getString("CONTACT_NAME"));
					reservation.setContactNumber(rs.getString("CONTACT_NUMBER"));
					reservation.setEventDate(rs.getTimestamp("EVENT_DATE"));
					reservation.setReservationDate(rs.getTimestamp("RESERVATION_DATE"));
					reservation.setReservationNotes(rs.getString("RESERVATION_NOTES"));
					
					list.add(reservation);
				}
			return list;			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	

	@Override
	public int deleteById(Integer id) {
		final String sql = "delete from RESERVATION where RESERVATION_ID = ?";
		try(
			Connection conn = CommonUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public Reservation selectById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	@Override
	public int update(Reservation pojo) {
		// TODO Auto-generated method stub
		return 0;
	}



	

}
