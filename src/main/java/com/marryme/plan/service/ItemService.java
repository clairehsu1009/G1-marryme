package com.marryme.plan.service;

import com.marryme.core.service.CoreService;
import com.marryme.plan.vo.Item;

import java.util.List;

public interface ItemService extends CoreService {

    /** 取得廠商符合狀態的資料 */
    List<Item> findAllByVendorIdAndStatus(String vendorId, String statusType);
    /** 依照種類排序*/
    List<Item> findAllVendorIdAndOrderByType(String vendorId, String statusType);
    /** 取得所有加購項目 */
    List<Item> findAll();
    Item getOne(Integer id);
    List<Item> getIds(List<Integer> planItemIdList);
    Integer insert(Item item);
    boolean update(Integer id, Item item);
    /** 修改加購項目狀態為下架 */
    boolean changeStatusToInactive(Integer id);

    boolean deleteById(Integer id);

}
