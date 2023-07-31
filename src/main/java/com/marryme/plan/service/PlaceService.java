package com.marryme.plan.service;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Place;

import java.util.List;

/**
 * ClassName: PlaceService
 * Package: marryme.plan.service
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/17 下午 05:12
 * @Version 1.0
 */
public interface PlaceService extends CoreService {
    /** 取得廠商所有資料 */
    List<Place> findAllByVendorId(String vendorId);
    /** 取得廠商符合狀態的資料 */
    List<Place> findAllByVendorIdAndStatus(String vendorId, String statusType);
    /** 取得所有方案場地 */
    List<Place> findAll();
    Place getOne(Integer id);
    Integer insert(Place place);
    boolean update(Integer id, Place place);
    /** 修改加購項目狀態為下架 */
    boolean changeStatusToInactive(Integer id);

}
