<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />
<jsp:useBean id="responseMsgMap" scope="request" type="java.util.HashMap"/>

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-edit"></i>修改方案場地
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}">方案場地管理</a></li>
		</ul>
	</div>
	<c:if test="${vendor.vendorId == place.vendorId}">
		<div class="row">
			<div class="col-md-12 productsAdd">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/plan-place" enctype="multipart/form-data">
					<c:forEach var="i" begin="1" end="1">
						<c:choose>
							<c:when test="${not empty place.placePicture}">
								<div class="col-lg-4 col-sm-6 pic1">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">場地主圖片
										<img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
										<input class="form-control" id="placePicture${i}" type="file" name="placePicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePicture}">
										<i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-sm-6 pic1">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">場地主圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePicture}">
										<i class="fa-regular fa-image" id="iconcamera${i}"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<br>
					<div class="form-group">
						<label for="placeTitle" class="col-sm-2 col-form-label">場地標題</label>
						<c:if test="${responseMsgMap.containsKey('placeTitle')}">
							<span class="errorMsg">${responseMsgMap['placeTitle']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="placeTitle" name="placeTitle" type="text" placeholder="請輸入場地標題" value="${place.placeTitle}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="numbeOfTables" class="col-sm-2 col-form-label">建議桌數區間</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="numbeOfTables" name="numbeOfTables" placeholder="請輸入建議桌數區間" value="${place.numbeOfTables}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="placeIntroduction" class="col-sm-2 col-form-label">場地介紹</label>
						<c:if test="${responseMsgMap.containsKey('placeIntroduction')}">
							<span class="errorMsg">${responseMsgMap['placeIntroduction']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="placeIntroduction" name="placeIntroduction" type="text" placeholder="請輸入場地介紹" value="${place.placeIntroduction}" required>
						</div>
					</div>
					<div class="form-group row col-sm-12 pic2" >
						<c:forEach var="i" begin="2" end="2">
							<c:choose>
								<c:when test="${not empty place.placePicture}">
									<div class="col-lg-4 col-sm-6 mr-5">
										<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
											<input class="form-control" id="placePicture${i}" type="file" name="placePictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures2}">
											<img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures2" class="rounded mx-auto d-block" alt="場地圖片2">
											<i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
											<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
										</label>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-lg-4 col-sm-6 mr-5">
										<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
											<input class="form-control" id="placePicture${i}" type="file" name="placePictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures2}">
											<i class="fa-regular fa-image" id="iconcamera${i}"></i>
											<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
										</label>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<c:forEach var="i" begin="3" end="3">
						<c:choose>
							<c:when test="${not empty place.placePicture}">
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures3}">
										<img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures3" class="rounded mx-auto d-block" alt="場地圖片3">
										<i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures3}">
										<i class="fa-regular fa-image" id="iconcamera${i}"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</div>
					<div class="form-group row col-sm-12 pic4">
					<c:forEach var="i" begin="4" end="4">
						<c:choose>
							<c:when test="${not empty place.placePicture}">
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures4" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures4}">
										<img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures4" class="rounded mx-auto d-block" alt="場地圖片4">
										<i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures4" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures4}">
										<i class="fa-regular fa-image" id="iconcamera${i}"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:forEach var="i" begin="5" end="5">
						<c:choose>
							<c:when test="${not empty place.placePicture}">
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures5" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures5}">
										<img width="300px" height="300px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures5" class="rounded mx-auto d-block" alt="場地圖片5">
										<i class="fa-regular fa-image" id="iconcamera${i}" style="display: none;"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-sm-6 mr-5">
									<label for="placePicture${i}" id="upload-img${i}" class="card mb-2 productcard">圖片
										<input class="form-control" id="placePicture${i}" type="file" name="placePictures${i}" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" value="${place == null ? '' : place.placePictures5}">
										<i class="fa-regular fa-image" id="iconcamera${i}"></i>
										<i class="delAvatar${i} fa fa-times-circle-o" title="移除圖片"></i>
									</label>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</div>
					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="placeId" value="${place.placeId}">
						<input type="hidden" name="vendorId" value="${place.vendorId}">
						<a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
						<button type="submit" class="btn btn-info" name="action" value="update">儲存</button>
					</div>
				</FORM>
			</div>
		</div>
	</c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">
	//實現上傳圖片可以預覽所上傳的圖片,若重新上傳1其他圖片,可以移除舊的圖片預覽,只顯示最新的狀態
	for (let i = 1; i <= 5; i++) {
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