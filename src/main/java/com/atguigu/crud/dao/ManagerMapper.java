package com.atguigu.crud.dao;

import org.apache.ibatis.annotations.Param;

import com.atguigu.crud.bean.Manager;

public interface ManagerMapper {
	   int countByManagerName(String managerName);
		int checkLoginByNameAndPass(@Param("name")String name,@Param("pass")String pass);

	    void insertSelective(@Param("name")String name,@Param("pass")String pass);//多个参数要用@Param

	   
}
