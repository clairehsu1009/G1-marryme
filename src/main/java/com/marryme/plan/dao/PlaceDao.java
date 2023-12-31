package com.marryme.plan.dao;


import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Place;

import java.util.List;
import java.util.Optional;


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
    /** 查詢該廠商所有資料 */
    List<Place> selectAllByVendorId(String vendorId);
    /** 取得廠商符合狀態的資料 */
    List<Place> selectAllByVendorIdAndStatus(String vendorId, String statusType);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer placeId);

    /** 取得場地photo */
    Optional<byte[]> selectPhotoByIdAndField(Integer placeId, String fieldName);
}
