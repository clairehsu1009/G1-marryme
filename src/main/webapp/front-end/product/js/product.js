const sortData = (selectedOption, data) => {
	if (selectedOption === "lowToHigh") {
		data.sort((a, b) => a.platformPrice - b.platformPrice);
	} else if (selectedOption === "highToLow") {
		data.sort((a, b) => b.platformPrice - a.platformPrice);
	}
	return data;
};

const init = () => {
	// 獲取 URL 中的 productCategoryId 參數
	const urlParams = new URLSearchParams(window.location.search);
	const productCategoryId = urlParams.get('productCategoryId');
	// 使用Fetch API呼叫後端Servlet取得商品資料
	const currentDomain = window.location.origin;
	const apiUrl = `${currentDomain}/marryme/product/findAllShopProduct?productCategoryId=${productCategoryId}`;

	const loadingElement = document.getElementById("loading");
	loadingElement.style.display = "block"; // 顯示 loading 元素

	fetch(apiUrl) // 替換成實際的Servlet URL
		.then(response => response.json())
		.then(data => {
			// 獲取產品類別名稱
            const productCategoryName = data[0].productCategoryName;
            // 在你的 JSP 頁面中顯示產品類別名稱
            const categoryNameElement = document.getElementById("categoryName");
            const categoryNameElementForTitle = document.getElementById("channel_title");
			categoryNameElement.textContent = productCategoryName;
            categoryNameElementForTitle.textContent = productCategoryName + "推薦商品";
			
			
			// 將取得的商品資料顯示在網頁上
			const serviceList = document.getElementById("service_list");

			// 獲取選擇排序選項的元素
			const sortOption = document.getElementById("sort_option");
			// 添加 change 事件監聽
			sortOption.addEventListener("change", () => {
				const selectedSortOption = sortOption.value; // 獲取選擇的排序選項的值
				if (selectedSortOption === "default") {
					// 隨機顯示商品列表
					serviceList.innerHTML = ""; // 清空商品列表
					data.forEach((item) => {
						const ulElement = document.createElement("ul");
						ulElement.className = "good_box";
						ulElement.id = item.id;
						ulElement.setAttribute("data-cltk", item.id);

						const liImage = document.createElement("li");
						const aImage = document.createElement("a");
						aImage.title = item.title;
						aImage.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aImage.className = "cltk_click";
						aImage.setAttribute("data-cltk-id", item.id);
						const imgElement = document.createElement("img");
						imgElement.className = "good_pic";
						imgElement.style.marginLeft = "0px";
						imgElement.style.marginTop = "0px";
						imgElement.title = item.title;
						imgElement.alt = item.title;
						imgElement.src = "data:image/png;base64," + item.image;
						aImage.appendChild(imgElement);
						liImage.appendChild(aImage);

						const liTitle = document.createElement("li");
						const h2Title = document.createElement("h2");
						const aTitle = document.createElement("a");
						aTitle.title = item.title;
						aTitle.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aTitle.className = "cltk_click";
						aTitle.setAttribute("data-cltk-id", item.id);
						const spanTitle = document.createElement("span");
						spanTitle.className = "good_name";
						spanTitle.textContent = item.title;
						aTitle.appendChild(spanTitle);
						h2Title.appendChild(aTitle);
						liTitle.appendChild(h2Title);

						const liShop = document.createElement("li");
						const aShop = document.createElement("a");
						aShop.title = item.title;
						aShop.className = "cltk_click";
						aShop.setAttribute("data-cltk-id", item.id);
						const spanShop = document.createElement("span");
						spanShop.className = "shop_name";
						spanShop.textContent = item.vendorName;
						aShop.appendChild(spanShop);
						liShop.appendChild(aShop);

						const liPrice = document.createElement("li");
						const aPrice = document.createElement("a");
						aPrice.title = item.title;
						aPrice.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aPrice.className = "cltk_click";
						aPrice.setAttribute("data-cltk-id", item.id);
						const spanPrice = document.createElement("span");
						spanPrice.className = "price";
						spanPrice.textContent = `NT$${item.price}`;
						aPrice.appendChild(spanPrice);
						liPrice.appendChild(aPrice);

						ulElement.appendChild(liImage);
						ulElement.appendChild(liTitle);
						ulElement.appendChild(liShop);
						ulElement.appendChild(liPrice);

						serviceList.appendChild(ulElement);
						// 隱藏 loading 元素
						loadingElement.style.display = "none";
						// 計算並更新商品數量
						const goodBoxElements = document.querySelectorAll(".good_box");
						const serviceCountElement = document.getElementById("service_count");

						// 更新商品數量到 serviceCountElement 中
						serviceCountElement.textContent = goodBoxElements.length;
					});
				} else {
					data = sortData(selectedSortOption, data); // 調用函數進行排序
					// 重新渲染頁面
					serviceList.innerHTML = ""; // 清空商品列表
					data.forEach((item) => {
						const ulElement = document.createElement("ul");
						ulElement.className = "good_box";
						ulElement.id = item.id;
						ulElement.setAttribute("data-cltk", item.id);

						const liImage = document.createElement("li");
						const aImage = document.createElement("a");
						aImage.title = item.title;
						aImage.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aImage.className = "cltk_click";
						aImage.setAttribute("data-cltk-id", item.id);
						const imgElement = document.createElement("img");
						imgElement.className = "good_pic";
						imgElement.style.marginLeft = "0px";
						imgElement.style.marginTop = "0px";
						imgElement.title = item.title;
						imgElement.alt = item.title;
						imgElement.src = "data:image/png;base64," + item.image;
						aImage.appendChild(imgElement);
						liImage.appendChild(aImage);

						const liTitle = document.createElement("li");
						const h2Title = document.createElement("h2");
						const aTitle = document.createElement("a");
						aTitle.title = item.title;
						aTitle.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aTitle.className = "cltk_click";
						aTitle.setAttribute("data-cltk-id", item.id);
						const spanTitle = document.createElement("span");
						spanTitle.className = "good_name";
						spanTitle.textContent = item.title;
						aTitle.appendChild(spanTitle);
						h2Title.appendChild(aTitle);
						liTitle.appendChild(h2Title);

						const liShop = document.createElement("li");
						const aShop = document.createElement("a");
						aShop.title = item.title;
						aShop.className = "cltk_click";
						aShop.setAttribute("data-cltk-id", item.id);
						const spanShop = document.createElement("span");
						spanShop.className = "shop_name";
						spanShop.textContent = item.vendorName;
						aShop.appendChild(spanShop);
						liShop.appendChild(aShop);

						const liPrice = document.createElement("li");
						const aPrice = document.createElement("a");
						aPrice.title = item.title;
						aPrice.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
						aPrice.className = "cltk_click";
						aPrice.setAttribute("data-cltk-id", item.id);
						const spanPrice = document.createElement("span");
						spanPrice.className = "price";
						spanPrice.textContent = `NT$${item.price}`;
						aPrice.appendChild(spanPrice);
						liPrice.appendChild(aPrice);

						ulElement.appendChild(liImage);
						ulElement.appendChild(liTitle);
						ulElement.appendChild(liShop);
						ulElement.appendChild(liPrice);

						serviceList.appendChild(ulElement);
						// 隱藏 loading 元素
						loadingElement.style.display = "none";
					});

					// 計算並更新商品數量
					const goodBoxElements = document.querySelectorAll(".good_box");
					const serviceCountElement = document.getElementById("service_count");

					// 更新商品數量到 serviceCountElement 中
					serviceCountElement.textContent = goodBoxElements.length;
				}
			});

			// 默認加載推薦排序
			sortOption.value = "default"; // 將選擇排序選項的值設置為推薦排序
			const selectedSortOption = sortOption.value;
			// 隨機顯示商品列表
			serviceList.innerHTML = ""; // 清空商品列表
			data.forEach((item) => {
				const ulElement = document.createElement("ul");
				ulElement.className = "good_box";
				ulElement.id = item.id;
				ulElement.setAttribute("data-cltk", item.id);

				const liImage = document.createElement("li");
				const aImage = document.createElement("a");
				aImage.title = item.title;
				aImage.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
				aImage.className = "cltk_click";
				aImage.setAttribute("data-cltk-id", item.id);
				const imgElement = document.createElement("img");
				imgElement.className = "good_pic";
				imgElement.style.marginLeft = "0px";
				imgElement.style.marginTop = "0px";
				imgElement.title = item.title;
				imgElement.alt = item.title;
				imgElement.src = "data:image/png;base64," + item.image;
				aImage.appendChild(imgElement);
				liImage.appendChild(aImage);

				const liTitle = document.createElement("li");
				const h2Title = document.createElement("h2");
				const aTitle = document.createElement("a");
				aTitle.title = item.title;
				aTitle.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
				aTitle.className = "cltk_click";
				aTitle.setAttribute("data-cltk-id", item.id);
				const spanTitle = document.createElement("span");
				spanTitle.className = "good_name";
				spanTitle.textContent = item.title;
				aTitle.appendChild(spanTitle);
				h2Title.appendChild(aTitle);
				liTitle.appendChild(h2Title);

				const liShop = document.createElement("li");
				const aShop = document.createElement("a");
				aShop.title = item.title;
				aShop.className = "cltk_click";
				aShop.setAttribute("data-cltk-id", item.id);
				const spanShop = document.createElement("span");
				spanShop.className = "shop_name";
				spanShop.textContent = item.vendorName;
				aShop.appendChild(spanShop);
				liShop.appendChild(aShop);

				const liPrice = document.createElement("li");
				const aPrice = document.createElement("a");
				aPrice.title = item.title;
				aPrice.href = `${currentDomain}/marryme/product/getOne?productId=${item.id}`;
				aPrice.className = "cltk_click";
				aPrice.setAttribute("data-cltk-id", item.id);
				const spanPrice = document.createElement("span");
				spanPrice.className = "price";
				spanPrice.textContent = `NT$${item.price}`;
				aPrice.appendChild(spanPrice);
				liPrice.appendChild(aPrice);

				ulElement.appendChild(liImage);
				ulElement.appendChild(liTitle);
				ulElement.appendChild(liShop);
				ulElement.appendChild(liPrice);

				serviceList.appendChild(ulElement);
				// 隱藏 loading 元素
				loadingElement.style.display = "none";
				// 計算並更新商品數量
				const goodBoxElements = document.querySelectorAll(".good_box");
				const serviceCountElement = document.getElementById("service_count");

				// 更新商品數量到 serviceCountElement 中
				serviceCountElement.textContent = goodBoxElements.length;
			});

			// 隱藏 loading 元素（如果出現錯誤）
			loadingElement.style.display = "none";


		}).catch(error => console.error('Error fetching product data:', error));
}
window.addEventListener('load', init);
