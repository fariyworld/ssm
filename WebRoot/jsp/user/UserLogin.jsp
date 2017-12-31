<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
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
		.login-form{
			width: 30%;
			margin: 100px auto;
		}
	</style>
	
  </head>
  
  <body>
	<%@include file="../common/top.jsp"%>
	<div class="title">
		<div class="title-text">
			<h2>用户登录</h2>
			<br />
			<br />
			<br />
			<hr />
			<div class="login-form">
				<form action="" method="post">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td>请选择登录方式</td>
							<td>
								<select id="loginway">
									<option value="phone" selected="selected">手机号</option>
									<option value="account">账号</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>手机号/账号：</td>
							<td><input type="text" id="loginnumber" /></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" id="password" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" id="loginbtn" value="登录" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	$(function(){
	
	
		//登录
		$("#loginbtn").click(function(){
		
			var loginway = $("#loginway").val();
			var phone = $("#loginnumber").val();
			var password = $("#password").val();
			var data;
			if(loginway === 'phone'){
				data = {"phone":phone,"password":password};
			}else{
				data = {"account":phone,"password":password};
			}
			var url = "User/login.action";
			$.post(url,data,function(data){
				if(data.uid === null){
					alert("账号或密码错误");
				}else{
					//登录成功，到主页面
					window.location.href = '/SSM_E';
				}
			},"json");
			
		});
	
	});



</script>
</body>
</html>
