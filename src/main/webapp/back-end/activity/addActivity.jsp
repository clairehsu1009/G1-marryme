<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>新增優惠碼 - 廠商後台 - MarryMe</title>
    <link href="<%=request.getContextPath()%>/public/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/back-end/activity/css/add.css" rel="stylesheet" type="text/css">
</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>
    <div class="col lg_9 md_12 sm_12 page_container">
        <h1 class="page_title">新增優惠碼</h1>
        <form method="post" action="/marryme/activity/add" name="edit_form">
            <div class="page_content">
                <div class="content_border">
                    <h3 class="title">優惠碼資料</h3>
                    <ul>
                        <li class="form_item">
                            <span class="item_name"><i>*</i>優惠代碼</span>
                            <input type="text" pattern="[0-9a-zA-Z]+" size="10" maxlength="10" value=""
                                id="discountCode" name="discountCode"
                                class="basic_input input_code title_count_input_js" required>
                            <span class="status" style="display:none"><i></i></span>
                        </li>
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name">廠商帳號</span> -->
<!--                             <input type="text" value="" id="vendorId" name="vendorId" -->
<!--                                 class="basic_input input_code title_count_input_js"> -->
<!--                         </li> -->
                        <li class="form_item">
                            <span class="item_name"><i>*</i>優惠活動名稱</span>
                            <input type="text" size="10" maxlength="50" value="" id="activityName" name="activityName"
                                class="basic_input input_code title_count_input_js" required>
                        </li>
                        <li class="form_item">
                            <span class="item_name"><i>*</i>折扣額度</span>
                            <input type="number" size="10" value="" id="discount" name="discount"
                                class="basic_input input_code title_count_input_js" step="0.01" required>
                        </li>
                        <li class="form_item">
                            <span class="item_name"><i>*</i>活動開始時間</span>
                            <input type="datetime-local" size="20" value="" id="activityStartTime" name="activityStartTime"
                                placeholder="" class="basic_input input_code" required>
                        </li>
                        <li class="form_item">
                            <span class="item_name"><i>*</i>活動結束時間</span>
                            <input type="datetime-local" size="20" value="" id="activityEndTime" name="activityEndTime" placeholder=""
                                class="basic_input input_code" required>
                        </li>
                        <li class="form_item">
                            <span class="item_name"><i>*</i>活動內容</span>
                            <div class="item_content">
                                <textarea id="activityDetail" name="activityDetail" rows="" cols=""
                                    class="basic_input input_code story_count_input_js" placeholder=""
                                    style="overflow-y: scroll;height: 180px;"></textarea>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="form_btn">
                    <a class="btn_common btn_primary" href="javascript:void(0);" title="取消"
                        onclick="confirmCancel()">取消</a>
                </div>
                <div class="form_btn">
                    <button type="submit" class="btn_common btn_primary" title="儲存">儲存</button>
                </div>
            </div>
        </form>
    </div>
    
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back-end/activity/js/add.js"></script>
</body>

</html>