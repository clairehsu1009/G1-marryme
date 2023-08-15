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
            <p class="app-sidebar__user-name">會員名字</p>
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
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">商品管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="${pageContext.request.contextPath}/product/getProductByStatus?&productStatus=0"><i class="icon fa fa-archive"></i>商品總覽</a></li>
            </ul>
        </li>

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">商品訂單管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="${pageContext.request.contextPath}/order/getOrderByStatus?orderStatus=1"><i class="icon fa fa-th-list"></i>商品訂單總覽</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">直播訂單管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="#"><i class="icon fa fa-th-list"></i>我的購買訂單</a></li>
                <li><a class="treeview-item" href="#"><i class="icon fa fa-th-list"></i>我的販賣訂單</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">直播專案管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li>
                    <a class="treeview-item" href="#"><i class="icon fa fa-edit"></i>新增直播專案</a>
                <li>
                <li><a class="treeview-item" href="#"><i class="icon fa fa-th-list"></i>我的直播專案</a></li>
                <li>
                    <a class="treeview-item" href="#"><i class="icon fa fa-archive"></i>我的歷史專案</a>
                <li>
            </ul>
        </li>
        <li class="treeview">
            <a class="app-menu__item" href="#" target="_blank"><i class="app-menu__icon fa fa-diamond"></i><span
                    class="app-menu__label">前往我的賣場</span><i class="treeview-indicator fa fa-angle-right"></i></a>
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
               