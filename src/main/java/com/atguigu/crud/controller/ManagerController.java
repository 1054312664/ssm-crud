package com.atguigu.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Manager;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.atguigu.crud.service.ManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.org.jvnet.staxex.NamespaceContextEx.Binding;
@Controller
public class ManagerController {
	@Autowired
	ManagerService  managerService;
	
	
	@RequestMapping("/checkmanager")
	@ResponseBody
	public Msg checkManager(@RequestParam("managerName")String managerName){
		//先判断用户名是否是合法的表达式
		String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		
		if(!(managerName.matches(regx))){
			System.out.println("不可用");
			return Msg.fail().add("va_msg","用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		//数据库用户名重复校验
				boolean b = managerService.checkManager(managerName);
				if(b){
					return Msg.success();
				}else{
					return Msg.fail().add("va_msg", "用户名重复");
				}
			
			}
	@RequestMapping("/save")
	@ResponseBody
	public Msg saveManager(String name,String pass){//如果想要封装Manager类来传输数据，可以使用public Msg saveManager(@RequestBody Manager manager)
		
		managerService.saveManager(name,pass);
		return Msg.success();
	 
	}
	
	@RequestMapping("/checklogin")
	@ResponseBody
	public Msg checkLogin(String name,String pass){
		
			System.out.println("in controller: "+name+"  "+pass);
				boolean b = managerService.checkLogin(name,pass);
				
				if(b){
					return Msg.success();
				}else{
					return Msg.fail().add("va_msg", "账号或密码错误！");
				}
			
			}
		
		
}
	
	


