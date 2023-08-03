const init = () => {
	// 獲取 URL 中的 productCategoryId 參數
	const urlParams = new URLSearchParams(window.location.search);
	const productCategoryId = urlParams.get('productCategoryId');
	// 使用Fetch API呼叫後端Servlet取得商品資料
	const currentDomain = window.location.origin;
	const apiUrl = `${currentDomain}/marryme/product/findAllShopProduct?productCategoryId=${productCategoryId}`;

	fetch(apiUrl) // 替換成實際的Servlet URL
		.then(response => response.json())
		.then(data => {
			// 將取得的商品資料顯示在網頁上
			const serviceList = document.getElementById("service_list");

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
				aTitle.href =`${currentDomain}/marryme/product/getOne?productId=${item.id}`;
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
				spanShop.textContent = item.shop_name;
				aShop.appendChild(spanShop);
				liShop.appendChild(aShop);

				const liPrice = document.createElement("li");
				const aPrice = document.createElement("a");
				aPrice.title = item.title;
				aPrice.href =`${currentDomain}/marryme/product/getOne?productId=${item.id}`;
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
			});
		})
		.catch(error => console.error('Error fetching product data:', error));
}

window.addEventListener('load', init);
