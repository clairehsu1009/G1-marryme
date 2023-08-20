package com.marryme.common.photo;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * 讀取圖片共用程式
 * 傳入要讀取的 功能id 以及 圖片欄位名
 * ex. 取得場地的圖片：傳入placeId / 及 各自的圖片欄位名稱
 */

@WebServlet("/ShowPhoto")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 10 * 1024 * 1024)
public class ShowPhotoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ShowPhotoService service;

    @Override
    public void init() throws ServletException {
        service = new ShowPhotoServiceImpl();
        ;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("image/*");
        try {

            String placeIdStr = request.getParameter("placeId");
            String planProductIdStr = request.getParameter("planProductId");
            String fieldName = request.getParameter("photoFieldName");


            // 可接受的圖片欄位名稱字串
            List<String> isValidPhotoFieldsName = new ArrayList<>(
                    List.of("placePicture", "placePicture1", "placePictures2", "placePictures3", "placePictures3", "placePictures4", "placePictures5",
                            "planPicture", "planPictures1", "planPictures2", "planPictures3", "planPic",
                            "showPlan")
            );

            // 若不包含在內則結束流程
            if (!isValidPhotoFieldsName.contains(fieldName)) {
                return;
            }
            // 如果placeId 及 photoFieldName有值 -> 讀取場地的圖片
            if (StringUtils.isNotBlank(placeIdStr) && StringUtils.isNotBlank(fieldName)) {
                Integer placeId = Integer.valueOf(placeIdStr);
                Optional<byte[]> photo = service.getPlacePhoto(placeId, fieldName);
                OutputStream out = response.getOutputStream();
                getPhoto(photo, out);
            }else if(StringUtils.isNotBlank(planProductIdStr) && StringUtils.isNotBlank(fieldName)){
                Integer planProductId = Integer.valueOf(planProductIdStr);
                Optional<byte[]> photo = service.getPlanPhoto(planProductId, fieldName);
                OutputStream out = response.getOutputStream();
                getPhoto(photo, out);
            }


            // 照片讀取產生錯誤不處理
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 取得圖片寫出去顯示於jsp中
     * 若該欄位無圖片則顯示預設圖片
     *
     * @param photo
     * @param out
     * @throws IOException
     */
    private void getPhoto(Optional<byte[]> photo, OutputStream out) throws IOException {
        if (photo.isPresent()) {
            out.write(photo.get());
            out.flush();
            out.close();
        } else {
            // 取得預設圖片的路徑
            String defaultImagePath = "/public/images/front-end/picture.png";
            byte[] defaultImage = null;
            File file = new File(getServletContext().getRealPath(defaultImagePath));
            FileInputStream fis = new FileInputStream(file);
            defaultImage = fis.readAllBytes();
            fis.close();
            if (defaultImage != null) {
                out.write(defaultImage);
                out.flush();
                out.close();
            }
        }
    }
}
