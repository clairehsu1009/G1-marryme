package com.marryme.product.entity;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Cart {

	private Map<Integer, CartItem> productMap = new LinkedHashMap<>();
	private int price;

	// 將商品加入購物車
	public void addProduct(Product product) {

		// 獲取得到購物項目
		CartItem cartItem = productMap.get(product.getProductId());

		// 判斷購物車是否存在該購物項目，如果不存在
		if (cartItem == null) {

			// 創建這個購物項目
			cartItem = new CartItem();

			// 將使用者傳遞過來的商品作為購物項目
			cartItem.setProduct(product);

			// 將該購物項目的數量設置為1
			cartItem.setQuantity(1);
			
			// 設定商品的價格
            cartItem.setPrice(product.getPlatformPrice()); 

			// 將購物項目加入到購物車中
			productMap.put(product.getProductId(), cartItem);
		} else {

			// 如果存在該購物項目，將購物項目的數量+1
			cartItem.setQuantity(cartItem.getQuantity() + 1);
		}
	}

	// 購物車的總價就是所有購物項目的價格加起來
	public Integer getPrice() {

		int totalPrice = 0;

		for (Map.Entry<Integer, CartItem> entry : productMap.entrySet()) {

			// 獲得每個購物項目
			CartItem cartItem = entry.getValue();

			// 將每個購物項目的價格加起來，就是購物車的總價了！
			totalPrice += cartItem.getPrice();
		}
		
		// 將計算得到的總價設定到Cart物件的price屬性中
        this.price = totalPrice;

		return totalPrice;
	}

	public Map<Integer, CartItem> getProductMap() {
		return productMap;
	}

	public void setProductMap(Map<Integer, CartItem> productMap) {
		this.productMap = productMap;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public List<CartItem> getItems() {
		return new ArrayList<>(productMap.values());
	}

}
