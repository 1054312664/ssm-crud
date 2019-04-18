package com.atguigu.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Manager;
import com.atguigu.crud.dao.ManagerMapper;

@Service
public class ManagerService {
	
	@Autowired
	ManagerMapper managerMapper;

	

	/**
	 * 检验用户名是否可用
	 * true 
	 * @param empName
	 * @return true ; 代表当前姓名可用   false:不可用
	 */
	public  boolean checkManager(String managerName) {
		int count = managerMapper.countByManagerName(managerName); //通过名字看是否有这个记录数，如果有记录，则返回的是1
		return (count == 0);
	}



	public void saveManager(String a,String aa) {
		managerMapper.insertSelective(a,aa); 
	}

	public  boolean checkLogin(String managerName,String password) {
		System.out.println("in service: "+managerName+"  "+password);
		int count = managerMapper.checkLoginByNameAndPass(managerName,password); //通过名字看是否有这个记录数,如果有记录，则返回的是1
		System.out.println("the count = "+count);
		if(count == 1) return true;
		return false;
		
	}
}
