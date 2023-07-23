package com.marryme.common.photo;

import com.marryme.plan.dao.PlaceDao;
import com.marryme.plan.dao.impl.PlaceDaoImpl;

import java.util.Optional;

public class ShowPhotoServiceImpl implements ShowPhotoService {
    private final PlaceDao placeDao;

    public ShowPhotoServiceImpl() {
        placeDao = new PlaceDaoImpl();
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
}
