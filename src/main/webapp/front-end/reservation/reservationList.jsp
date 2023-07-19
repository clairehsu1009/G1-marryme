<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%


%>

<!DOCTYPE html>
<html lang="zh-tw">
<jsp:include page="/back-end/common/backHead.jsp"/>
<body class="app sidebar-mini rtl">
<jsp:include page="/back-end/common/backSidebar.jsp"/>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>所有直售商品</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">直售商品管理</a></li>
        </ul>
    </div>
    <div class="row ProductList">
        <div class="product-tab col-lg-12">
            <div class="tab-item">
                <ul class="nav" role="tablist">
                    <li>
                        <a class="active" data-toggle="tab" href="#tab-1" role="tab"
                        >未上架商品</a
                        >
                    </li>
                    <li>
                        <a data-toggle="tab" href="#tab-2" role="tab">直售商品</a>
                    </li>

                    <li>
                        <a data-toggle="tab" href="#tab-3" role="tab">已售出</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#tab-4" role="tab"
                        >違規下架</a
                        >
                    </li>
                </ul>
            </div>
            <div class="tab-item-content">
                <div class="tab-content">
                    <div
                            class="tab-pane fade-in active"
                            id="tab-1"
                            role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">客戶名稱</th>
                                <th scope="col">聯繫電話</th>
                                <th scope="col">宴客日期</th>
                                <th scope="col">預約日期</th>
                                <th scope="col">備註</th>    
                                                
                            </tr>
<!--                             <button class="submitBtn data-g-reserve-pop-form-send" name="" id="submitReservation">更新</a>  -->
                            </thead>
                            <tbody>
                            <c:forEach var="productVO" items="${list}" begin="0" end="${list.size()}">
                                <c:if test="${productVO.product_state == 0}">
                                    <tr>
                                        <th scope="row">${productVO.product_no}</th>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/product/product.do?product_no=${productVO.product_no}"
                                               target="_blank">
                                                <img width="200px" height="200px"
                                                     src="${pageContext.request.contextPath}/ProductShowPhoto?product_no=${productVO.product_no}"
                                                     class="rounded mx-auto d-block" alt="">
                                            </a>
                                        </td>
                                        <td>${productVO.product_name}</td>
                                        <td class="productInfo">
                                        <textarea class="form-control" maxlength="300" rows="6"  
                                        	readonly>${productVO.product_info}</textarea>
                                        </td>
                                        <td>${productVO.product_price}</td>
                                        <td>${productVO.product_remaining}</td>
                                        <td>${productVO.product_sold}</td>
                                        <td>${product_typeSvc.getOneProduct_Type(productVO.pdtype_no).pdtype_name}</td>
                                        <td>${productVO.user_id}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="tab-2" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">客戶名稱</th>
                                <th scope="col">聯繫電話</th>
                                <th scope="col">宴客日期</th>
                                <th scope="col">預約日期</th>
                                <th scope="col">備註</th>  
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="productVO" items="${list}" begin="0" end="${list.size()}">
                                <c:if test="${productVO.product_state == 1}">
                                    <tr>
                                        <th scope="row">${productVO.product_no}</th>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/product/product.do?product_no=${productVO.product_no}"
                                               target="_blank">
                                                <img width="200px" height="200px"
                                                     src="${pageContext.request.contextPath}/ProductShowPhoto?product_no=${productVO.product_no}"
                                                     class="rounded mx-auto d-block" alt="">
                                            </a>
                                        </td>
                                        <td>${productVO.product_name}</td>
                                        <td class="productInfo"><textarea class="form-control" maxlength="300" rows="6"
                                                                          readonly>${productVO.product_info}</textarea>
                                        </td>
                                        <td>${productVO.product_price}</td>
                                        <td>${productVO.product_remaining}</td>
                                        <td>${productVO.product_sold}</td>
                                        <td>${product_typeSvc.getOneProduct_Type(productVO.pdtype_no).pdtype_name}</td>
                                        <td>${productVO.user_id}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="tab-3" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">客戶名稱</th>
                                <th scope="col">聯繫電話</th>
                                <th scope="col">宴客日期</th>
                                <th scope="col">預約日期</th>
                                <th scope="col">備註</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="productVO" items="${list}" begin="0" end="${list.size()}" varStatus="i">
                                <c:if test="${productVO.product_state == 3}">
                                    <tr>
                                        <th scope="row">${productVO.product_no}</th>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/product/product.do?product_no=${productVO.product_no}"
                                               target="_blank">
                                                <img width="200px" height="200px"
                                                     src="${pageContext.request.contextPath}/ProductShowPhoto?product_no=${productVO.product_no}"
                                                     class="rounded mx-auto d-block" alt="">
                                            </a>
                                        </td>
                                        <td>${productVO.product_name}</td>
                                        <td class="productInfo"><textarea class="form-control" maxlength="300" rows="6"
                                                                          readonly>${productVO.product_info}</textarea>
                                        </td>
                                        <td>${productVO.product_price}</td>
                                        <td>
                                            <button type="" class="btn btn-success">已售出</button>
                                        </td>
                                        <td>${product_typeSvc.getOneProduct_Type(productVO.pdtype_no).pdtype_name}</td>
                                        <td>${productVO.user_id}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="tab-4" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">客戶名稱</th>
                                <th scope="col">聯繫電話</th>
                                <th scope="col">宴客日期</th>
                                <th scope="col">預約日期</th>
                                <th scope="col">備註</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="productVO" items="${list}" begin="0" end="${list.size()}" varStatus="i">
                                <c:if test="${productVO.product_state == 5}">
                                    <tr>
                                        <th scope="row">${productVO.product_no}</th>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/product/product.do?product_no=${productVO.product_no}"
                                               target="_blank">
                                                <img width="200px" height="200px"
                                                     src="${pageContext.request.contextPath}/ProductShowPhoto?product_no=${productVO.product_no}"
                                                     class="rounded mx-auto d-block" alt="">
                                            </a>
                                        </td>
                                        <td>${productVO.product_name}</td>
                                        <td class="productInfo"><textarea class="form-control" maxlength="300" rows="6"
                                                                          readonly>${productVO.product_info}</textarea>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>${productVO.user_id}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>

</body>
</html>