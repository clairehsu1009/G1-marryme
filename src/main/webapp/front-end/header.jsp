<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>

<!-- Header Section Begin -->
<header id="header">
	<div class="header_tools">
		<div class="rwd_wrap">
			<ul class="on_pc left_toolbar">
				<li>
					<div class="member_welcome">
						<p class="member_name">
							您好 歡迎來到Marryme！置頂公告 - <a href="#"
								title="活動快報📣Marryme挺新人，找命定店家，送你一籮筐好禮嫁妝💖">活動快報📣Marryme挺新人，找命定店家，送你一籮筐好禮嫁妝💖</a><br>
						</p>
					</div>
				</li>
			</ul>
			<ul class="on_pc right_toolbar">
				<li class="pc_list"><a href="/marryme/front-end/product/shoppingCart.jsp"><i
						class="fas fa-cart-shopping"></i></a></li>
				<li class="pc_list"><a href="#" title="店家入駐" class="no_block">店家入駐</a></li>

				<%-- 判斷會員是否登入，可以改變要顯示之內容，不用切多個頁面 -->

<%--                <c:if test="${not empty userVO.user_id}">--%>
				<%--                    <div class="header-right">--%>
				<%--                        <FORM id="userLogOut" METHOD="post" class="logout-form"--%>
				<%--                              action="<%=request.getContextPath()%>/User_LogoutHandler">--%>
				<%--                            <a--%>
				<%--                                    href="<%=request.getContextPath()%>/front-end/protected/userIndex.jsp">--%>
				<%--									<span class="userLogin" style="cursor: pointer"><img--%>
				<%--                                            class="rounded-circle" width="45px" height="40px"--%>
				<%--                                            src="${pageContext.request.contextPath}/UserShowPhoto?user_id=${userVO.user_id}" />&nbsp;--%>
				<%--										${userVO.user_name} </span>--%>
				<%--                            </a> <input type="hidden" name="action" value="signOut"> <a--%>
				<%--                                href="#"--%>
				<%--                                onclick="document.getElementById('userLogOut').submit();"><button--%>
				<%--                                type="button" class="btn">登出</button></a>--%>
				<%--                        </FORM>--%>
				<%--                    </div>--%>
				<%--                </c:if>--%>
				<%--                <c:if test="${empty userVO.user_id}">--%>
				<%--                    <div class="header-right">--%>
				<%--                        <a--%>
				<%--                                href="<%=request.getContextPath()%>/front-end/user/register.jsp"><button--%>
				<%--                                type="button" class="btn">註冊</button></a> <a--%>
				<%--                            href="<%=request.getContextPath()%>/front-end/userLogin.jsp" ><button--%>
				<%--                            type="button" class="btn">登入</button></a>--%>
				<%--                    </div>--%>
				<%--                </c:if>--%>

				<li class="pc_list"><a href="#" title="登入" class="no_block">登入</a></li>
				<li class="pc_list"><a href="#" title="免費註冊" class="no_block">註冊</a></li>
			</ul>
			<div style="display: none;" id="header_menu" class="mobile_tools">
				<div class="mobile_menu">
					<div class="top_bar">
						<a href="#" title="活動快報📣Marryme挺新人，找命定店家，送你一籮筐好禮嫁妝💖"><img
							src="${pageContext.request.contextPath}/public/images/front-end/2d6788.svg"><span>
								活動快報📣Marryme挺新人，找命定店家，送你一籮筐好禮嫁妝💖</span></a>
					</div>
					<div class="member_area">
						<div class="profile_pic">
							<img
								src="${pageContext.request.contextPath}/public/images/front-end/MarryBar_default_avatar_20200827_1.jpg">
						</div>
						<p class="text">您好，歡迎來到Marryme</p>
						<div class="btn_groups">
							<a href="#" class="btn_outline" title="免費註冊">免費註冊</a><a href="#"
								class="btn_contain" title="登入">登入</a>
						</div>
						<a href="#" class="btn_text" title="店家免費駐站">店家免費駐站</a>
					</div>
					<div data-a_id="9167"></div>
					<ul class="list_area">
						<li><a href="#" title="專欄">專欄</a></li>
						<li><a href="#" title="論壇">論壇</a></li>
						<li><a href="#" title="客服中心">客服中心</a></li>
						<li><a href="#" title="關於我們">關於我們</a></li>
					</ul>
					<ul class="list_area">
						<li class="title">找店家</li>
						<li><a href="#" title="婚宴場地">婚宴場地 </a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/findAllShopProduct?productCategoryId=1"
							title="婚戒">婚戒</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/findAllShopProduct?productCategoryId=2"
							title="婚禮小物">婚禮小物</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/findAllShopProduct?productCategoryId=3"
							title="高跟鞋/西裝鞋">高跟鞋/西裝鞋</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/findAllShopProduct?productCategoryId=4"
							title="喜餅">喜餅</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/findAllShopProduct?productCategoryId=5"
							title="婚紗禮服">婚紗禮服</a></li>
					</ul>
				</div>
				<a class="menu_close"> <img
					src="${pageContext.request.contextPath}/public/images/front-end/popclose.svg">
				</a>
			</div>
		</div>
	</div>
	<div class="rwd_wrap group" app_into_hide="1">
		<div class="col lg_12 md_12 sm_12">
			<div class="logo_menu clearfix">
				<h2 class="logo">
					<a href="#" title="Marryme"
						style="background: url(/marryme/public/images/front-end/marryme.png) top left no-repeat; background-size: 100%">Marryme</a>
				</h2>
				<ul class="pc_menu">
					<li class="pc_menu_more"><a href="" class="onit">找店家<img
							class="arrow"
							src="${pageContext.request.contextPath}/public/images/front-end/line_black.svg"></a>
						<div class="sub_m">
							<div data-a_id="9167"></div>
							<div class="sub_m_list">
								<p>辦婚禮</p>
								<ul>
									<li><a href="#">婚宴場地</a></li>
								</ul>
							</div>
							<div class="sub_m_list">
								<p>婚禮週邊</p>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=1">婚戒</a></li>
									<li><a
										href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=2">喜餅</a></li>
									<li><a
										href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=3">婚禮小物</a></li>
									<li><a
										href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=4">婚紗/禮服</a></li>
									<li><a
										href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=5">高跟鞋/西裝鞋</a></li>
								</ul>
							</div>
						</div></li>

					<li><a href="#" class="">專欄</a></li>
					<li><a href="#" class="">論壇</a></li>
					<li><a href="#" class="">客服中心</a></li>
					<li><a href="#" class="">關於我們</a></li>
				</ul>
				<span class="mobile_icon radius_3" id="header_menu_main"
					app_into_hide='1'></span>
				<div class="more_tools">
					<div id="kwds_rs_bid" class="searchBar acResults">
						<input name="kwds_bid" id="kwds_bid" type="text" placeholder="搜尋"
							class="default"> <span class="btn_search"> <a
							href="#" app_into_hide='1' id="search_submit_btn"
							style="background: url(/marryme/public/images/front-end/search.svg) no-repeat left top;">搜尋</a>
						</span>
					</div>
				</div>
			</div>
		</div>
</header>
<!-- Header End -->
<script>
	
</script>