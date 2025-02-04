<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
 .bwj{
   padding-top: 26px;
 }
</style>
</head>

<body>

	
	<!-- <div class="container"> -->
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong style="margin-left: 389px;">订单详情</strong>
				<table class="table table-bordered">
					<tbody>
						<tr class="success">
						<c:forEach items="${ orders }" var="ord">
							<th colspan="5">
								订单编号:${ ord.oid }&ensp;&ensp;
								订单时间：${ ord.ordertime }&ensp;&ensp;
								订单总计：<span style="color:red;">${ ord.total }</span>&ensp;&ensp;
								订单状态：
								<c:if test="${ ord.state == 1 }"><a href="#">未付款</a></c:if>
								<c:if test="${ ord.state == 2 }"><span style="color:blue;">等待发货</span></c:if>
								
								<c:if test="${ ord.state == 3 }"><a href="#">确认收货</a></c:if>
								<c:if test="${ ord.state == 4 }">订单完成</c:if>
								<c:if test="${ ord.state == 5 }">已取消</c:if>&ensp;&ensp;
							</th>
					
						</tr>
						<tr class="warning">
							<th>图片</th>
							<th>商品</th>
							<th>商品单价</th>
							<th>数量</th>
							<th>小计</th>
							<!-- <th>商品金额</th> -->
						</tr>
						<c:forEach items="${ ord.orderItems }" var="oi">
						<tr class="active">
							<td  width="60" width="40%" style="padding-left: 44px;padding-right: 42px;"><input type="hidden" name="id"
								value="22"> <img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" width="70"
								height="60"></td>
							<td   width="30%" style="padding-top: 27px;"><a target="_blank">${oi.product.pname}</a></td>
							<td width="20%" style="padding-top: 27px;">&yen;${oi.product.price}</td>
							<td width="10%" style="padding-top: 27px;">${oi.counts}</td>
							<td width="15%" style="padding-top: 27px;"><span class="subtotal">&yen;${oi.subtotal}</span></td>
							<%-- <td width="15%" style="padding-top: 27px;"><span class="subtotal">&yen;${oi.product.price * oi.counts }</span></td> --%>
						</tr>
						</c:forEach>
								</c:forEach>    
					</tbody>
				</table>
			</div>
     
		</div>

</body>

</html>