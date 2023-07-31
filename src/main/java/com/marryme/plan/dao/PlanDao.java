package com.marryme.plan.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Plan;

import java.util.List;
import java.util.Optional;

/**
 * ClassName: PlanDao
 * Package: marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 12:34
 * @Version 1.0
 */
public interface PlanDao extends CoreDao<Plan, Integer> {
    /** 查詢該廠商所有資料 */
    List<Plan> selectAllByVendorId(String vendorId);
    /** 取得廠商符合狀態的資料 */
    List<Plan> selectAllByVendorIdAndStatus(String vendorId, String statusType);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer planProductId);
    /** 取得場地photo */
    Optional<byte[]> selectPhotoByIdAndField(Integer planProductId, String fieldName);

}
