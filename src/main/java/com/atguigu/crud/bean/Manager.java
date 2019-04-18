package com.atguigu.crud.bean;

import javax.validation.constraints.Pattern;

public class Manager {

	   @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})" 
	    		,  message="用户名必须是6-16位数字和字母的组合或者2-5位中文")
	private String managerName;
	private String password;
	
	
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		
		return "managerName + password";
	}
}
