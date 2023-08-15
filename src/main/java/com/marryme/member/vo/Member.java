package com.marryme.member.vo;


import java.sql.Timestamp;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.*;



@Entity
@Table(name = "member", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member{
	
	@Id
	@Column(name = "member_id")
	private String memberId; 
	/** 會員姓名 */
	@Column(name = "member_name")
	private String memberName; 
	/** 會員電話 */
	@Column(name = "member_phone")
	private String memberPhone; 
	/** 會員密碼 */
	@Column(name = "member_password")
	private String memberPassword; 
	/** 會員地址 */
	@Column(name = "member_address")
	private String memberAddress;
	/** 會員性別
	 * 狀態 0未選擇 1新郎 2新娘
	 *  */
	@Column(name = "member_gender")
	private Integer memberGender;
	/** 會員註冊日期 */
	@Column(name = "member_registration_time")
	private LocalDate memberRegistrationTime;
	/** 會員最後登入時間 */
	@Column(name = "member_last_login_time")
	private Timestamp memberLastLoginTime;
	/** 會員註冊IP */
	@Column(name = "member_registration_ip")
	private String memberRegistrationIp;
	/** 會員最後登入IP */
	@Column(name = "member_login_ip")
	private String memberLoginIp; 
	/**審核狀態
     * 狀態 0未驗證 1驗證成功 2驗證失敗<br>
     * 預設0 未驗證 <br>
     * 自動變更1 確認信箱點選驗證
     * 自動變更2 驗證失敗，需要重新驗證
     * */
	@Column(name = "verification_status")
	private Integer verificationStatus;

	
	
	
}
