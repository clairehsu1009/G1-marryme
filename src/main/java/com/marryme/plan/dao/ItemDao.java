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
    /** 依照種類排序*/
    List<Item> selectAllVendorIdAndOrderByType(String vendorId, String statusType);
    /** 查詢多個id */
    List<Item> selectByIds(List<Integer> planItemIdList);

    /** 修改加購項目狀態為下架 */
    void changeStatusToInactive(Integer planItemId);

}
