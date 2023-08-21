package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.UnavailableDateDao;
import com.marryme.plan.vo.UnavailableDates;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: UnavailableDatesDaoImpl
 * Package: com.marryme.plan.dao.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/3 上午 12:34
 * @Version 1.0
 */
public class UnavailableDateDaoImpl implements UnavailableDateDao {
    @Override
    public List<Integer> getUnavailablePlaceIds(List<Integer> placeId, String unavailableDate, Integer unavailableTime) {
        List<Integer> unavailablePlaceIds = new ArrayList<>();

            String hql = "SELECT placeId FROM UnavailableDates where unavailableDate = :unavailableDate AND unavailableTime = :unavailableTime AND placeId IN (:placeId)";
            Query<Integer> query = getSession().createQuery(hql, Integer.class);
            query.setParameterList("placeId", placeId);
            query.setParameter("unavailableDate", unavailableDate);
            query.setParameter("unavailableTime", unavailableTime);

            unavailablePlaceIds = query.list();

        // 檢查是否有符合的資料，若無則返回 null
        if (unavailablePlaceIds.isEmpty()) {
            return null;
        }
        return unavailablePlaceIds;
    }

    @Override
    public List<UnavailableDates> selectAll() {
        String hql = "FROM UnavailableDates";
        return getSession().createQuery(hql, UnavailableDates.class).list();
    }

    @Override
    public UnavailableDates selectById(Integer id) {
        return getSession().get(UnavailableDates.class, id);
    }

    @Override
    public Integer insert(UnavailableDates vo) {
        return (Integer) getSession().merge(vo);
    }

    @Override
    public Integer insertValues(UnavailableDates unavailableDates) {
        getSession().persist(unavailableDates);
        return unavailableDates.getUnavailableDatesId();
    }

    @Override
    public void update(Integer id, UnavailableDates pojo) {

    }

    @Override
    public void deleteById(Integer id) {
        Session session = getSession();
        UnavailableDates unavailableDate = session.load(UnavailableDates.class, id);
        session.remove(unavailableDate);
    }
}
