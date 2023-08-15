package com.marryme.weddingVenue.dao.impl;

import static com.marryme.common.CommonString.ACTIVE;

import java.util.List;
import java.util.Optional;

import org.hibernate.query.Query;

import com.marryme.reservation.vo.Reservation;
import com.marryme.weddingVenue.dao.WeddingPlanDao;
import com.marryme.plan.vo.Plan;
import com.marryme.weddingVenue.vo.WeddingVenue;

public class WeddingPlanDaoImpl implements WeddingPlanDao{
	
	@Override
    public List<Plan> selectAllByVendorIdAndStatus(String vendorId, String statusType) {
        // 狀態 0下架 INACTIVE /  1上架 ACTIVE
        int status = ACTIVE.equals(statusType) ? 1 : 0;
        String hql = "FROM Plan WHERE vendorId = :vendorId AND status = :status";
        Query<Plan> query = getSession().createQuery(hql, Plan.class);
        query.setParameter("vendorId", vendorId);
        query.setParameter("status", status);
        return query.list();

    }
	
	
	@Override
    public List<Plan> selectAllAndStatus(String statusType) {
        // 狀態 0下架 INACTIVE /  1上架 ACTIVE
        int status = ACTIVE.equals(statusType) ? 1 : 0;
        String hql = "FROM Plan WHERE status = :status";
        Query<Plan> query = getSession().createQuery(hql, Plan.class);
        query.setParameter("status", status);
        return query.list();

    }
	
	
	
	@Override
    public Optional<byte[]> selectPhotoByIdAndField(Integer planProductId, String fieldName) {
        String hql = "SELECT " + fieldName + " FROM Place WHERE planProductId = :planProductId";
        Query<byte[]> query = getSession().createQuery(hql, byte[].class);
        query.setParameter("planProductId", planProductId);
        List<byte[]> photos = query.list();

        if (!photos.isEmpty()) {
            return Optional.ofNullable(photos.get(0));
        } else {
            return Optional.empty();
        }
    }
	
	
	

	@Override
	public List<Plan> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Plan selectById(Integer id) {
		return getSession().get(Plan.class, id);
	}

	@Override
	public Integer insert(Plan vo) {
		vo.setStatus(vo.getStatus() == null ? 1 : vo.getStatus());
		return(Integer) getSession().save(vo);
	}

	@Override
	public void update(Integer id, Plan pojo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}
}
