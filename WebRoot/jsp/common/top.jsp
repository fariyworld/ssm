<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/top.css"/>
<div class="top">
	<div class="top-content">
		<a href="jsp/user/UserLogin.jsp" class="link1">亲，请登录</a> 
		<a href="jsp/user/UserRegister.jsp" class="link2">免费注册</a>
		<a href="" class="link2">二手交易平台</a>
		<a href="javascript:;" tag="car">我的购物车</a>
	</div>
</div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
<script>
    //我的购物车
   	$("a[tag='car']").click(function(){
   		window.location.href = "/SSM_E/jsp/user/shoppingcart.jsp";
   	});
</script>