package com.marryme.plan.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Item;
import com.marryme.plan.vo.Plan;

import java.util.List;

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
    /** 取得廠商符合狀態的資料 */
    List<Plan> selectAllByVendorId(String vendorId);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer planProductId);

}
