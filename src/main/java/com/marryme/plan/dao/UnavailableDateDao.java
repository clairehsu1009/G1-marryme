package com.marryme.plan.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.UnavailableDates;

import java.util.List;

/**
 * ClassName: UnavailableDateDao
 * Package: com.marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/3 上午 12:34
 * @Version 1.0
 */
public interface UnavailableDateDao extends CoreDao<UnavailableDates, Integer> {

    List<Integer> getUnavailablePlaceIds(List<Integer> PlaceId, String unavailableDate, Integer unavailableTime);

    Integer insertValues(UnavailableDates unavailableDates);
}
