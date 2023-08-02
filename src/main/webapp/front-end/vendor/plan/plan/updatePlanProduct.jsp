<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.vo.Place" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="plan" scope="request" class="com.marryme.plan.vo.Plan" />
<jsp:useBean id="responseMsgMap" scope="request" type="java.util.HashMap"/>

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<%
    PlaceService placeService = new PlaceServiceImpl();
    List<Place> placeList = placeService.findAllByVendorId(vendorId);
    pageContext.setAttribute("placeList", placeList);
%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>
<style>
/* 將 .productAddBtn 元素設定為 flex 容器，使其子元素能水平對齊 */
.productAddBtn {
display: flex;
justify-content: center; /* 讓內容水平置中 */
}

/* 調整按鈕間的間距 */
.productAddBtn button {
margin: 0 5px; /* 可自行調整間距大小 */
}
</style>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-edit"></i>修改方案
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan?vendorId=${vendorId}">方案管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
    <c:if test="${vendorId == plan.vendorId}">
        <div class="row">
            <div class="col-md-12 productsAdd">
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/plan" enctype="multipart/form-data">
                    <c:forEach var="i" begin="1" end="1">
                        <c:choose>
                            <c:when test="${not empty plan.planPicture}">
                                <div class="col-lg-4 col-sm-6 pic1">
                                    <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">方案主圖片
                                        <img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
                                        <input class="form-control" id="placePicture${i}" type="file" name="planPicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPicture}">
                                        <i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
                                        <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                    </label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-lg-4 col-sm-6 pic1">
                                    <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">方案主圖片
                                        <input class="form-control" id="placePicture${i}" type="file" name="planPicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPicture}">
                                        <i class="fa-regular fa-image" id="iconcamera${i}"></i>
                                        <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                    </label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <br>
                    <div class="form-group">
                        <label for="planTitle" class="col-sm-2 col-form-label">方案標題</label>
                        <c:if test="${responseMsgMap.containsKey('planTitle')}">
                            <span class="errorMsg">${responseMsgMap['planTitle']}</span>
                        </c:if>
                        <div class="col-sm-10">
                            <input class="form-control" id="planTitle" name="planTitle" type="text" placeholder="請輸入方案標題" value="${plan.planTitle}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="planIntroduction" class="col-sm-2 col-form-label">方案介紹</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="planIntroduction" name="planIntroduction" placeholder="請輸入方案介紹" value="${plan.planIntroduction}" required>
                        </div>
                    </div>
                    <div class="form-group row col-sm-12 pic2" >
                        <c:forEach var="i" begin="2" end="2">
                            <c:choose>
                                <c:when test="${not empty plan.planPictures1}">
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片1
                                            <input class="form-control" id="placePicture${i}" type="file" name="planPictures1" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures1}">
                                            <img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures1" class="rounded mx-auto d-block" alt="方案圖片1">
                                            <i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片1
                                            <input class="form-control" id="placePicture${i}" type="file" name="planPictures1" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures1}">
                                            <i class="fa-regular fa-image" id="iconcamera${i}"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                        <div class="form-group">
                            <label for="planPictureIntro1" class="col-sm-2 col-form-label">圖片1簡介</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="planPictureIntro1" name="planPictureIntro1" placeholder="請輸入圖片2簡介" value="${plan.planPictureIntro2}">
                            </div>
                        </div>
                        <c:forEach var="i" begin="3" end="3">
                            <c:choose>
                                <c:when test="${not empty plan.planPictures2}">
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片2
                                            <input class="form-control" id="placePicture${i}" type="file" name="planPictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures2}">
                                            <img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures2" class="rounded mx-auto d-block" alt="方案圖片2">
                                            <i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片2
                                            <input class="form-control" id="placePicture${i}" type="file" name="planPictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures2}">
                                            <i class="fa-regular fa-image" id="iconcamera${i}"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <div class="form-group">
                        <label for="planPictureIntro2" class="col-sm-2 col-form-label">圖片2簡介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="planPictureIntro2" name="planPictureIntro2" placeholder="請輸入圖片2簡介" value="${plan.planPictureIntro2}">
                        </div>
                    </div>
                    <div class="form-group row col-sm-12 pic4">
                        <c:forEach var="i" begin="4" end="4">
                            <c:choose>
                                <c:when test="${not empty plan.planPictures3}">
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片3
                                            <input class="form-control" id="placePicture${i}" type="file" name="placePictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures3}">
                                            <img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures3" class="rounded mx-auto d-block" alt="方案圖片3">
                                            <i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-lg-4 col-sm-6 mr-5">
                                        <label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片3
                                            <input class="form-control" id="placePicture${i}" type="file" name="placePictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${plan == null ? '' : plan.planPictures3}">
                                            <i class="fa-regular fa-image" id="iconcamera${i}"></i>
                                            <i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
                                        </label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                        <div class="form-group">
                            <label for="planPictureIntro3" class="col-sm-2 col-form-label">圖片3簡介</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="planPictureIntro3" name="planPictureIntro3" placeholder="請輸入圖片3簡介" value="${plan.planPictureIntro3}">
                            </div>
                        </div>
                        <br><br>
                        <h3>請選擇方案場地</h3>
                        <c:if test="${responseMsgMap.containsKey('placeList')}">
                        <span class="errorMsg">${responseMsgMap['placeList']}</span>
                        </c:if>
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
                    <a href="<%=request.getContextPath()%>/plan?vendorId=${vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
                    <button type="submit" class="btn btn-info" name="action" value="update">儲存</button>
                </div>
            </form>
        </div>
    </c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">
    //實現上傳圖片可以預覽所上傳的圖片,若重新上傳1其他圖片,可以移除舊的圖片預覽,只顯示最新的狀態
    for (let i = 1; i <= 4; i++) {
        let photo = document.getElementById(`placePicture\${i}`);
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