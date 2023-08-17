
<%@ page import="java.util.List" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.vo.Place" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="plan" scope="request" class="com.marryme.plan.vo.Plan" />
<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />


<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<%
    Vendor vendor = (Vendor) session.getAttribute("vendor");
    session.setAttribute("vendor", vendor);
    PlaceService placeService = new PlaceServiceImpl();
    List<Place> placeList = placeService.findAllByVendorId(vendor.getVendorId());
    pageContext.setAttribute("placeList", placeList);
%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-plus">&nbsp;</i>新增方案商品
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-plan"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-plan"><a href="<%=request.getContextPath()%>/plan?vendorId=${vendor.vendorId}">方案商品管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12 productsAdd">
            <form method="post" action="<%=request.getContextPath()%>/plan" enctype="multipart/form-data">
                <div class="col-lg-4 col-sm-6 pic1">
                    <label for="planPicture1" id="upload-img1" class="card mb-2 productcard">方案主圖片
                        <input class="form-control" id="planPicture1" type="file" name="planPicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${plan == null  ? "" : plan.planPicture}">
                        <i class="fa-regular fa-image" id="iconcamera1"></i>
                        <i class="delAvatar1 fa fa-times-circle-o" title="移除圖片"></i>
                    </label>
                </div>
                <br>
                <div class="form-group">
                    <label for="planTitle" class="col-sm-2 col-form-label">方案名稱</label>
                    <c:if test="${responseMsgMap.containsKey('planTitle')}">
                        <span class="errorMsg">${responseMsgMap['planTitle']}</span>
                    </c:if>
                    <div class="col-sm-10">
                        <input class="form-control" id="planTitle" name="planTitle" placeholder="請輸入方案名稱"  type="text" value="${plan == null  ? "" : plan.planTitle}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="planIntroduction" class="col-sm-2 col-form-label">方案介紹</label>
                    <c:if test="${responseMsgMap.containsKey('planIntroduction')}">
                        <span class="errorMsg">${responseMsgMap['planIntroduction']}</span>
                    </c:if>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="planIntroduction" name="planIntroduction" placeholder="請輸入方案介紹" value="${plan == null  ? "" : plan.planIntroduction}" required>
                    </div>
                </div>
                <div class="form-row productInfoGroup">
                    <div class="col-lg-5 col-sm-6">
                        <label for="planPicture2" id="upload-img2" class="card mb-2 productcard">其他圖片
                            <input class="form-control" id="planPicture2" type="file" name="planPictures1" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${plan == null  ? "" : plan.planPictures1}">
                            <i class="fa-regular fa-image" id="iconcamera2"></i>
                            <i class="delAvatar2 fa fa-times-circle-o" title="移除圖片"></i>
                        </label>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <label for="planPictureIntro1">圖片簡介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="planPictureIntro1" name="planPictureIntro1" placeholder="請輸入圖片1簡介" value="${plan == null  ? "" : plan.planPictureIntro1}">
                        </div>
                    </div>
                </div>
                <div class="form-row productInfoGroup">
                    <div class="col-lg-5 col-sm-6">
                        <label for="planPicture3" id="upload-img3" class="card mb-2 productcard">其他圖片
                            <input class="form-control" id="planPicture3" type="file" name="planPictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${plan == null  ? "" : plan.planPictures2}">
                            <i class="fa-regular fa-image" id="iconcamera3"></i>
                            <i class="delAvatar3 fa fa-times-circle-o" title="移除圖片"></i>
                        </label>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <label for="planPictureIntro2">圖片簡介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="planPictureIntro2" name="planPictureIntro2" placeholder="請輸入圖片2簡介" value="${plan == null  ? "" : plan.planPictureIntro2}">
                        </div>
                    </div>
                </div>
                <div class="form-row productInfoGroup">
                    <div class="col-lg-5 col-sm-6">
                        <label for="planPicture4" id="upload-img4" class="card mb-2 productcard">其他圖片
                            <input class="form-control" id="planPicture4" type="file" name="planPictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${plan == null  ? "" : plan.planPictures3}">
                            <i class="fa-regular fa-image" id="iconcamera4"></i>
                            <i class="delAvatar4 fa fa-times-circle-o" title="移除圖片"></i>
                        </label>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <label for="planPictureIntro3">圖片簡介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="planPictureIntro3" name="planPictureIntro3" placeholder="請輸入圖片3簡介" value="${plan == null  ? "" : plan.planPictureIntro3}">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-5">
                    <h3>請選擇方案場地</h3>
                    <div class="col-sm-10">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th></th>
                                <th scope="col">場地主圖片</th>
                                <th scope="col">場地標題</th>
                                <th scope="col">建議桌數區間</th>
                                <th scope="col">場地介紹</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="place" items="${placeList}" begin="0" end="${placeList.size()}">
                                <tr>
                                    <td>
                                        <label for="${place.placeId}" class="col-sm-2 col-form-label">
                                            <input type="checkbox"  id="${place.placeId}" name="placeId" value="${place.placeId}" />
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                                    </td>
                                    <td>${place.placeTitle}</td>
                                    <td>${place.numbeOfTables}</td>
                                    <td>${place.placeIntroduction}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-10 productAddBtn">
                    <input type="hidden" name="planProductId" value="${plan.planProductId}">
                    <input type="hidden" name="vendorId" value="${plan.vendorId}">
                    <a href="<%=request.getContextPath()%>/plan?vendorId=${vendor.vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
                    <button type="submit" class="btn btn-info" name="action" value="insert">儲存</button>
                </div>
            </form>
        </div>
    </div>

</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">
    //實現上傳圖片可以預覽所上傳的圖片,若重新上傳1其他圖片,可以移除舊的圖片預覽,只顯示最新的狀態
    for (let i = 1; i <= 4; i++) {
        let photo = document.getElementById(`planPicture\${i}`);
        let iconcamera = document.getElementById(`iconcamera\${i}`);
        let uploadimg = document.getElementById(`upload-img\${i}`);

        init(photo, iconcamera, uploadimg);
    }

    function init(photo, iconcamera, uploadimg) {
        photo.addEventListener("change", function (e) {
            $("#" + uploadimg.id + " img").remove();
            iconcamera.style.display = "block";
            let files = e.target.files;
            if (files !== null) {
                let file = files[0];
                if (file.type.indexOf('image') > -1) {
                    let reader = new FileReader();
                    reader.addEventListener('load', function (e) {
                        let result = e.target.result;
                        iconcamera.style.display = "none";
                        let img = document.createElement('img');
                        img.src = result;
                        uploadimg.append(img);
                    });
                    reader.readAsDataURL(file);
                } else {
                    alert('請上傳圖片！');
                }
            }
        });
    }
</script>
</body>
</html>