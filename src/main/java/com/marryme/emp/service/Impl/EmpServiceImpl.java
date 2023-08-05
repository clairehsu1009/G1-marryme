package com.marryme.emp.service.Impl;

import static com.marryme.common.CommonString.EXCEPTION;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.marryme.emp.dao.EmpDao;
import com.marryme.emp.dao.Impl.EmpDaoImpl;
import com.marryme.emp.service.EmpService;
import com.marryme.emp.vo.Emp;
import com.marryme.member.vo.Member;

public class EmpServiceImpl implements EmpService{
	
	private EmpDao dao;
	
	public EmpServiceImpl() {
		dao = new EmpDaoImpl();
	}
	
	@Override
	public List<Emp> findAll() {
		List<Emp> EmpList = new ArrayList<>();
        try {
            beginTransaction();
            EmpList = dao.selectAll();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return EmpList;
    }
	
	
	
	public Emp login(Emp emp) {
	    final String username = emp.getEmpEmail();
	    final String password = emp.getEmpPassword();

	    if (username == null || password == null) {
	        return null;
	    }

	    beginTransaction();
	    emp = dao.selectForLogin(username, password);
	    try {
	        if (emp == null) {
	            rollback();
	            return null;
	        } else {
	            commit();
	            return emp;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return null;
	    }
	}
	

}
