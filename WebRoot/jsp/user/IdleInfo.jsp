<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<c:forEach items="${idleLists }" var="idle">
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
								<input type="button" value="删除" />
								<input type="hidden" name="idleid" value="${idle.idleid }" /> 
								<input type="button" value="修改交易状态" /> 
								<input type="hidden" name="idleid" value="${idle.idleid }" /> 
								<input type="button" value="购买" /> 
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
<script type="text/javascript" src="resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	$(":button").click(function(){
		var oper = $(this).val();//当前按钮的值
		var curIdleID = $(this).prev().val();//当前闲置商品的idleid主键
		//根据按钮值判断操作去数据库进行update
		
		//当按钮是购买的时候添加到购物车
		if(oper === "购买"){
			alert("购买的闲置商品的主键--->"+ curIdleID );
			alert("添加到购物车");
			var url = "Idle/selectByID.action";
			$.post(url,{"id":curIdleID},function(data){
				console.log(data[0]);
				window.location.href = "/SSM_E/jsp/user/shoppingcart.jsp";
			},"json");
		}
	});
	
</script>