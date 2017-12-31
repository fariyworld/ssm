<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布闲置信息</title>
    
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
			width:40%;
			margin: 50px auto;
		}
	</style>
  </head>
  
  <body>
    <%@include file="../common/top.jsp"%>
	<div class="title">
		<div class="title-text">
			<h2>发布闲置信息</h2>
			<br />
			<br />
			<br />
			<hr />
		</div>
		<div class="title-text">
			<div class="infodiv">
				<form action="Idle/publishIdleInfo.action" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>闲置物品名称:</td>
							<td>
								<input type="text" name="idlename" value="" />
							</td>
						</tr>
						<tr>
							<td>闲置图片:</td>
							<td>
								<input type="file" name="photo" value="" />
							</td>
						</tr>
						<tr>
							<td>闲置物品数量:</td>
							<td>
								<input type="text" name="amount" value="" />
							</td>
						</tr>
						<tr>
							<td>闲置所在地:</td>
							<td>
								<input type="text" name="location" value="" />
							</td>
						</tr>
						<tr>
							<td>闲置物品购买时间:</td>
							<td>
								<input type="date" name="date" value="" />
							</td>
						</tr>
						<tr>
							<td>闲置物品购买原价:</td>
							<td>
								<input type="text" name="purchasingPrice" value="" />
							</td>
						</tr>
						<tr>
							<td>支持的交易方式:</td>
							<td>
								<input type="checkbox" name="ways" value="1" />线上交易
								<input type="checkbox" name="ways" value="2" />线下交易
							</td>
						</tr>
						<tr>
							<td>闲置物品折旧程度:</td>
							<td>
								<select name="percentage">
									<option value="1">全新</option>
									<option value="2">八成新</option>
									<option value="3">半成新</option>
									<option value="4">半成以下</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>闲置物品类别:</td>
							<td>
								<select name="idletype.tid" id="idletype">
									
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="hidden" name="user.uid" value="${uid }" />
								<input type="submit" value="发布信息" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	var uid = '${uid}';
	if(uid == ""){
		loginInterceptor();
	}else{
		selectIdleType();
	}
	function loginInterceptor(){
	
		
		if(uid == ""){
			alert("您还没有登录，不能发布信息");
			window.location.href = '/SSM_E/jsp/user/UserLogin.jsp';
		}else{
			selectIdleType();
		}
	}
	
	function selectIdleType(){
		//去数据库查询闲置物品类别表
		var url = "IdleType/selectIdleTypeAll.action";
		var html = "";
		$.ajax({
			
			async:false,
			url: url,
			type: "post",
			dataType:"json",
			success: function(data){
				console.log(data);
				for(var index in data){
					console.log(data[index].typename);
					html +="<option value="+ data[index].tid +">"+ data[index].typename +"</option>";
				}
				console.log(html);
				$("#idletype").append(html);
			}
		});
	}
	
</script>
  </body>
</html>
