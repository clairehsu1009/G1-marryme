package com.marryme.member.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.*;


@Entity
@Table(name = "member", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private String memberId; 
	@Column(name = "member_name")
	private String memberName; 
	@Column(name = "member_phone")
	private Integer memberPhone; 
	@Column(name = "member_email")
	private String memberEmail;
	@Column(name = "member_password")
	private String memberPassword; 
	@Column(name = "member_address")
	private String memberAddress;
	@Column(name = "member_gender")
	private Integer memberGender;
	@Column(name = "member_registration_time")
	private Timestamp memberRegistrationTime;
	@Column(name = "member_last_login_time")
	private Timestamp memberLastLoginTime;
	@Column(name = "member_registration_ip")
	private String memberRegistrationIp;
	@Column(name = "member_login_ip")
	private String memberLoginIp; 
	@Column(name = "verifcation_status")
	private Integer verificationStatus;

}
