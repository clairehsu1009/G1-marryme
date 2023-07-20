package com.marryme.plan.service.impl;

import com.marryme.plan.service.ItemService;
import com.marryme.plan.dao.ItemDao;
import com.marryme.plan.dao.impl.ItemDaoImpl;
import com.marryme.plan.vo.Item;

import java.util.ArrayList;
import java.util.List;

public class ItemServiceImpl implements ItemService {

    private final ItemDao dao;

    public ItemServiceImpl() {
        dao = new ItemDaoImpl();
    }

    @Override
    public List<Item> findAllByVendorIdAndStatus(String vendorId, String statusType) {
        List<Item> itemList = new ArrayList<>();
        try {
            beginTransaction();
            itemList = dao.selectAllByVendorIdAndStatus(vendorId, statusType);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return itemList;
    }

    @Override
    public List<Item> findAll() {
        List<Item> itemList = new ArrayList<>();
        try {
            beginTransaction();
            itemList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return itemList;
    }

    @Override
    public Item getOne(Integer id) {
        Item item = null;
        try {
            beginTransaction();
            item = dao.selectById(id);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return item;
    }

    @Override
    public Integer insert(Item item) {
        Integer id = null;
        try {
            beginTransaction();
            id = dao.insert(item);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return id;
    }
    // TODO 修改加購項目要檢查是否有已成立的訂單，若有訂單則不可修改
    @Override
    public boolean update(Integer id, Item item) {
        boolean result = false;
        try {
            beginTransaction();
            dao.update(id, item);
            commit();
            result = true;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return result;
    }
    // TODO 方案項目現行邏輯無法刪除，需移除此方法
    @Override
    public boolean deleteById(Integer id) {
        boolean result = false;
        try {
            beginTransaction();
            dao.deleteById(id);
            commit();
            result = true;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return result;
    }
    // TODO 調整狀態為下架，要檢查是否已有方案使用，若有需要特別提醒詢問是否仍要下架（下架同時會從方案明細的planItem id set為null)
    @Override
    public boolean changeStatusToInactive(Integer id) {
        boolean result = false;
        try {
            beginTransaction();
            dao.changeStatusToInactive(id);
            commit();
            result = true;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return result;
    }
}
