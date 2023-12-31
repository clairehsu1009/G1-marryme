package com.marryme.plan.service;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Place;
import com.marryme.plan.vo.Plan;

import java.util.List;

/**
 * ClassName: PlanService
 * Package: marryme.plan.service
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 02:04
 * @Version 1.0
 */
public interface PlanService extends CoreService {
    /** 取得廠商所有資料 */
    List<Plan> findAllByVendorId(String vendorId);
    /** 取得廠商符合狀態的資料 */
    List<Plan> findAllByVendorIdAndStatus(String vendorId, String statusType);
    /** 取得所有方案 */
    List<Plan> findAll();

    Plan getOne(Integer id);
    List<Integer> getOneForAvailableDates(List<Integer> placeIds, String unavailableDate, Integer unavailableTime);
    Integer insertPlanWithDetails(Plan plan, List<Integer> places);
    boolean update(Integer id, Plan plan);
    /** 修改方案狀態為下架 */
    boolean changeStatusToInactive(Integer id);



}
