<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<a href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=1"><dd>我的订单</dd></a>
					<a href="udai_collection.jsp"><dd class="active">我的收藏</dd></a>
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
					<div class="title">订单中心-我的收藏</div>
					<div class="collection-list__area clearfix">
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-001.jpg" alt="锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款" class="cover">
								<div class="name">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-002.jpg" alt="霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套" class="cover">
								<div class="name">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-003.jpg" alt="陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋" class="cover">
								<div class="name">陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-004.jpg" alt="霜天月明 原创传统日常汉服男绣花交领衣裳cp春装单品" class="cover">
								<div class="name">霜天月明 原创传统日常汉服男绣花交领衣裳cp春装单品</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-005.jpg" alt="琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装" class="cover">
								<div class="name">琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>

						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-001.jpg" alt="锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款" class="cover">
								<div class="name">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-002.jpg" alt="霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套" class="cover">
								<div class="name">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-003.jpg" alt="陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋" class="cover">
								<div class="name">陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-004.jpg" alt="霜天月明 原创传统日常汉服男绣花交领衣裳cp春装单品" class="cover">
								<div class="name">霜天月明 原创传统日常汉服男绣花交领衣裳cp春装单品</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-005.jpg" alt="琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装" class="cover">
								<div class="name">琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/M-006.jpg" alt="琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装" class="cover">
								<div class="name">琅轩日常汉服男龙纹绣花短褙子气质传统外套春秋非古装</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
						<div class="item-card">
							<a href="item_show.jsp" class="photo">
								<img src="images/temp/S-006.jpg" alt="陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋" class="cover">
								<div class="name">陇上乐原创传统日常汉服男绣花交领cp情侣非古装春秋</div>
							</a>
							<div class="middle">
								<div class="price"><small>￥</small>18.0</div>
								<div class="sale"><a href="">取消收藏</a></div>
							</div>
						</div>
					</div>
					<div class="page text-right clearfix">
						<a class="disabled">上一页</a>
						<a class="select">1</a>
						<a href="">2</a>
						<a href="">3</a>
						<a class="" href="">下一页</a>
						<a class="disabled">1/3页</a>
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