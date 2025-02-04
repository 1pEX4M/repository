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

<!-- 	<script type="text/javascript">
		function submitorder(){
			$val = ${ order.oid };
			 window.location = "${ pageContext.request.contextPath }/orderServlet?method=confirm&oid=" + $val;
		}
	
		
	</script> -->
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
					<div class="title">订单中心-确认收货</div>
					<div class="order-info__box">
						<div class="step-flow-box" style="width: 800px;margin: 0 auto 24px">
							<div class="step-flow__bd">
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">拍下商品</p>
								</div>
								<div class="step-flow__line step-flow__li_done">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">付款</p>
								</div>
								<div class="step-flow__line step-flow__li_done">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">卖家发货</p>
								</div>
								<div class="step-flow__line step-flow__line_ing">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">买家确认收货</p>
								</div>
							</div>
						</div>
						<p class="fz18 cr">我已收到货，同意付款。</p>
						<div class="table-thead">
							<div class="tdf3">商品</div>
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
								<div class="tdf1">${oi.counts}</div>
								<div class="tdf1">&yen;${oi.product.price}</div>
								<div class="tdf2">
									<div class="ep2">活动8折优惠<br></div>
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
						<hr>
						<div class="order-info">
							订单编号：<span class="c6">${ order.oid }</span><br>
							支付宝交易号：<span class="c6">165454564564165164654654</span><br>
							收货地址：<span class="c6">${order.address}&ensp;(${order.aname }&ensp;收)&ensp;${order.telephone}</span><br>
							成交时间：<span class="c6">${ order.ordertime }</span>
						</div>
						<div class="modify_div clearfix">
							<form action=""  class="user-setting__form" role="form">
								<ul class="fz12 text-nowrap">
									<li class="cr">◆ 请收到货后，再确认收货！否则我们可能无法为您保障权益！</li>
									<li class="c6">◆ 如果您想申请退款，<a href="udai_apply_return.jsp">请点击这里</a></li>
								</ul>
								<div class="form-group">
									<label form="pay-pwd" class="iptut-box-nick posr">
										<span class="cr">支付密码：</span>
										<input type="password" id="pay-pwd" maxlength="6">
										<div class="iptut-fake-box"></div>
										<p style="font-weight: normal">请输入6位数字支付密码 <a href="udai_paypwd_modify.jsp">忘记支付密码？</a></p>
									</label>
								</div>
								<div class="form-group" style="line-height: 1em">
									<div class="col-sm-offset-2 col-sm-10">
										<a class="but" href="${ pageContext.request.contextPath }/orderServlet?method=confirm&oid=${ order.oid }">确认已收货</a>
									</div>
								</div>
								<script>
									$(document).ready(function(){
										var teml = '<div class="pwd-digit"></div>',
											$fake_box = $('.iptut-fake-box');
										$fake_box.empty().jsp(teml + teml + teml + teml + teml + teml)
										$fake_box.jsp()
										$('#pay-pwd').bind('input propertychange focus',function() {
											$fake_box.empty();
											for (var i = 0; i < 6; i++) {
												var $temp = $(teml);
												if ($(this).val().length > i) {
													$temp.addClass('active')
												};
												if ($(this).val().length == i) {
													$temp.addClass('current')
												};
												$fake_box.append($temp);
											}
										});
										$('#pay-pwd').bind('blur',function() {
											$fake_box.find('.pwd-digit').removeClass('current');
										});
									});
								</script>
							</form>
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