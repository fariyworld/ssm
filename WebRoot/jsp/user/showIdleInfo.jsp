<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的闲置信息</title>
    
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
		.infodiv{
			width:90%;
			margin: 50px auto;
		}
		img{
			width:50px;
			height:50px;
		}
	</style>
	<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		loginInterceptor();
		function loginInterceptor(){
		
			var uid = '${uid}';
			if(uid === ""){
				alert("您还没有登录，不能查看我的闲置信息");
				window.location.href = '/SSM_E/jsp/user/UserLogin.jsp';
			}else{
				//加载当前用户闲置信息
				var url = "Idle/selectIdleAllByUID.action";
				$.post(url,{"uid":uid},function(data){
					$("div.title-div").load("/SSM_E/jsp/user/IdleInfo.jsp");
				},"json");
			}
		}
		
		//发布闲置信息请求后的返回信息
		initMsg();
		function initMsg(){
			var imsg = '${iMsg}';
			var idleid = '${idleid}';
			
			if(imsg){
				alert(imsg);
				console.log("刚插入闲置信息主键--->",idleid);
			}
		}
		
		//操作
		
	</script>
	
  </head>
  
  <body>
  	<%@include file="../common/top.jsp"%>
	<div class="title">
		<div class="title-text">
			<h2>我的闲置信息</h2>
			<br />
			<br />
			<br />
			<hr />
		</div>
		<div class="title-div">
		</div>
	</div>
  </body>
</html>
