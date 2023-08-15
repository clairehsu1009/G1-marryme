package com.marryme.reservation.vo;

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


@Entity
@Table(name = "reservation", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	/**預約賞聽ID*/
	@Column(name = "reservation_id")
	private Integer reservationId;
	@Column(name = "vendor_id")
	private String vendorId;
	@Column(name = "member_id")
	private String memberId;
	@Column(name = "contact_name")
	private String contactName;
	@Column(name = "contact_number")
	private String contactNumber;
	@Column(name = "event_date")
	private Timestamp eventDate;
	@Column(name = "reservation_date")
	private Timestamp reservationDate;
	@Column(name = "reservation_notes")
	private String reservationNotes;
	/**
     * 狀態 0 預約取消 1成功預約 <br>
     * 預設1 成功預約 <br>
     * 改為0 預約取消，就不能再改上架，需要重新新增
     * */
    private Integer status;
    

    


	
}
