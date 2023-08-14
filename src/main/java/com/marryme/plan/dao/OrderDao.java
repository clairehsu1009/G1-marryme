package com.marryme.plan.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanOrder;

import java.util.List;

/**
 * ClassName: OrderDao
 * Package: com.marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/2 下午 09:17
 * @Version 1.0
 */
public interface OrderDao extends CoreDao<PlanOrder, Integer> {
    /** 廠商的訂單 */
//    public List<PlanOrder> selectAllByVendorId(String vendorId);
    /** 會員的訂單 */
    public List<PlanOrder> selectAllByMemberId(String memberId);
}
