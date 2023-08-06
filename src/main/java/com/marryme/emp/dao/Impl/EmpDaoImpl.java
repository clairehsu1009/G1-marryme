package com.marryme.emp.dao.Impl;

import java.util.List;

import com.marryme.emp.dao.EmpDao;
import com.marryme.emp.vo.Emp;

public class EmpDaoImpl implements EmpDao{
	
	@Override
	public List<Emp> selectAll() {
		final String hql = "FROM Emp ORDER BY empId";
		return getSession()
				.createQuery(hql, Emp.class)
				.getResultList();
	}
	
	
	@Override
	public Emp selectForLogin(String empEmail, String empPassword) {
		final String sql = "select * from Emp "
				+ "where emp_email = :empEmail and emp_password = :empPassword";
		return getSession().createNativeQuery(sql, Emp.class)
				.setParameter("empEmail", empEmail)
				.setParameter("empPassword", empPassword)
				.uniqueResult();
	}
	

}
