<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>

<script>

    // 如果有後端的exception 訊息，會跳出錯誤訊息視窗
    <c:if test="${responseMsgMap.containsKey('exception')}">
    Swal.fire({
        icon: 'error',
        title: '',
        text: '${responseMsgMap.get('exception')}',
    })
    </c:if>

    // 如果有後端的請求成功訊息，會跳出成功訊息視窗
    <c:if test="${responseMsgMap.containsKey('success')}">
    Swal.fire({
        icon: 'success',
        title: '',
        text: '${responseMsgMap.get('success')}',
    })
    </c:if>

</script>
