function confirmCancel() {
    var fields = document.getElementsByTagName("input");
    var hasData = false;
    for (var i = 0; i < fields.length; i++) {
        if (fields[i].type !== "submit" && fields[i].value !== "") {
            hasData = true;
            break;
        }
    }

    var textareas = document.getElementsByTagName("textarea");
    for (var j = 0; j < textareas.length; j++) {
        if (textareas[j].value !== "") {
            hasData = true;
            break;
        }
    }

    if (hasData) {
        var confirmMessage = "活動資訊尚未儲存，您確定要離開嗎?";
        if (!confirm(confirmMessage)) {
            return;
        }
    }

    // 返回後台首頁的動作
    window.location.href = "http://localhost:8081/my-first-project/activity";
}

// 綁定取消按鈕的點擊事件
document.getElementById("cancelButton").addEventListener("click", confirmCancel);
