<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar"
                                        src="${pageContext.request.contextPath}/public/images/front-end/my_pic.png"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-designation" style="font-size:20px;">Welcome</p>
            <p class="app-sidebar__user-name" style="font-size:8px;">${member.memberId}</p>
        </div>
    </div>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/front-end/user/userIndex.jsp"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">會員首頁</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">會員資料管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="#"><i class="icon fa fa-archive"></i>我的商品</a></li>
                <li><a class="treeview-item" href="#"><i class="icon fa fa-edit"></i>新增商品</a></li>
            </ul>
        </li>

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">商品訂單</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/order/findOrderByMemberId?memberId=${member.memberId}&orderStatus=1"><i class="icon fa fa-archive"></i>我的購買訂單</a></li>

            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">預約賞廳</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/reservationUser?memberId=${memberId}"><i class="icon fa fa-archive"></i>預約時間</a></li>
                <li><a class="treeview-item" href="#"><i class="icon fa fa-edit"></i>追蹤廠商</a></li>
            </ul>
        </li>


        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-credit-card"></i><span class="app-menu__label">我的訂單</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/plan-order?memberId=${member.memberId}"><i class="icon fa fa-th-list"></i>結婚方案訂單</a></li>
            </ul>
        </li>

      
        <li class="treeview">
            <form id="myForm" action=""
                  method="POST">
                <input value="" name="userName" type="hidden"/>
                <a class="app-menu__item" href="#" onclick=""><i
                        class="app-menu__icon fa fa-shopping-bag">&nbsp;&nbsp;&nbsp;</i><span class="app-menu__label">線上客服&nbsp;</span><i
                        class="treeview-indicator fa fa-angle-right"></i></a>
            </form>
        </li>
    </ul>
</aside>
               