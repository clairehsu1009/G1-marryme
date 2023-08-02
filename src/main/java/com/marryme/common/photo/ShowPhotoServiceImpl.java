package com.marryme.common.photo;

import com.marryme.plan.dao.PlaceDao;
import com.marryme.plan.dao.PlanDao;
import com.marryme.plan.dao.impl.PlaceDaoImpl;
import com.marryme.plan.dao.impl.PlanDaoImpl;

import java.util.Optional;

public class ShowPhotoServiceImpl implements ShowPhotoService {
    private final PlaceDao placeDao;
    private final PlanDao planDao;

    public ShowPhotoServiceImpl() {
        placeDao = new PlaceDaoImpl();
        planDao = new PlanDaoImpl();
    }


    /** 取得場地photo */
    @Override
    public Optional<byte[]> getPlacePhoto(Integer placeId, String fieldName) {
        Optional<byte[]> photo = Optional.empty();
        try {
            beginTransaction();
            photo = placeDao.selectPhotoByIdAndField(placeId, fieldName);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return photo;
    }

    @Override
    public Optional<byte[]> getPlanPhoto(Integer planProductId, String fieldName) {
        Optional<byte[]> planPhoto = Optional.empty();
        try {
            beginTransaction();
            planPhoto = planDao.selectPhotoByIdAndField(planProductId, fieldName);
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return planPhoto;
    }
}
