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
            <p class="app-sidebar__user-name" style="font-size:8px;">${vendor.vendorId}</p>
        </div>
    </div>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/front-end/vendor/vendorIndex.jsp"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">廠商首頁</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#"  data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">商品管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/product/findAll?vendorId=${vendor.vendorId}"><i class="icon fa fa-archive"></i>我的商品</a></li>
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/front-end/vendor/product/addProduct.jsp"><i class="icon fa fa-edit"></i>新增商品</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">方案管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/plan?vendorId=${vendor.vendorId}"><i class="icon fa fa-archive"></i>我的方案</a></li>
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/front-end/vendor/plan/plan/addPlanProduct.jsp?vendorId=${vendor.vendorId}"><i class="icon fa fa-edit"></i>新增方案</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">方案場地管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}"><i class="icon fa fa-archive"></i>我的場地</a></li>
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/front-end/vendor/plan/place/addPlanPlace.jsp?vendorId=${vendor.vendorId}"><i class="icon fa fa-edit"></i>新增場地</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">方案加購項目管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/plan-item?vendorId=${vendor.vendorId}"><i class="icon fa fa-archive"></i>方案加購項目</a></li>
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/front-end/vendor/plan/planItem/addPlanItem.jsp?vendorId=${vendor.vendorId}"><i class="icon fa fa-edit"></i>新增加購項目</a></li>
            </ul>
        </li>

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">訂單管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=1"><i class="icon fa fa-th-list"></i>商品訂單</a></li>
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/plan-order?vendorId=${vendor.vendorId}"><i class="icon fa fa-th-list"></i>方案訂單</a></li>
            </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                class="app-menu__icon fa fa-shopping-bag"></i><span class="app-menu__label">預約管理</span><i
                class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}"><i 
                class="icon fa fa-archive"></i>預約明細</a></li>
<!--                 <li><a class="treeview-item" href="#"><i class="icon fa fa-edit"></i>其他</a></li> -->
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
               