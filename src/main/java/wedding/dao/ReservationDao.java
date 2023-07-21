package wedding.dao;

import java.util.List;

import com.marryme.core.dao.CoreDao;
import wedding.vo.Reservation;

public interface ReservationDao extends CoreDao<Reservation, Integer>{
	
	Integer insert(Reservation reservation);
	
	List<Reservation> selectAll();
	
	void deleteById(Integer id);
	
	int update(Reservation reservation);
	
	Reservation selectById(Integer reservationId);

	

	

	
}
