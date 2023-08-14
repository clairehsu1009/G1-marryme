package com.marryme.plan.service;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Plan;
import com.marryme.plan.vo.PlanOrder;
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
    /** 取得所有訂單 */
    List<PlanOrder> findAll();

    PlanOrder getOne(Integer id);
    Integer insertUnavailableDateAndOrder(UnavailableDates unavailableDates, PlanOrder planOrder, List<Integer> items);


}
