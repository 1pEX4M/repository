<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href="login.jsp"><span class="cr">登录</span></a>
				<a href="login.jsp?p=register">注册</a>
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
					<div class="title">订单中心-订单2669901385864042</div>
					<div class="order-info__box">
						<div class="order-addr">收货地址：<span class="c6">${order.address}&ensp;(${order.aname }&ensp;收)&ensp;${order.telephone}</span></div>
						<div class="order-info">
							订单信息
							<table>
								<tr>
									<td>订单编号：${ order.oid }</td>
									<td>支付宝交易号：20175215464616164616</td>
									<td>创建时间：${ order.ordertime }</td>
								</tr>
								<tr>
									<td>付款时间：2017-09-20 08:15:45</td>
									<td>成交时间：2017-09-20 08:25:45</td>
									<td></td>
								</tr>
							</table>
						</div>
						<div class="table-thead">
							<div class="tdf3">商品</div>
							<div class="tdf1">状态</div>
							<div class="tdf1">数量</div>
							<div class="tdf1">单价</div>
							<div class="tdf2">优惠</div>
							<div class="tdf1">总价</div>
							<div class="tdf1">运费</div>
						</div>
				<c:forEach items="${ order.orderItems }" var="oi">
						<div class="order-item__list">
							<div class="item">
								<div class="tdf3">
									<a href="item_show.jsp"><div class="img"><img src="${ pageContext.request.contextPath }/${oi.product.imagelist[0]}" alt="" class="cover"></div>
									<div class="ep2 c6">${oi.product.pname}</div></a>
									<div class="attr ep">颜色分类：${oi.product.color}  尺码：${oi.product.size}</div>
								</div>
								<div class="tdf1"><a href="order_evaluate.jsp">待评价</a><!-- 已确认收货 --></div>
								<div class="tdf1">${oi.counts}</div>
								<div class="tdf1">&yen;${oi.product.price}</div>
								<div class="tdf2">
									<div class="ep2">活动8折优惠<br>优惠：¥4.0</div>
								</div>
								<div class="tdf1">&yen;${oi.counts*oi.product.price}</div>
								<div class="tdf1">
									<div class="ep2">快递<br>¥0.00</div>
								</div>
							</div>
							
						</div>
						<div class="price-total">
							<div class="fz12 c9">使用优惠券【满￥20.0减￥2.0】优惠￥2.0元<br>快递运费 ￥0.0</div>
							<div class="fz18 c6">实付款：<b class="cr">&yen;${oi.counts*oi.product.price}</b></div>
							<div class="fz12 c9">（本单可获 <span class="c6">${oi.counts*oi.product.price/2}</span> 积分）</div>
						</div>
							</c:forEach>
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