// 定義千分位格式化函式
function formatThousand(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 網頁載入時呼叫此函式處理價格
window.addEventListener('load', function() {
	const platformPriceElement = document.getElementById('platformPrice');
	const platformPriceValue = parseInt(platformPriceElement.textContent);
	platformPriceElement.textContent = formatThousand(platformPriceValue);
});


/* @input 將輸入框本身填入
		  @id 將商品id傳遞進來，告訴伺服器是修改哪一個購物項目
		  @oldValue 原本的值，如果使用者不想修改了，就修改為原本的值
	   */
function update(input, id, oldValue) {

	// 獲取得到輸入框的數據
	var quantity = input.value;

	// 詢問使用者是否真的修改
	var b = window.confirm("你確定修改嗎？");

	// 如果確定修改，就跳轉到修改的Servlet上
	if (b) {
		window.location.href = "${pageContext.request.contextPath}/product/updateCartQuantity?productId=" + id + "&quantity=" + quantity + "";
	} else {
		// 如果不確定修改，將輸入框的數據改成原來的值
		input.value = oldValue;
	}
}


document.getElementById('clearCartBtn').addEventListener('click', function(event) {
	event.preventDefault(); // 阻止按鈕的默認行為，避免直接跳轉到連結

	// 使用 Swal.fire 顯示彈出提醒訊息
	Swal.fire({
		title: '確認清空購物車？',
		text: '您確定要清空購物車嗎？此操作無法恢復。',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: '確定',
		cancelButtonText: '取消',
	}).then((result) => {
		// 使用者按下確定後執行相應的動作
		if (result.isConfirmed) {
			// 使用者按下確定後，將連結送到後端清除
			window.location.href = event.target.href;
		}
	});
});