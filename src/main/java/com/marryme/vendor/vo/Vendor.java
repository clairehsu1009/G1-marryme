package com.marryme.vendor.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.*;

@Entity
@Table(name = "vendor", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Vendor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "vendor_id")
	private String vendorId; 
	/** 品牌名稱 */
	@Column(name = "vendor_name")
	private String vendorName; 
	/** 廠商電話 */
	@Column(name = "vendor_phone")
	private String vendorPhone; 
	/** 廠商信箱 */
	@Column(name = "vendor_email")
	private String vendorEmail;
	/** 廠商密碼 */
	@Column(name = "vendor_password")
	private String vendorPassword; 
	/** 廠商地區 */
	@Column(name = "vendor_location")
	private String vendorLocation;
	/** 廠商地址 */
	@Column(name = "vendor_address")
	private String vendorAddress;
	/** 廠商類別(必填 讓廠商進入不同類別頁面 確定好類別就不可變更) 
	 * 狀態 0商品 1服務<br>
     * 預設0 商品 <br>
     * 1服務
     * */
	@Column(name = "manufacturer_category")
	private Integer manufacturerCategory;
	/** 廠商註冊時間 */
	@Column(name = "vendor_registration_time")
	private Date vendorRegistrationTime;
	/** 廠商官方網址 */
	@Column(name = "vendor_website")
	private String vendorWebsite;
	/** 廠商FB */
	@Column(name = "vendor_fb")
	private String vendorFb;
	/** 廠商IG*/
	@Column(name = "vendor_ig")
	private String vendorIg; 
	/** 廠商統編 */
	@Column(name = "company_id")
	private Integer companyId;
	/** 廠商聯絡人 */
	@Column(name = "contact_person")
	private String contactPerson;
	/** 廠商基本資料 */
	@Column(name = "basic_introduction")
	private String basicIntroduction; 
	/** googlemap */
	@Column(name = "googlemap")
	private String googlemap; 
	/**審核狀態
     * 狀態 0未處理 1審核中 2審核通過<br>
     * 預設0 未處理 <br>
     * 自動變更1 審核中 (資料填寫不齊全)
     * 自動變更2 審核通過(資料填寫齊全)
     * */
	@Column(name = "vendor_status")
	private Integer vendorStatus;
	
	
}
