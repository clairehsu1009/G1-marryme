package com.marryme.emp.dao;

import java.util.List;

import org.hibernate.Session;

import com.marryme.core.util.HibernateUtil;
import com.marryme.emp.vo.Emp;


public interface EmpDao {
	
	List<Emp> selectAll();
	
	Emp selectForLogin(String empEmail, String empPassword);
	
	default Session getSession() {
        return HibernateUtil.getSessionFactory().getCurrentSession();
    }

}
