package com.marryme.plan.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.PlanOrderDetail;

import java.util.List;

/**
 * ClassName: PlanDetailDao
 * Package: com.marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/16 下午 05:52
 * @Version 1.0
 */
public interface PlanOrderDetailDao extends CoreDao<PlanOrderDetail, Integer> {
    /** */
    List<PlanOrderDetail> selectAllByOrderId(Integer id);
}
