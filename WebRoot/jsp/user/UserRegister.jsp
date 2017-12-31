<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		.title-text{
			width: 80%;
			margin: 0 auto;
		}
		h2{
			margin-top: 10px;
		}
		.register-form{
			width: 30%;
			margin: 100px auto;
		}
	</style>
	
  </head>
  
  <body>
   	 <%@include file="../common/top.jsp" %>
   	 <div class="title">
		<div class="title-text">
			<h2>用户注册</h2><br /><br /><br />
			<hr />
			<div class="register-form">
				<form action="" method="post">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td>手机号：</td>
							<td><input type="text" id="phone" name="phone" value="" /></td>
						</tr>
						<tr>
							<td>手机验证码</td>
							<td><input type="text" id="regCode" value="" />
								<input type="button" id="regCodebtn" value="获取验证码" />
							</td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" id="password" value="" /></td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td><input type="password" id="" value="" /></td>
						</tr>
						<tr>
							<td>账号</td>
							<td><input type="text" id="account" name="account" value="" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" value="立即注册" id="regbtn"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>			
	</div>
	<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		
		$(function(){
		
			//手机验证码
			$("#regCodebtn").click(regCode);
			
			//随机验证码
			function regCode(){
				alert("验证码为：842131");
			}
			
			//注册
			$("#regbtn").click(function(){
				var phone = $("#phone").val();
				var account = $("#account").val();
				console.log(phone,account);				
				$.ajax({
				
					url:"User/checkUserIsExist.action",
					data:{"phone":phone,"account":account},
					type:"post",
					dataType:"json",
					success: function(data){
						if(data.ajaxResult === "1"){
							var password = $("#password").val();
							$.ajax({
							
								url:"User/registerUser.action",
								data:{"phone":phone,"account":account,"password":password},
								type:"post",
								dataType:"json",
								success: function(data){
									console.log(data);
									//注册成功
									 window.location.href = '/SSM_E/jsp/user/UserLogin.jsp';
								},
								error: function(){
									alert("请求失败");
								}
							});
						}else{
							alert("账号或手机号已注册，如忘记请找回");
							//已占用去登陆
							window.location.href = '/SSM_E/jsp/user/UserLogin.jsp';
						}
					},
					error: function(){
						alert("请求失败");
					}
				});
				
			});
		});
	
	</script>
  </body>
</html>
