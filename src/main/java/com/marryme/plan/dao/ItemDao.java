package com.marryme.plan.dao;


import com.marryme.core.dao.CoreDao;
import com.marryme.plan.vo.Item;

import java.util.List;

/**
 * 方案加購項目Dao介面
 */
public interface ItemDao extends CoreDao<Item, Integer> {

    /** 取得廠商符合狀態的資料 */
    List<Item> selectAllByVendorIdAndStatus(String vendorId, String statusType);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer planItemId);

}
