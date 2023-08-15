package com.marryme.emp.vo;

import java.time.LocalDate;

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
@Table(name = "emp", catalog = "marryme")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Emp {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "emp_id")
	    private int empId;
	    /** 員工姓名 */
	    @Column(name = "emp_name")
	    private String empName;
	    /** 員工到職日 */
	    @Column(name = "hiredate")
	    private LocalDate hiredate;
	    /** 員工性別 */
	    @Column(name = "emp_gender")
	    private int empGender;
	    /** 員工生日 */
	    @Column(name = "birthday")
	    private LocalDate birthday;
	    /** 員工信箱 */
	    @Column(name = "emp_email")
	    private String empEmail;
	    /** 員工電話號碼 */
	    @Column(name = "emp_phone")
	    private String empPhone;
	    /** 員工地址 */
	    @Column(name = "emp_address")
	    private String empAddress;
	    /** 員工密碼 */
	    @Column(name = "emp_password")
	    private String empPassword;
	    /** 員工在職狀態 
	     * 0離職 1在職
	     **/
	    @Column(name = "emp_status")
	    private int empStatus;

	  
	

}
