package com.marryme.plan.service;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanOrder;
import com.marryme.plan.vo.PlanOrderDetail;
import com.marryme.plan.vo.UnavailableDates;

import java.util.List;

/**
 * ClassName: OrderService
 * Package: com.marryme.plan.service
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/2 下午 09:36
 * @Version 1.0
 */
public interface OrderService extends CoreService {
    /** 取得會員所有訂單 */
    List<PlanOrder> findAllByMemberId(String memberId);
    String getOneByVendorId(String vendorId);
    /** 取得廠商所有訂單 */
    List<PlanOrder> findAllByVendorId(String vendorId);
    /** 取得所有訂單 */
    List<PlanOrder> findAll();

    PlanOrder getOne(Integer id);
    /** 取得預約日期 */
    UnavailableDates getUnavailableDate(Integer id);
    /** 取得訂單明細  */
    List<PlanOrderDetail> findAllByOrderId(Integer id);
    Integer insertUnavailableDateAndOrder(UnavailableDates unavailableDates, PlanOrder planOrder, List<Integer> items);


}
