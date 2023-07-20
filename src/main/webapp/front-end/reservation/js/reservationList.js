var btnUpdate = document.querySelector("#RUpdate");

btnUpdate.addEventListener('click', function (event) {
    event.preventDefault();

    // 跳出確認刪除的提示框
    var confirmed = confirm("確定要刪除嗎?");

    if (confirmed) {
        var rowToDelete = this.closest('tr'); // 找到最近的 <tr> 元素
        var reservationId = rowToDelete.dataset.reservationId;
        // 進行刪除操作
        deleteReservation(reservationId);
    } else {
        // 如果使用者取消刪除，則直接返回
        return;
    }
});



fetch(`/marryMe/reservation/${reservationId}`, {
    method: 'DELETE',
    headers: {
        'Content-Type': 'application/json',
    },
})
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        } else {
            return response.text()
        }
    })
    .then(data => {
        try {
            return JSON.parse(data);
        } catch {
            console.error("This is not JSON format", data);
            return {};
        }
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error:', error));