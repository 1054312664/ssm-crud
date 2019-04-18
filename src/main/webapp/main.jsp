<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>register</title>
  <%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
   
   <link  rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-2.0.0.min.js"></script>
    
    
  
  </head>
  
  <body>
 <div class = "containner">
 <!--标题-->
		<div class="row">
			<div class="col-md-12">
				<h1>主页</h1>
			</div>
		</div>

		<!--按钮-->
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<button class="btn btn-primary" id="manager_add_modal_btn">新增入口</button>	
			</div>
			<div class="col-md-4 col-md-offset-4">
				<button class="btn btn-primary" id="manager_login_modal_btn">登录入口</button>	
			</div>
	     </div>
		
</div>
   <!-- 注册模态框 -->
	<div class="modal fade" id="managerAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">注册管理员</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">managerName</label>
							<div class="col-sm-10">
								<input type="text" name="managerName" class="form-control"
									id="managerName_add_input" placeholder="managerName">
									<span  class="help-block"></span>
							</div>						
							<label class="col-sm-2 control-label">passWord</label>
							<div class="col-sm-10">		
								<input type="text" name="password" class="form-control"
									id="password_add_input" placeholder="password">
									<span  class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="manager_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
<!-- 注册模态框结束 -->  

<!-- 登录模态框 -->
	<div class="modal fade" id="managerLoginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理员登录</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">managerName</label>
							<div class="col-sm-10">
								<input type="text" name="managerName" class="form-control"
									id="managerName_login_input" placeholder="managerName">
									<span  class="help-block"></span>
							</div>						
							<label class="col-sm-2 control-label">passWord</label>
							<div class="col-sm-10">		
								<input type="text" name="password" class="form-control"
									id="password_login_input" placeholder="password">
									<span  class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="manager_login_btn">登录</button>
				</div>
			</div>
		</div>
	</div>
    <!-- 登录模态框结束 -->
	  
	  
	  
	  
	  
	  
	  <script type="text/javascript">
	  	//主页面的注册按钮事件
	  	$("#manager_add_modal_btn").click(function() {
			//清除表单数据(表单完整重置(表单的数据，表单的样式))
			reset_form("#managerAddModal form");
			$("#managerAddModal form")[0].reset();
			//弹出模态框
			$("#managerAddModal").modal({ //利用js创建模态框
				backdrop : "static"
			});
		});
		
		
	  	//主页面的登录按钮事件
	  	$("#manager_login_modal_btn").click(function() {
			//清除表单数据(表单完整重置(表单的数据，表单的样式))
			reset_form("#managerLoginModal form");
			$("#managerLoginModal form")[0].reset();
			//弹出模态框
			$("#managerLoginModal").modal({ //利用js创建模态框
				backdrop : "static"
			});
		});
		
		//清除表单数据(表单完整重置(表单的数据，表单的样式))
		function reset_form(ele){
			$(ele)[0].reset;
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		//清除当前元素的检验状态and填写当前ms到span中
		function show_validate_msg(ele,status,msg){
			//清除当前元素的检验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text(" ");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
				
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//校验用户名是否可用
		$("#managerName_add_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var managerName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkmanager",
				data: "managerName="+managerName,
				type:"POST",
				success:function(result){
					if(result.code==100){
					alert("input yes!");
						 show_validate_msg("#managerName_add_input","success","用户名可用");
						 $("#manager_save_btn").attr("ajax_va","success"); //给按钮添加一个属性 内容为success
						 
						
					}else{
					alert("input wrong!");
						show_validate_msg("#managerName_add_input","error",result.extend.va_msg);
						 $("#manager_save_btn").attr("ajax_va","error");
					}
				}
				 
			});
		});
		
		
		//点击保存，保存员工.
		$("#manager_save_btn").click(function(){
			var name=$("#managerName_add_input").val();
			var pass =$("#password_add_input").val();
			console.log(name);//test
			console.log(pass);
			
			if($(this).attr("ajax_va")=="success"){
				alert("the ajax_va is 'success' ");
				$.ajax({
				url:"${APP_PATH}/save",
				type:"POST",
				data:{
				"name":name,
				"pass":pass    //引号中的name和pass不能加入":"等符号，会造成字段存储的失败
				},
				success:function(result){
				if(result.code==100){//这里本不需要校验，因为.checkmanager已经校验了
					alert("管理员注册成功");
					$("#managerAddModal").modal("hide");
					}
				else{
				alert("管理员注册成功失败");
					$("#managerAddModal").modal("hide");
					
					}
				}
				});
			}
			else{
			
			$("#empAddModal").modal("hide");}
		});
			
										
		function validate_add_form(){
			//1.拿到要校验的数据.使用正则表达式
			var managerName = $("#managerName_add_input").val(); 
			var regName=  /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			//小写或者大写的a-z或者0-9   或者_或者-  3到16位  或者中文2到5位
			if(!regName.test(managerName)){
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#managerName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#managerName_add_input","success"," ");
			}			
		};
		
		
		//登录校验
		$("#manager_login_btn").click(function(){
			//发送ajax请求校验用户名是否可用
			var name=$("#managerName_login_input").val();
			var pass=$("#password_login_input").val();
			console.log(name);//test
			console.log(pass);
			$.ajax({
				url:"${APP_PATH}/checklogin",
				data:{
					"name":name,
					"pass":pass 
				},
				type:"POST",
				success:function(result){
					if(result.code==100){
						 show_validate_msg("#managerName_login_input","success","用户名存在and密码正确！");
						 $("#manager_login_btn").attr("ajax_va","success"); //给按钮添加一个属性 内容为success
						alert("登录成功！");
						$("#managerLoginModal").modal("hide");
						window.location.href="http://localhost:8080/testssm/index-2.jsp"
					}else{
						show_validate_msg("#managerName_login_input","error",result.extend.va_msg);
						 $("#manager_login_btn").attr("ajax_va","error");
					}
				}
				 
			});
			
		});
		
		
	  
	  </script>	
	<script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.js"></script> 
  </body>
</html>
