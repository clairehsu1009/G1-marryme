<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>

<script>

    // 如果有後端的exception 訊息，會跳出錯誤訊息視窗
    <c:if test="${errorMsgMap.containsKey('exception')}">
    Swal.fire({
        icon: 'error',
        title: '',
        text: '${errorMsgMap.get('exception')}',
    })
    </c:if>

</script>
