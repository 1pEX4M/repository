<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
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
	<script type="text/javascript">
		
	</script>
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
				<a href="${ctx }/admin/index.jsp">管理员登录</a>
				<a href="udai_welcome.jsp">我的U袋</a>
				<a href="${ pageContext.request.contextPath }/orderServlet?method=myOrders&currentPage=1">我的订单</a>
				<a href="udai_integral.jsp">积分平台</a>
			</div>
		</div>
	</div>
	<!-- 搜索栏 -->
	<div class="top-search">
		<div class="inner">
			<a class="logo" href="index.jsp"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
			<div class="search-box">
				<form class="input-group">
					<input placeholder="Ta们都在搜U袋网" type="text">
					<span class="input-group-btn">
						<button type="button">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</form>
				<p class="help-block text-nowrap">
					<a href="">连衣裙</a>
					<a href="">裤</a>
					<a href="">衬衫</a>
					<a href="">T恤</a>
					<a href="">女包</a>
					<a href="">家居服</a>
					<a href="">2017新款</a>
				</p>
			</div>
				
			<div class="cart-box">
				
				<c:if test="${not empty cart and cart.cartItems.size()!=0}">
					<a href="udai_shopcart.jsp" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 ${cart.cartItems.size()} 件
					</a>
				</c:if>
			
				
				<c:if test="${not empty cart and cart.cartItems.size()==0}">
					<a href="udai_shopcart.jsp" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 0 件
					</a>
				</c:if>	
				
				
				<c:if test="${empty cart}">
					<a href="udai_shopcart.jsp" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 0 件
					</a>
				</c:if>	
				
				
			</div>
				</div>
	</div>
	<!-- 首页导航栏 -->
	<div class="top-nav bg3">
		<div class="nav-box inner">
			<div class="all-cat">
				<div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
				<div class="cat-list__box">
				
				<c:forEach items="${categorylist }" var="c">
					<c:if test="${c.parentId == 0 }">
					<div class="cat-box">
						<div class="title">
							<a href="${ctx }/productServlet?method=getProductListByCondition&cid=${c.cid}" style="color:white"><i class="iconfont icon-skirt ce"></i> ${c.cname }</a>
						</div>
						
						<ul class="cat-list clearfix">
						<c:forEach items="${categorylist }" var="p">
						<c:if test="${p.parentId == c.cid }">
							<a href="${ctx }/productServlet?method=getProductListByCondition&cid=${c.cid}&cname=${p.cname}" ><li>${p.cname }</li></a>
							</c:if>
						</c:forEach>
						</ul>
							
								
					</div>
							
							</c:if>
						</c:forEach>
					
					
					
				</div>
				
			</div>
			<ul class="nva-list">
				<a href="index.jsp"><li class="active">首页</li></a>
				<a href="temp_article/udai_article10.jsp"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.jsp"><li>新手上路</li></a>
				<a href="class_room.jsp"><li>U袋学堂</li></a>
				<a href="enterprise_id.jsp"><li>企业账号</li></a>
				<a href="udai_contract.jsp"><li>诚信合约</li></a>
				<a href="item_remove.jsp"><li>实时下架</li></a>
			</ul>
			<div class="user-info__box">
				<div class="login-box">
					<div class="avt-port">
						<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
					</div>
					<!-- 已登录 -->
					<c:if test="${not empty existUser }">
						<div class="name c6">Hi~ <span class="cr">${existUser.nickname}</span></div>
						<div class="report-box">
						<!-- <span class="badge">+30</span> -->
						<a class="btn btn-primary btn-block" href="#" role="button">签到领积分</a>
						<!-- <a class="btn btn-info btn-block disabled" href="#" role="button">已签到1天</a> -->
						
					</div>
					</c:if>
					<c:if test="${empty existUser }">
						<div class="name c6">Hi~ 你好</div>
						<div class="point c6"><a href="login.jsp">点此登录</a>，发现更多精彩</div>
						
					</c:if>
					
					<!-- 未登录 -->
					
					
				</div>
				<div class="agent-box">
					<a href="#" class="agent">
						<i class="iconfont icon-fushi"></i>
						<p>申请网店代销</p>
					</a>
					<a href="javascript:;" class="agent">
						<i class="iconfont icon-agent"></i>
						<p><span class="cr">9527</span>位代销商</p>
					</a>
				</div>
				<div class="verify-qq">
					<div class="title">
						<i class="fake"></i>
						<span class="fz12">真假QQ客服验证-远离骗子</span>
					</div>
					<form class="input-group">
						<input class="form-control" placeholder="输入客服QQ号码" type="text">
						<span class="input-group-btn">
							<button class="btn btn-primary submit" id="verifyqq" type="button">验证</button>
						</span>
					</form>
					<script>
						$(function() {
							$('#verifyqq').click(function() {
								DJMask.open({
								width:"400px",
								height:"150px",
								title:"U袋网提示您：",
								content:"<b>该QQ不是客服-谨防受骗！</b>"
							});
							});
						});
					</script>
				</div>
				<div class="tags">
					<div class="tag"><i class="iconfont icon-real fz16"></i> 品牌正品</div>
					<div class="tag"><i class="iconfont icon-credit fz16"></i> 信誉认证</div>
					<div class="tag"><i class="iconfont icon-speed fz16"></i> 当天发货</div>
					<div class="tag"><i class="iconfont icon-tick fz16"></i> 人工质检</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 顶部轮播 -->
    <div class="swiper-container banner-box">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><a href="item_show.jsp"><img src="images/temp/banner_1.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_show.jsp"><img src="images/temp/banner_2.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_category.jsp"><img src="images/temp/banner_3.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_show.jsp"><img src="images/temp/banner_4.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_sale_page.jsp"><img src="images/temp/banner_5.jpg" class="cover"></a></div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <!-- 首页楼层导航 -->
	<nav class="floor-nav visible-lg-block">
	<span class="scroll-nav active">爆款推荐</span>
	<c:forEach items="${categorylist }" var="c">
	<c:if test="${c.parentId == 0 }">
		<span class="scroll-nav active">${c.cname }</span>
		</c:if>
		</c:forEach>
	</nav>
	<!-- 楼层内容 -->
	<div class="content inner" style="margin-bottom: 40px;">
		<section class="scroll-floor floor-1 clearfix">
			<div class="pull-left">
				<div class="floor-title">
					<i class="iconfont icon-tuijian fz16"></i> 爆款推荐
					<a href="" class="more"><i class="iconfont icon-more"></i></a>
				</div>
				<div class="con-box">
					<a class="left-img hot-img" href="">
						<img src="images/floor_1.jpg" alt="" class="cover">
					</a>
					
					<div class="right-box hot-box">
					
					<c:forEach items="${productlist }" var="p" begin="0" end="5">
						<a href="${ctx }/productServlet?method=getProductByPid&pid=${p.pid}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${ctx }/${p.imagelist[0]}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${p.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${p.pdesc }</div>
						</a>
						
						</c:forEach>
					
					</div>
				</div>
			</div>
			<div class="pull-right">
				<div class="floor-title">
					<i class="iconfont icon-horn fz16"></i> 平台公告
					<a href="udai_notice.jsp" class="more"><i class="iconfont icon-more"></i></a>
				</div>
				<div class="con-box">
					<div class="notice-box bgf5">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach items="${news }" var="n">
									<a class="swiper-slide ep" href="${ctx }/newsServlet?method=getNewsByNid&nid=${n.nid}&currentPage=1">${n.title }</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="buts-box bgf5">
						<div class="but-div">
							<a href="">
								<i class="but-icon"></i>
								<p>物流查询</p>
							</a>
						</div>
						<div class="but-div">
							<a href="item_sale_page.jsp">
								<i class="but-icon"></i>
								<p>热卖专区</p>
							</a>
						</div>
						<div class="but-div">
							<a href="item_sale_page.jsp">
								<i class="but-icon"></i>
								<p>满减专区</p>
							</a>
						</div>
						<div class="but-div">
							<a href="item_sale_page.jsp">
								<i class="but-icon"></i>
								<p>折扣专区</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-2">
			<div class="floor-title">
			<!-- 女装 -->
			<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 1 }">
					<i class="iconfont icon-skirt fz16">${c.cname }</i>
				
					<div class="case-list fz0 pull-right">
						<c:forEach items="${categorylist }" var="p">
							<c:if test="${p.parentId == c.cid }">
							<a href="item_category.jsp">${p.cname }</a><!-- 女装分类 -->
							</c:if>
							 
						</c:forEach>					
					</div>
					</c:if>
			</c:forEach>
			
			
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="images/floor_2.jpg" alt="" class="cover">
				</a>
				<div class="right-box" style="overflow: hidden;">
				
				
				<!-- 女装 商品 -->
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 1 }">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid }">
					
						<c:forEach items="${productlist }" var="pro" >
						<c:if test="${pro.cid == p.cid }">
						
							<a href="${ctx }/productServlet?method=getProductByPid&pid=${pro.pid}" class="floor-item">
								<div class="item-img hot-img">									
										<img src="${ctx }/${pro.imagelist[0]}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">									
								</div>
								<div class="price clearfix">
									<span class="pull-left cr fz16">￥${pro.price }</span>
									<span class="pull-right c6">进货价</span>
								</div>
								<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${pro.pdesc }</div>
							</a>
						</c:if>
						</c:forEach>
					</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>		
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-3">
			<div class="floor-title">
			
			<!-- 男装 -->
			<c:forEach items="${categorylist }" var="c">
			<c:if test="${c.cid == 2 }">·
				<i class="iconfont icon-fushi fz16"></i> ${c.cname }
				<div class="case-list fz0 pull-right">
				<c:forEach items="${categorylist }" var="p">
				<c:if test="${p.parentId == c.cid }"> 
					<a href="item_category.jsp">${p.cname }</a>
				</c:if>
				</c:forEach>
				</div>
			</c:if>
			</c:forEach>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="images/floor_3.jpg" alt="" class="cover">
				</a>
				
				
				<div class="right-box" style="overflow: hidden;">
				
				
				<!-- 男装分类商品 -->
				
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 2 }">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid }">
						<c:forEach items="${productlist }" var="pro">
						<c:if test="${pro.cid == p.cid }">
							<a href="${ctx }/productServlet?method=getProductByPid&pid=${pro.pid}" class="floor-item">
								<div class="item-img hot-img">
									<img src="${ctx }/${pro.imagelist[0]}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
								</div>
								<div class="price clearfix">
									<span class="pull-left cr fz16">￥${pro.price }</span>
									<span class="pull-right c6">进货价</span>
								</div>
								<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${pro.pdesc }</div>
							</a>
						</c:if>	
						</c:forEach>
							
					</c:if>	
					</c:forEach>
				</c:if>	
				</c:forEach>	
			
				</div>
				
				
			</div>
		</section>
		<section class="scroll-floor floor-4">
			<div class="floor-title">
			
			<!-- 包包 -->
			<c:forEach items="${categorylist }" var="c">
			<c:if test="${c.cid == 3 }">
				<i class="iconfont icon-kid fz16"></i> ${c.cname }
				<div class="case-list fz0 pull-right">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid}">
						<a href="item_category.jsp">${p.cname }</a>
					</c:if>
					</c:forEach>
				</div>
			</c:if>
			</c:forEach>
			
			
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="images/floor_5.jpg" alt="" class="cover">
				</a>
				<div class="right-box" style="overflow: hidden;">
				<!-- 包包 商品 -->
				
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 3 }">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid}">
						<c:forEach items="${productlist }" var="pro">
						<c:if test="${pro.cid == p.cid}">
							<a href="${ctx }/productServlet?method=getProductByPid&pid=${pro.pid}" class="floor-item">
								<div class="item-img hot-img">
									<img src="${ctx }/${pro.imagelist[0]}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
								</div>
								<div class="price clearfix">
									<span class="pull-left cr fz16">￥${pro.price }</span>
									<span class="pull-right c6">进货价</span>
								</div>
								<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${pro.pdesc }</div>
							</a>
						</c:if>	
						</c:forEach>
							
					</c:if>	
					</c:forEach>
					
				</c:if>	
				</c:forEach>	
				
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-5">
			<div class="floor-title">
			
			<!-- 童装 -->
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 4 }">
						<i class="iconfont icon-bao fz16"></i> ${c.cname }
						<div class="case-list fz0 pull-right">
							<c:forEach items="${categorylist }" var="p">
							<c:if test="${p.parentId == c.cid}">
								<a href="item_category.jsp">${p.cname }</a>
							</c:if>
							</c:forEach>
						</div>
				</c:if>
				</c:forEach>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="images/floor_4.jpg" alt="" class="cover">
				</a>
				<div class="right-box" style="overflow: hidden;">
				
				<!-- 童装商品 -->
				
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 4 }">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid }">
						<c:forEach items="${productlist }" var="pro">
						<c:if test="${pro.cid == p.cid }">
							<a href="${ctx }/productServlet?method=getProductByPid&pid=${pro.pid}" class="floor-item">
								<div class="item-img hot-img">
									<img src="${pro.imagelist[0] }" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
								</div>
								<div class="price clearfix">
									<span class="pull-left cr fz16">￥${pro.price }</span>
									<span class="pull-right c6">进货价</span>
								</div>
								<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${pro.pdesc }</div>
							</a>
						</c:if>
						</c:forEach>
					
					</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>	
					
		
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-6">
			<div class="floor-title">
			
			<!-- 鞋靴 -->
			
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 5 }">
					<i class="iconfont icon-shoes fz16"></i> ${c.cname }
					<div class="case-list fz0 pull-right">
						<c:forEach items="${categorylist }" var="p">
						<c:if test="${p.parentId == c.cid }">
							<a href="item_category.jsp">${p.cname }</a>
						</c:if>
						</c:forEach>
					</div>
				</c:if>
				</c:forEach>
				
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="images/floor_6.jpg" alt="" class="cover">
				</a>
				<div class="right-box" style="overflow: hidden;">
				
				
				<!-- 鞋靴商品 -->
				
				<c:forEach items="${categorylist }" var="c">
				<c:if test="${c.cid == 5 }">
					<c:forEach items="${categorylist }" var="p">
					<c:if test="${p.parentId == c.cid }">
						<c:forEach items="${productlist }" var="pro">
						<c:if test="${pro.cid == p.cid }">
							<a href="${ctx }/productServlet?method=getProductByPid&pid=${pro.pid}" class="floor-item">
								<div class="item-img hot-img">
									<img src="${ctx }/${pro.imagelist[0]}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
								</div>
								<div class="price clearfix">
									<span class="pull-left cr fz16">￥${pro.price }</span>
									<span class="pull-right c6">进货价</span>
								</div>
								<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${pro.pdesc }</div>
							</a>
						</c:if>	
						</c:forEach>
					</c:if>	
					</c:forEach>	
				</c:if>	
				</c:forEach>	
					
				
					
				</div>
			</div>
		</section>
	</div>
	<script>
		$(document).ready(function(){ 
			// 顶部banner轮播
			var banner_swiper = new Swiper('.banner-box', {
				autoplayDisableOnInteraction : false,
				pagination: '.banner-box .swiper-pagination',
				paginationClickable: true,
				autoplay : 5000,
			});
			// 新闻列表滚动
			var notice_swiper = new Swiper('.notice-box .swiper-container', {
				paginationClickable: true,
				mousewheelControl : true,
				direction : 'vertical',
				slidesPerView : 10,
				autoplay : 2e3,
			});
			// 楼层导航自动 active
			$.scrollFloor();
			// 页面下拉固定楼层导航
			$('.floor-nav').smartFloat();
			$('.to-top').toTop({position:false});
		});
	</script>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.jsp" class="r-item-hd">
					<i class="iconfont icon-user"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.jsp" class="r-item-hd">
					<i class="iconfont icon-cart" data-badge="10"></i>
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
