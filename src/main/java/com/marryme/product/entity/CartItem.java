package com.marryme.product.entity;

public class CartItem {
	private Product product;
    private int quantity;
    private int price;

   
    public int getPrice() {
        return product.getPlatformPrice() * this.quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public String getVendorId() {
        return product.getVendorId();
    }
}
