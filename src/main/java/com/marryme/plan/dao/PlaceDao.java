package com.marryme.plan.dao;


import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Item;
import com.marryme.plan.vo.Place;

import java.util.List;


/**
 * ClassName: PlaceDao
 * Package: marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/17 下午 04:33
 * @Version 1.0
 */
public interface PlaceDao extends CoreDao<Place, Integer> {
    /** 取得廠商符合狀態的資料 */
    List<Place> selectAllByVendorIdAndStatus(String vendorId, String statusType);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer placeId);
}
