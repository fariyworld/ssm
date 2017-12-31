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
    
    <title>My JSP 'shoppingcart.jsp' starting page</title>
    
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
				alert("您还没有登录，不能查看我的购物车");
				window.location.href = '/SSM_E/jsp/user/UserLogin.jsp';
			}else{
				//加载当前用户的购物车信息
			}
		}
		
		//点击取消  ---> 移除session
		
		
		//点击支付  --->   我的订单页  生成订单
		
	</script>

  </head>
  
  <body>
    <%@include file="../common/top.jsp"%>
	<div class="title">
		<div class="title-text">
			<h2>我的购物车</h2>
			<br />
			<br />
			<br />
			<hr />
		</div>
		<div class="title-text">
			<div class="infodiv">
				<form action="" method="post">
					<table border="1" style="width:100%;text-align: center" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th>闲置商品名称</th>
								<th>闲置商品详情</th>
								<th>闲置商品类别</th>
								<th>数量</th>
								<th>所在地</th>
								<th>发布时间</th>
								<th>原价</th>
								<th>折旧程度</th>
								<th>交易方式</th>
								<th>交易状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${caridleLists }" var="idle">
								<tr>
									<td><c:out value="${idle.idlename }"></c:out></td>
									<td><img src="/upload/ssm/idleImg/${idle.idleImg }"></td>
									<td><c:out value="${idle.typename }"></c:out></td>
									<td><c:out value="${idle.amount }"></c:out></td>
									<td><c:out value="${idle.location }"></c:out></td>
									<td><c:out value="${idle.purchasing_date }"></c:out></td>
									<td><c:out value="${idle.purchasing_price }元"></c:out></td>
									<td>
										<c:if test="${idle.percentage eq 4 }">
											<c:out value="半成以下"></c:out>
										</c:if>
										<c:if test="${idle.percentage eq 3 }">
											<c:out value="半成新"></c:out>
										</c:if>
										<c:if test="${idle.percentage eq 2 }">
											<c:out value="八成新"></c:out>
										</c:if>
										<c:if test="${idle.percentage eq 1 }">
											<c:out value="全新"></c:out>
										</c:if>
									</td>
									<td>
										<c:if test="${idle.transfer_mode eq 1 }">
											<c:out value="线上交易"></c:out>
										</c:if>
										<c:if test="${idle.transfer_mode eq 2 }">
											<c:out value="线下交易"></c:out>
										</c:if>
										<c:if test="${idle.transfer_mode eq 3 }">
											<c:out value="线上或线下"></c:out>
										</c:if>
									</td>
									<td>
										<c:if test="${idle.transfer_state eq 1 }">
											<c:out value="正在交易"></c:out>
										</c:if>
										<c:if test="${idle.transfer_state eq 2 }">
											<c:out value="已交易"></c:out>
										</c:if>
										<c:if test="${idle.transfer_state eq 3 }">
											<c:out value="正在出售"></c:out>
										</c:if>
									</td>
									<td>
										<input type="hidden" name="idleid" value="${idle.idleid }" />
										<input type="button" value="取消" />
										<input type="hidden" name="idleid" value="${idle.idleid }" />
										<input type="button" value="支付" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>	
		</div>
	</div>
  </body>
</html>
