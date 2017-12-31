<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
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
		ul{
			list-style: none;
		}
		.menu{
			float: left;
		}
		#menu-div{
			float: left;
		}
	</style>
	
  </head>
  
  <body>
	<%@include file="../common/top.jsp"%>
	<div class="title">
		<div class="title-text">
			<h2>个人中心</h2>
			<br />
			<br />
			<br />
			<hr />
		</div>
		<div class="title-text">
			<div class="menu">
				<ul>
					<li><a href="info">完善个人资料</a></li>
					<li><a href="pwd">修改密码</a></li>
				</ul>
			</div>
			<div id="menu-div">
				<div style="margin: 0 200px; margin-top: 50px; width:800px; display: none" id="updateInfo">
					<form action="User/updateUserInfo.action" method="post" enctype="multipart/form-data" id="infoform">
						<table style="width: 40%; height: 200px; margin: 0 auto">
							<tr>
								<td colspan="2"><h3>完善个人资料</h3><br /></td>
								<input type="hidden" name="uid" value="" />
								<input type="hidden" name="headphoto" value="" />
							</tr>
							<tr>
								<td><img title="头像" id="hpimg" src="" width="70px" height="70px"/></td>
								<td>预览：<img title="头像" id="ylimg" src="" width="70px" height="70px" style="display: none;"/></td>
								<td><input type="file" id="photo" name="photo"/></td>
							</tr>
							<tr>
								<td>用户名：</td>
								<td><input type="text" name="account" value=""/></td>
							</tr>
							<tr>
								<td>昵称：</td>
								<td><input type="text" name="userName" value=""/></td>
							</tr>
							<tr>
								<td>手机号：</td>
								<td><input type="text" name="phone" value=""/></td>
							</tr>
							<tr>
								<td>生日：</td>
								<td><input type="date" id="dateinput" name="dateStr" value=""/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" id="updateInfobtn" value="确定" /></td>
							</tr>
						</table>
					</form>
				</div>
				
				<div style="margin: 0 200px; margin-top: 50px; width:800px;display: none" id="updatePWD">
					<form action="" method="post" id="updatePWD">
						<table style="width: 40%; height: 200px; margin: 0 auto">
							<tr>
								<td colspan="2">修改密码<br /></td>
							</tr>
							<tr>
								<td>旧密码：</td>
								<td><input type="password" id="oldpwd" value=""/></td>
							</tr>
							<tr>
								<td>新密码：</td>
								<td><input type="password" id="newpwd" value=""/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button" id="updatePWDbtn" value="确定" /></td>
							</tr>
						</table>
					</form>
				</div>
					
			</div>
		</div>
	</div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	$(function(){
		//提交个人信息请求后的返回信息
		initMsg();
		function initMsg(){
		
			var imsg = '${iMsg}';
			
			if(imsg){
				alert(imsg);
			}
		}
	
		$('div.menu a').click(function(){
			var val = $(this).attr('href');
			if(val === 'info'){
				//回显数据
				var url = 'User/selectUserByID.action';
				var data = {'uid':${uid}};
				$.post(url,data,function(data){
					var dateArr = data.dateArr;
					var dateVal = dateArr[0]+"-"+dateArr[1]+"-"+dateArr[2];
					$("#dateinput").val(dateVal);
					$("input[name='uid']").val(data.uid);
					var imgsrc = data.headphoto;
					$("input[name='headphoto']").val(imgsrc);
					$("#hpimg").attr("src","/upload/ssm/hp/"+imgsrc);
					$("input[name='account']").val(data.account);
					$("input[name='userName']").val(data.userName);
					$("input[name='phone']").val(data.phone);
					$('#updatePWD').hide();
					$('#updateInfo').show();
				},"json");
			}else{
				$('#updateInfo').hide();
				$('#updatePWD').show();
			}
			return false;
		});
		
		//密码
		$("#updatePWDbtn").click(function(){
			var pwd = $("#oldpwd").val();
		 	if(pwd){
		 		var url = "User/checkOldPWD.action";
			 	var data = {"uid":${uid} ,"password": pwd };
			 	
				$.post(url,data,function (data){
					console.log(data.ajaxResult);
					if ( data.ajaxResult === '1'){
						alert("去修改密码");
						var newpwd = $("#newpwd").val();
						// judge new password is not null?
						if(newpwd){
							var updateurl = "User/updatePWD.action";
							var update_data = {"uid":${uid} ,"password": newpwd };
							$.post(updateurl, update_data, function(data){
								alert(data.ajaxResult);
							},"json");
						}else{
							alert("新密码为空");
						}
					}else{
						alert("原密码错误");
					}
				},"json");
				
		 	}else{
		 		alert("please enter old password");
		 	}
		});
		
		//上传图片预览
		$("#photo").change(function(){
		
			var file = $(this);
            var fileObj = file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			console.log(dataURL);
			$("#ylimg").attr("src", dataURL);
			$("#ylimg").show();
		});
		
		
	});



</script>
</body>
</html>
