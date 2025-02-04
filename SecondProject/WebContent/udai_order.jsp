<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/global.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/swiper.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="js/swiper.min.js" charset="UTF-8"></script>
	<script src="js/global.js" charset="UTF-8"></script>
	<script src="js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
	<title>U袋网</title>
</head>
<body>
	<!-- 顶部tab -->
	<div class="tab-header">
		<div class="inner">
			<div class="pull-left">
				<div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
				<a href="agent_level.jsp">网店代销</a>
				<a href="temp_article/udai_article4.jsp">帮助中心</a>
			</div>
			<div class="pull-right">
				<c:if test="${ empty existUser }">
					<a href="login.jsp"><span class="cr">登录</span></a>
					<a href="login.jsp?p=register">注册</a>
				</c:if>
				<c:if test="${ not empty existUser }">
					<a href="${pageContext.request.contextPath }/userServlet?method=logout"><span class="cr">安全退出</span></a>
					
				</c:if>
				<a href="udai_welcome.jsp">我的U袋</a>
				<a href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=1">我的订单</a>
				<a href="udai_integral.jsp">积分平台</a>
			</div>
		</div>
	</div>
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="index.jsp"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">个人中心</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="pull-left bgf">
				<a href="udai_welcome.jsp" class="title">U袋欢迎页</a>
				<dl class="user-center__nav">
					<dt>帐户信息</dt>
					<a href="udai_setting.jsp"><dd>个人资料</dd></a>
					<a href="udai_treasurer.jsp"><dd>资金管理</dd></a>
					<a href="udai_integral.jsp"><dd>积分平台</dd></a>
					<a href="udai_address.jsp"><dd>收货地址</dd></a>
					<a href="udai_coupon.jsp"><dd>我的优惠券</dd></a>
					<a href="udai_paypwd_modify.jsp"><dd>修改支付密码</dd></a>
					<a href="udai_pwd_modify.jsp"><dd>修改登录密码</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>订单中心</dt>
					<a href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=1"><dd class="active">我的订单</dd></a>
					<a href="udai_collection.jsp"><dd>我的收藏</dd></a>
					<a href="udai_refund.jsp"><dd>退款/退货</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>服务中心</dt>
					<a href="udai_mail_query.jsp"><dd>物流查询</dd></a>
					<a href=""><dd>数据自助下载</dd></a>
					<a href="temp_article/udai_article1.jsp"><dd>售后服务</dd></a>
					<a href="temp_article/udai_article2.jsp"><dd>配送服务</dd></a>
					<a href="temp_article/udai_article3.jsp"><dd>用户协议</dd></a>
					<a href="temp_article/udai_article4.jsp"><dd>常见问题</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>新手上路</dt>
					<a href="temp_article/udai_article5.jsp"><dd>如何成为代理商</dd></a>
					<a href="temp_article/udai_article6.jsp"><dd>代销商上架教程</dd></a>
					<a href="temp_article/udai_article7.jsp"><dd>分销商常见问题</dd></a>
					<a href="temp_article/udai_article8.jsp"><dd>付款账户</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>U袋网</dt>
					<a href="temp_article/udai_article10.jsp"><dd>企业简介</dd></a>
					<a href="temp_article/udai_article11.jsp"><dd>加入U袋</dd></a>
					<a href="temp_article/udai_article12.jsp"><dd>隐私说明</dd></a>
				</dl>
			</div>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">订单中心-我的订单</div>
					<div class="order-list__box bgf">
						<div class="order-panel">
							<ul class="nav user-nav__title" role="tablist">
								<li role="presentation" class="nav-item active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">所有订单</a></li>
								<li role="presentation" class="nav-item "><a href="#pay" aria-controls="pay" role="tab" data-toggle="tab">待付款 <span class="cr">${fn:length(orderList1)}</span></a></li>
								<li role="presentation" class="nav-item "><a href="#emit" aria-controls="emit" role="tab" data-toggle="tab">待发货 <span class="cr">${fn:length(orderList2)}</span></a></li>
								<li role="presentation" class="nav-item "><a href="#take" aria-controls="take" role="tab" data-toggle="tab">待收货 <span class="cr">${fn:length(orderList3)}</span></a></li>
								<li role="presentation" class="nav-item "><a href="#eval" aria-controls="eval" role="tab" data-toggle="tab">待评价 <span class="cr">${fn:length(orderList4)}</span></a></li>
							</ul>
							
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="all">
								
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
									<c:if test="${ empty orderList }">
										
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有任何订单，家里好像缺了点什么！<br><a href="index.jsp">要不瞧瞧去？</a></div>
										</td></tr>
									</c:if>
								
									<c:if test="${ not empty orderList }">
										
									<c:forEach items="${ orderList.list }" var="order">
										
										<c:forEach items="${ order.orderItems }" var="oi">
										<tr class="order-item">
											<td>
												<label>
													  <a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order.oid }" class="num">
														${ order.ordertime } 订单号: ${ order.oid }
													</a>
													<div class="card">
														<div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
														<div class="name ep2">${oi.product.pname}</div>
														<div class="format">颜色分类：${oi.product.color}  尺码：${oi.product.size} </div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>
												</label>
											</td>
											<td>${oi.product.shop_price}</td>
											<td>${oi.counts}</td>
											<td>${order.total1}<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<a class="but c6">
													<c:if test="${ order.state == 1 }"><a href="#">待付款</a></c:if>
													<c:if test="${ order.state == 2 }"><span style="color:blue;">等待发货</span></c:if>
													<c:if test="${ order.state == 3 }"><a href="#">待收货</a></c:if>
													<c:if test="${ order.state == 4 }">订单完成</c:if>
													<c:if test="${ order.state == 5 }">已取消</c:if>
												</a>
												<a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order.oid }" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><a href="${ pageContext.request.contextPath }/orderServlet?method=del&oid=${order.oid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></div>
													<c:if test="${ order.state == 1 }"><a href="${pageContext.request.contextPath }/alipayServlet?method=pay&oid=${order.oid }&money=${order.total}" class="but but-primary">去付款</a></c:if>
													<c:if test="${ order.state == 2 }"><a href="#" class="but but-primary">确认发货</a></c:if>
													<c:if test="${ order.state == 3 }"><a href="${ pageContext.request.contextPath }/orderServlet?method=load1&oid=${ order.oid }" class="but but-primary">确认收货</a></c:if>
													<c:if test="${ order.state == 4 }"><a href="" class="but but-primary">待评价</a></c:if>
													<c:if test="${ order.state == 5 }"><a href="" class="but but-primary">已取消</a></c:if>
												
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="${ pageContext.request.contextPath }/orderServlet?method=cancleOrder&oid=${order.oid}" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
								
										
									
										</c:forEach>
									</c:if>
										</table>
										
									<div class="page text-right clearfix" style="margin-top: 40px">
									<c:if test="${orderList.currentPage == 1}">
										<a class="disabled"><span aria-hidden="true">&laquo;</span></a>
									</c:if>
									<c:if test="${orderList.currentPage > 1}">
									<a class="disabled" href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=${orderList.currentPage - 1}" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></a>
									</c:if>
									<c:forEach begin="1" end="${ orderList.totalPage }" var="num">
										
										<c:if test="${ orderList.currentPage == num }">
										<a class="select" href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=${ num }">${ num }</a>
										</c:if>	
										<c:if test="${ orderList.currentPage != num }">
										<a class="" href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=${ num }">${ num }</a>
										</c:if>
									</c:forEach>
									<c:if test="${orderList.currentPage == orderList.totalPage}">
									<a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
									</c:if>
									<c:if test="${orderList.currentPage < orderList.totalPage}">
									
									<a href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=${orderList.currentPage + 1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>	
									</c:if>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="pay">
									<table class="table text-center">
									
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
									<c:if test="${ empty orderList1 }">
										
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有任何订单，家里好像缺了点什么！<br><a href="index.jsp">要不瞧瞧去？</a></div>
										</td></tr>
									</c:if>
									
									<c:if test="${ not empty orderList1 }">	
										<c:forEach items="${ orderList1 }" var="order1">
										<c:forEach items="${ order1.orderItems }" var="oi">
										<tr class="order-item">
											<td>
												<label>
													<a href="udai_order_detail.jsp" class="num">
														${ order1.ordertime } 订单号: ${ order1.oid }
													</a>
													<div class="card">
														<div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
														<div class="name ep2">${oi.product.pname}</div>
														<div class="format">颜色分类：${oi.product.color}  尺码：${oi.product.size} </div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>
												</label>
											</td>
											<td>${oi.product.price}</td>
											<td>${oi.counts}</td>
											<td>${oi.product.price}<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<a class="but c6">待付款</a>
												<a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order1.oid }" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><a href="${ pageContext.request.contextPath }/orderServlet?method=del&oid=${order1.oid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></div>
													<a href="${pageContext.request.contextPath }/alipayServlet?method=pay&oid=${order1.oid }&money=${order1.total}" class="but but-primary">去付款</a>
												
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="${ pageContext.request.contextPath }/orderServlet?method=cancleOrder&oid=${order1.oid}" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
										
										</c:forEach>
								
									</c:if>
									</table>

								</div>
								<div role="tabpanel" class="tab-pane fade" id="emit">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
									<c:if test="${ empty orderList2 }">
										
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有任何订单，家里好像缺了点什么！<br><a href="index.jsp">要不瞧瞧去？</a></div>
										</td></tr>
									</c:if>
									
									<c:if test="${ not empty orderList2 }">	
									<c:forEach items="${ orderList2 }" var="order2">
										
										<c:forEach items="${ order2.orderItems }" var="oi">
										<tr class="order-item">
											<td>
												<label>
													<a href="udai_order_detail.jsp" class="num">
														${ order2.ordertime } 订单号: ${ order2.oid }
													</a>
													<div class="card">
														<div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
														<div class="name ep2">${oi.product.pname}</div>
														<div class="format">颜色分类：${oi.product.color}  尺码：${oi.product.size}</div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>
												</label>
											</td>
											<td>${oi.product.price}</td>
											<td>${oi.counts}</td>
											<td>${oi.product.price}<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<a class="but c6">等待发货</a>
												<a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order2.oid }" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><a href="${ pageContext.request.contextPath }/orderServlet?method=del&oid=${order2.oid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></div>
													<a href="#" class="but but-primary">确认发货</a>
												
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="${ pageContext.request.contextPath }/orderServlet?method=cancleOrder&oid=${order2.oid}" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
										
										</c:forEach>
								
									</c:if>
									</table>
							
								</div>
								
								<div role="tabpanel" class="tab-pane fade" id="take">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
									<c:if test="${ empty orderList3 }">
										
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有任何订单，家里好像缺了点什么！<br><a href="index.jsp">要不瞧瞧去？</a></div>
										</td></tr>
										
									</c:if>
									
									<c:if test="${ not empty orderList3 }">	
									<c:forEach items="${ orderList3 }" var="order3">
										
										<c:forEach items="${ order3.orderItems }" var="oi">
										<tr class="order-item">
											<td>
												<label>
													<a href="udai_order_detail.jsp" class="num">
														${ order3.ordertime } 订单号: ${ order3.oid }
													</a>
													<div class="card">
														<div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
														<div class="name ep2">${oi.product.pname}</div>
														<div class="format">颜色分类：${oi.product.color}  尺码：${oi.product.size}</div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>
												</label>
											</td>
											<td>${oi.product.price}</td>
											<td>${oi.counts}</td>
											<td>${oi.product.price}<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<a class="but c6">待收货</a>
												<a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order3.oid }" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><a href="${ pageContext.request.contextPath }/orderServlet?method=del&oid=${order3.oid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></div>
													<a href="${ pageContext.request.contextPath }/orderServlet?method=load1&oid=${ order3.oid }" class="but but-primary">确认收货</a>
												
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="${ pageContext.request.contextPath }/orderServlet?method=cancleOrder&oid=${order3.oid}" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
										
										</c:forEach>
								
									</c:if>
									</table>
		
								</div>
								
								<div role="tabpanel" class="tab-pane fade" id="eval">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
									<c:if test="${ empty orderList4 }">
										
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有任何订单，家里好像缺了点什么！<br><a href="index.jsp">要不瞧瞧去？</a></div>
										</td></tr>
										
									</c:if>
									
									<c:if test="${ not empty orderList4 }">	
									<c:forEach items="${ orderList4 }" var="order4">
										
										<c:forEach items="${ order4.orderItems }" var="oi">
										<tr class="order-item">
											<td>
												<label>
													<a href="udai_order_detail.jsp" class="num">
														${ order4.ordertime } 订单号: ${ order4.oid }
													</a>
													<div class="card">
														<div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
														<div class="name ep2">${oi.product.pname}</div>
														<div class="format">颜色分类：${oi.product.color}  尺码：${oi.product.size}</div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>
												</label>
											</td>
											<td>${oi.product.price}</td>
											<td>${oi.counts}</td>
											<td>${oi.product.price}<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<a class="but c6">订单完成</a>
												<a href="${ pageContext.request.contextPath }/orderServlet?method=load&oid=${ order4.oid }" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><a href="${ pageContext.request.contextPath }/orderServlet?method=del&oid=${order4.oid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></div>
													<a href="udai_shopcart_pay.jsp" class="but but-primary">待评价</a>
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="${ pageContext.request.contextPath }/orderServlet?method=cancleOrder&oid=${order4.oid}" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
										
										</c:forEach>
								
									</c:if>
									</table>
				
								</div>

							</div>
						</div>
					</div>
				
				</div>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.jsp" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.jsp" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_collection.jsp" class="r-item-hd">
					<i class="iconfont icon-aixin"></i>
					<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="" class="r-item-hd">
					<i class="iconfont icon-liaotian"></i>
					<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="issues.jsp" class="r-item-hd">
					<i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box"><span class="r-tip-text">留言反馈</span></div>
				</a>
			</li>
			<li class="r-toolbar-item to-top">
				<i class="iconfont icon-top"></i>
				<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
			</li>
		</ul>
		<script>
			$(document).ready(function(){ $('.to-top').toTop({position:false}) });
		</script>
	</div>
	<!-- 底部信息 -->
	<div class="footer">
		<div class="footer-tags">
			<div class="tags-box inner">
				<div class="tag-div">
					<img src="images/icons/footer_1.gif" alt="厂家直供">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_2.gif" alt="一件代发">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_3.gif" alt="美工活动支持">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_4.gif" alt="信誉认证">
				</div>
			</div>
		</div>
		<div class="footer-links inner">
			<dl>
				<dt>U袋网</dt>
				<a href="temp_article/udai_article10.jsp"><dd>企业简介</dd></a>
				<a href="temp_article/udai_article11.jsp"><dd>加入U袋</dd></a>
				<a href="temp_article/udai_article12.jsp"><dd>隐私说明</dd></a>
			</dl>
			<dl>
				<dt>服务中心</dt>
				<a href="temp_article/udai_article1.jsp"><dd>售后服务</dd></a>
				<a href="temp_article/udai_article2.jsp"><dd>配送服务</dd></a>
				<a href="temp_article/udai_article3.jsp"><dd>用户协议</dd></a>
				<a href="temp_article/udai_article4.jsp"><dd>常见问题</dd></a>
			</dl>
			<dl>
				<dt>新手上路</dt>
				<a href="temp_article/udai_article5.jsp"><dd>如何成为代理商</dd></a>
				<a href="temp_article/udai_article6.jsp"><dd>代销商上架教程</dd></a>
				<a href="temp_article/udai_article7.jsp"><dd>分销商常见问题</dd></a>
				<a href="temp_article/udai_article8.jsp"><dd>付款账户</dd></a>
			</dl>
		</div>
		<div class="copy-box clearfix">
			<ul class="copy-links">
				<a href="agent_level.jsp"><li>网店代销</li></a>
				<a href="class_room.jsp"><li>U袋学堂</li></a>
				<a href="udai_about.jsp"><li>联系我们</li></a>
				<a href="temp_article/udai_article10.jsp"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.jsp"><li>新手上路</li></a>
			</ul>
			<!-- 版权 -->
			<p class="copyright">
				© 2005-2017 U袋网 版权所有，并保留所有权利<br>
				ICP备案证书号：闽ICP备16015525号-2&nbsp;&nbsp;&nbsp;&nbsp;福建省宁德市福鼎市南下村小区（锦昌阁）1栋1梯602室&nbsp;&nbsp;&nbsp;&nbsp;Tel: 18650406668&nbsp;&nbsp;&nbsp;&nbsp;E-mail: 18650406668@qq.com
			</p>
		</div>
	</div>
</body>
</html>