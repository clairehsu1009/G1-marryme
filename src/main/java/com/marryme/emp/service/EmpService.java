package com.marryme.emp.service;

import java.util.List;

import com.marryme.core.service.CoreService;
import com.marryme.emp.vo.Emp;



public interface EmpService extends CoreService{
	
	List<Emp> findAll();
	
	Emp login(Emp emp);
	
	

}
