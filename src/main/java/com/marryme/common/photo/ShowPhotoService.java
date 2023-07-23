package com.marryme.common.photo;

import com.marryme.core.service.CoreService;

import java.util.Optional;

public interface ShowPhotoService extends CoreService {
    /** 取得場地photo */
    Optional<byte[]> getPlacePhoto(Integer placeId, String fieldName);
}
