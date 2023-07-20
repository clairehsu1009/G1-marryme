package wedding.dao;

import java.util.List;

import core.dao.CoreDao;
import wedding.vo.Reservation;

public interface ReservationDao extends CoreDao<Reservation, Integer>{
	
	int insert(Reservation reservation);
	
	List<Reservation> selectAll();
	
	int deleteById(Integer id);
}
