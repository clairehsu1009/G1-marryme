<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="Place" scope="request" class="com.marryme.plan.vo.Place" />

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-plus">&nbsp;</i>新增場地
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}">方案場地管理</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12 productsAdd">
			<form method="post" action="<%=request.getContextPath()%>/plan-place" enctype="multipart/form-data">
				<div class="col-lg-4 col-sm-6 pic1">
					<label for="placePicture1" id="upload-img1" class="card mb-2 productcard">場地主圖片
						<input class="form-control" id="placePicture1" type="file" name="placePicture" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${Place == null  ? "" : Place.placePicture}">
						<i class="fa-regular fa-image" id="iconcamera1"></i>
						<i class="delAvatar1 fa fa-times-circle-o" title="移除圖片"></i>
					</label>
				</div>
				<br>
				<div class="form-group">
					<label for="placeTitle" class="col-sm-2 col-form-label">場地標題</label>
					<c:if test="${responseMsgMap.containsKey('placeTitle')}">
						<span class="errorMsg">${responseMsgMap['placeTitle']}</span>
					</c:if>
					<div class="col-sm-10">
						<input class="form-control" id="placeTitle" name="placeTitle" placeholder="請輸入場地標題"  type="text" value="${Place == null  ? "" : Place.placeTitle}" required>
					</div>
				</div>
				<div class="form-group">
					<label for="numbeOfTables" class="col-sm-2 col-form-label">建議桌數區間</label>
					<c:if test="${responseMsgMap.containsKey('numbeOfTables')}">
						<span class="errorMsg">${responseMsgMap['numbeOfTables']}</span>
					</c:if>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="numbeOfTables" name="numbeOfTables" placeholder="請輸入建議桌數區間" value="${Place == null  ? "" : Place.numbeOfTables}" required>
					</div>
				</div>
				<div class="form-group">
					<label for="placeIntroduction" class="col-sm-2 col-form-label">場地介紹</label>
					<c:if test="${responseMsgMap.containsKey('placeIntroduction')}">
						<span class="errorMsg">${responseMsgMap['placeIntroduction']}</span>
					</c:if>
					<div class="col-sm-10">
						<input class="form-control" id="placeIntroduction" name="placeIntroduction" type="text" placeholder="請輸入場地介紹" value="${Place == null  ? "" : Place.placeIntroduction}" required>
					</div>
				</div>
				<div class="form-group row col-sm-12 pic2" >
					<div class="col-lg-4 col-sm-6 mr-5">
						<label for="placePicture2" id="upload-img2" class="card mb-2 productcard">圖片
							<input class="form-control" id="placePicture2" type="file" name="placePictures2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${Place == null  ? "" : Place.placePicture}">
							<i class="fa-regular fa-image" id="iconcamera2"></i>
							<i class="delAvatar2 fa fa-times-circle-o" title="移除圖片"></i>
						</label>
					</div>
					<div class="col-lg-4 col-sm-6 pic3">
						<label for="placePicture3" id="upload-img3" class="card mb-2 productcard">圖片
							<input class="form-control" id="placePicture3" type="file" name="placePictures3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${Place == null  ? "" : Place.placePicture}">
							<i class="fa-regular fa-image" id="iconcamera3"></i>
							<i class="delAvatar3 fa fa-times-circle-o" title="移除圖片"></i>
						</label>
					</div>
				</div>
				<div class="form-group row col-sm-12 pic4">
					<div class="col-lg-4 col-sm-6 mr-5">
						<label for="placePicture4" id="upload-img4" class="card mb-2 productcard">圖片
							<input class="form-control" id="placePicture4" type="file" name="placePictures4" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${Place == null  ? "" : Place.placePicture}">
							<i class="fa-regular fa-image" id="iconcamera4"></i>
							<i class="delAvatar4 fa fa-times-circle-o" title="移除圖片"></i>
						</label>
					</div>
					<div class="col-lg-4 col-sm-6 pic5">
						<label for="placePicture5" id="upload-img5" class="card mb-2 productcard">圖片
							<input class="form-control" id="placePicture5" type="file" name="placePictures5" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"  value="${Place == null  ? "" : Place.placePicture}">
							<i class="fa-regular fa-image" id="iconcamera5"></i>
							<i class="delAvatar5 fa fa-times-circle-o" title="移除圖片"></i>
						</label>
					</div>
				</div>
				<div class="col-sm-10 productAddBtn">
					<input type="hidden" name="vendorId" value="${vendor.vendorId}">
					<a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
					<button type="submit" class="btn btn-info" name="action" value="insert">儲存</button>
				</div>
			</form>
		</div>
	</div>

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