// 定義千分位格式化函式
function formatThousand(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 網頁載入時呼叫此函式處理價格
window.addEventListener('load', function() {
	const platformPriceElement = document.getElementById('platformPrice');
	const originalPriceElement = document.getElementById('originalPrice');

	const platformPriceValue = parseInt(platformPriceElement.textContent);
	const originalPriceValue = parseInt(originalPriceElement.textContent);

	platformPriceElement.textContent = formatThousand(platformPriceValue);
	originalPriceElement.textContent = formatThousand(originalPriceValue);
});
