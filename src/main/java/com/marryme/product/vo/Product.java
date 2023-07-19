/**
 * @Author Jeanny
 * @Create 2023/7/15 13:31
 * @Version 1.0
 */

package marryme.product.vo;

import java.sql.Timestamp;

public class Product {
    private int product_id;
    private String vendor_id;
    private int product_category_id;
    private String product_name;
    private byte[] image;
    private int original_price;
    private int platform_price;
    private String product_description;
    private Timestamp added_time;
    private int product_status;
    
//    // Constructors
//    public Product() {
//    }
//    
//    public Product(int product_id, String vendor_id, int product_category_id, String product_name, byte[] image,
//                   int original_price, int platform_price, String product_description, Timestamp added_time,
//                   int product_status) {
//        this.product_id = product_id;
//        this.vendor_id = vendor_id;
//        this.product_category_id = product_category_id;
//        this.product_name = product_name;
//        this.image = image;
//        this.original_price = original_price;
//        this.platform_price = platform_price;
//        this.product_description = product_description;
//        this.added_time = added_time;
//        this.product_status = product_status;
//    }
    
    // Getters and Setters
    public int getProduct_id() {
        return product_id;
    }
    
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    
    public String getVendor_id() {
        return vendor_id;
    }
    
    public void setVendor_id(String vendor_id) {
        this.vendor_id = vendor_id;
    }
    
    public int getProduct_category_id() {
        return product_category_id;
    }
    
    public void setProduct_category_id(int product_category_id) {
        this.product_category_id = product_category_id;
    }
    
    public String getProduct_name() {
        return product_name;
    }
    
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    
    public byte[] getImage() {
        return image;
    }
    
    public void setImage(byte[] image) {
        this.image = image;
    }
    
    public int getOriginal_price() {
        return original_price;
    }
    
    public void setOriginal_price(int original_price) {
        this.original_price = original_price;
    }
    
    public int getPlatform_price() {
        return platform_price;
    }
    
    public void setPlatform_price(int platform_price) {
        this.platform_price = platform_price;
    }
    
    public String getProduct_description() {
        return product_description;
    }
    
    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }
    
    public Timestamp getAdded_time() {
        return added_time;
    }
    
    public void setAdded_time(Timestamp added_time) {
        this.added_time = added_time;
    }
    
    public int getProduct_status() {
        return product_status;
    }
    
    public void setProduct_status(int product_status) {
        this.product_status = product_status;
    }
}
