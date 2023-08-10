package com.marryme.weddingVenue.vo;

import lombok.*;

import java.util.Arrays;

import javax.persistence.*;


@Entity
@Table(name = "plan_place", schema = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WeddingVenue {
	
	

//		@Override
//	public String toString() {
//		return "WeddingVenue [placeId=" + placeId + ", vendorId=" + vendorId + ", placePicture="
//				+ Arrays.toString(placePicture) + ", placeTitle=" + placeTitle + ", numbeOfTables=" + numbeOfTables
//				+ ", placeIntroduction=" + placeIntroduction + ", placePictures2=" + Arrays.toString(placePictures2)
//				+ ", placePictures3=" + Arrays.toString(placePictures3) + ", placePictures4="
//				+ Arrays.toString(placePictures4) + ", placePictures5=" + Arrays.toString(placePictures5) + ", status="
//				+ status + ", editStatus=" + editStatus + "]";
//	}


		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "place_id")
		private Integer placeId;
		/** 廠商ID */
		@Column(name = "vendor_id")
		private String vendorId;
		/** 場地主圖片 */
		@Column(name = "place_picture")
		private byte[] placePicture;
		/** 場地標題 */
		@Column(name = "place_title")
		private String placeTitle;
		/** 建議桌數區間 */
		private String numbeOfTables;
		/** 場地介紹 */
		@Column(name = "place_Introduction")
		private String placeIntroduction;
		/** 場地圖片2 */
		@Column(name = "place_pictures2")
		private byte[] placePictures2;
		/** 場地圖片3 */
		@Column(name = "place_pictures3")
		private byte[] placePictures3;
		/** 場地圖片4 */
		@Column(name = "place_pictures4")
		private byte[] placePictures4;
		/** 場地圖片5 */
		@Column(name = "place_pictures5")
		private byte[] placePictures5;
		/**
		 * 狀態 0下架 1上架 <br>
		 * 預設1 上架 <br>
		 * 改為0 下架，就不能再改上架，需要重新新增
		 */
		@Column(name = "status")
		private Integer status;
		/**
		 * 可否編輯內容 <br>
		 * 預設 0可修改 (若有已上架的方案商品，需提醒是否確認修改，仍可修改、方案帶出的資料會同步變更）<br>
		 * 1不可修改 (已有已成立之訂單，不可更改加購項目內容，只能下架）
		 */
		@Column(name = "edit_status")
		private Integer editStatus;
		
//		@Column(name = "vendor_location")
//		private Integer vendorLocation;
		
		
		public WeddingVenue(Integer placeId, byte[] placePicture) {
		    this.placeId = placeId;
		    this.placePicture = placePicture;
		}
		
		


}
