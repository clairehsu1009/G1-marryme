package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.PlaceDao;
import com.marryme.plan.vo.Item;
import com.marryme.plan.vo.Place;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

import static com.marryme.common.CommonString.ACTIVE;


/**
 * ClassName: PlaceDaoImpl
 * Package: marryme.plan.dao.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/17 下午 04:03
 * @Version 1.0
 */
public class PlaceDaoImpl implements PlaceDao {


    @Override
    public List<Place> selectAll() {
        String hql = "FROM Place";
        return getSession().createQuery(hql, Place.class).list();
    }

    @Override
    public Place selectById(Integer id) {
        return getSession().get(Place.class, id);
    }

    @Override
    public Integer insert(Place vo) {
        vo.setStatus(vo.getStatus() == null ? 1 : vo.getStatus());
        vo.setEditStatus(vo.getEditStatus() == null ? 0 : 1);
        return (Integer) getSession().save(vo);

    }

    @Override
    public void update(Integer id, Place vo) {
        Place place = getSession().get(Place.class, id);

        place.setPlacePicture(vo.getPlacePicture());
        place.setPlaceTitle(vo.getPlaceTitle());
        place.setNumbeOfTables(vo.getNumbeOfTables());
        place.setPlaceIntroduction(vo.getPlaceIntroduction());
        place.setPlacePictures2(vo.getPlacePictures2());
        place.setPlacePictures3(vo.getPlacePictures3());
        place.setPlacePictures4(vo.getPlacePictures4());
        place.setPlacePictures5(vo.getPlacePictures5());

        getSession().merge(place);

    }

    @Override
    public void deleteById(Integer id) {
        Session session = getSession();
        Place place = session.get(Place.class, id);
        session.remove(place);
    }

    @Override
    public List<Place> selectAllByVendorIdAndStatus(String vendorId, String statusType) {
        // 狀態 0下架 INACTIVE /  1上架 ACTIVE
        int status = ACTIVE.equals(statusType) ? 1 : 0;
        String hql = "FROM Place WHERE vendorId = :vendorId AND status = :status";
        Query<Place> query = getSession().createQuery(hql, Place.class);
        query.setParameter("vendorId", vendorId);
        query.setParameter("status", status);
        return query.list();

    }

    @Override
    public void changeStatusToInactive(Integer placeId) {
        Place place = getSession().get(Place.class, placeId);
        place.setStatus(0); // 狀態改為下架
        getSession().merge(place);
    }
}