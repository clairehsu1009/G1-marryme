package com.marryme.plan.service.impl;

import com.marryme.plan.dao.PlaceDao;
import com.marryme.plan.dao.impl.PlaceDaoImpl;
import com.marryme.plan.service.PlaceService;
import com.marryme.plan.vo.Item;
import com.marryme.plan.vo.Place;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: PlaceServiceImpl
 * Package: marryme.plan.service.impl
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/17 下午 05:39
 * @Version 1.0
 */
public class PlaceServiceImpl implements PlaceService {
    private final PlaceDao dao;
    public PlaceServiceImpl(){
        dao = new PlaceDaoImpl();
    }

    @Override
    public List<Place> findAllByVendorIdAndStatus(String vendorId, String statusType) {
        List<Place> placeList = new ArrayList<>();
        try {
            beginTransaction();
            placeList = dao.selectAllByVendorIdAndStatus(vendorId, statusType);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }

        return placeList;
    }

    @Override
    public List<Place> findAll() {
        List<Place> placeList = new ArrayList<>();
        try {
            beginTransaction();
            placeList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return placeList;
    }

    @Override
    public Place getOne(Integer id) {
        Place place = null;
        try {
            beginTransaction();
            place = dao.selectById(id);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return place;
    }

    @Override
    public Integer insert(Place place) {
        Integer id = null;
        try {
            beginTransaction();
            id = dao.insert(place);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return id;
    }
    // TODO 修改加購項目要檢查是否有已成立的訂單，若有訂單則不可修改
    @Override
    public boolean update(Integer id, Place place) {
        boolean result = false;
        try {
            beginTransaction();
            dao.update(id, place);
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
