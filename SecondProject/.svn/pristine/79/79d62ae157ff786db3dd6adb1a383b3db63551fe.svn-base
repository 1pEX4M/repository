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
<script>
	
	


</script>
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
	<!-- 内页导航栏 -->
	<div class="top-nav bg3">
		<div class="nav-box inner">
			<div class="all-cat">
				<div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
			</div>
			<ul class="nva-list">
				<a href="index.jsp"><li>首页</li></a>
				<a href="temp_article/udai_article10.jsp"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.jsp"><li>新手上路</li></a>
				<a href="class_room.jsp"><li>U袋学堂</li></a>
				<a href="enterprise_id.jsp"><li>企业账号</li></a>
				<a href="udai_contract.jsp"><li>诚信合约</li></a>
				<a href="item_remove.jsp"><li>实时下架</li></a>
			</ul>
		</div>
	</div>
	<div class="content inner">
		<section class="filter-section clearfix">
			<ol class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li class="active">商品筛选</li>
			</ol>
			<div class="filter-box">
				<div class="all-filter">
					<div class="filter-value">
						<div class="filter-title">商品分类 <i class="iconfont icon-down"></i></div>
						<!-- 全部大分类 -->
						<ul class="catelist-card">
							<a href=""><li class="active">全部分类</li></a>
						<c:forEach items="${categorylist }" var="c" >
							<c:if test="${c.parentId==0 }">
								<a href="${pageContext.request.contextPath}/productServlet?method=getProductListByCondition&cid=${c.cid}"><li>${c.cname}</li></a>
							</c:if>							
						</c:forEach>
							
							
						</ul>
						<!-- 已选选项 -->
						<div class="ul_filter">
							<c:if test="${not empty condition.cname and condition.cname!='' }">
								<span class="pull-left">
									分类：${condition.cname}<a href="${pageContext.request.contextPath}/productServlet?method=getProductListByCondition&cname=" class="close" >&times;</a>
								</span>
							</c:if>
							<c:if test="${not empty condition.color and condition.color!='' }">
								<span class="pull-left">
									颜色：${condition.color}<a href="${pageContext.request.contextPath}/productServlet?method=getProductListByCondition&color=" class="close">&times;</a>
								</span>
							</c:if>
							
							<c:if test="${not empty condition.minPrice }">
								<span class="pull-left">
									价格：${condition.minPrice}~${condition.maxPrice }<a href="${pageContext.request.contextPath}/productServlet?method=getProductListByCondition&minPrice=0.0&maxPrice=0.0" class="close">&times;</a>	
								</span>
							</c:if>
							
							
							
							<!-- <span class="pull-left">
								尺寸：XXL <a href="javascript:;" class="close">&times;</a>
							</span> -->
						</div>
						<a class="reset pull-right" href="${pageContext.request.contextPath}/productServlet?method=getProductListByCondition&cname=&color=&maxPrice=0.0&minPrice=0.0">重置</a>
					</div>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">分类：</span>
					<ul class="clearfix">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&cname="><li class="active">全部</li></a>						
							
								<c:forEach items="${categorylist}" var="c">
									<c:if test="${c.parentId==condition.cid}">
										<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&cname=${c.cname}"><li>${c.cname}</li></a>
									</c:if>								
								</c:forEach>
																		
						
						
					</ul>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">颜色：</span>
					<ul class="clearfix">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color="><li class="active">全部</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color=红色"><li>红色</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color=粉色"><li>粉色</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color=蓝色"><li>蓝色</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color=白色"><li>白色</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&color=黑色"><li>黑色</li></a>
					</ul>
				</div>
				
				<%-- <div class="filter-prop-item">
					<span class="filter-prop-title">尺寸：</span>
					<ul class="clearfix">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size="><li class="active">全部</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size=S"><li>S</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size=M"><li>M</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size=L"><li>L</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size=XL"><li>XL</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&size=XXL"><li>XXL</li></a>
						
					</ul>
				</div> --%>
				<div class="filter-prop-item">
					<span class="filter-prop-title">价格：</span>
					<ul class="clearfix">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=0&maxPrice=99999"><li class="active">全部</li></a>						
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=50&maxPrice=100"><li>50-100</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=100&maxPrice=200"><li>100-200</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=200&maxPrice=500"><li>200-500</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=500&maxPrice=1000"><li>500-1000</li></a>
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&minPrice=1000&maxPrice=2000"><li>1000-2000</li></a>
						
					</ul>
				</div>
			</div>
			<div class="sort-box bgf5">
				<div class="sort-text">排序：</div>
				<a href=""><div class="sort-text">销量 <i class="iconfont icon-sortDown"></i></div></a>
				<a href=""><div class="sort-text">评价 <i class="iconfont icon-sortUp"></i></div></a>
				<a href=""><div class="sort-text">价格 <i class="iconfont"></i></div></a>
				<div class="sort-total pull-right">共${pageBean.totalCount}个商品</div>
			</div>
		</section>
		<section class="item-show__div clearfix">
			<div class="pull-left">
				<div class="item-list__area clearfix">
				<c:forEach items="${pageBean.list }" var="p" varStatus="vs">
					<div class="item-card">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductByPid&pid=${p.pid}" class="photo">
							<img src=${p.imagelist[0] } alt="${p.pdesc }" class="cover">
							<div class="name">${p.pdesc }</div>
						</a>
						<div class="middle">
							<div class="price"><small>￥</small>${p.price}</div>
							<div class="sale"><a href="${pageContext.request.contextPath}/cartServlet?method=add&pid=${p.pid}&countss=">加入购物车</a></div>
						</div>
						<div class="buttom">
							
																
													
							<%-- <div>颜色 <b>${p.color }</b></div> --%>
							<div>销量<b>${p.popularity}</b></div>
						</div>
						
					</div>
				</c:forEach>
					
				</div>
				<!-- 分页 -->
				
				<div class="page text-right clearfix">
				<c:if test="${ pageBean.currentPage != 1 }">	
						<a  href="${ pageContext.request.contextPath }/productServlet?method=getProductListByCondition&currentPage=${pageBean.currentPage - 1}&type=page">上一页</a>	
				</c:if>
				<c:if test="${ pageBean.currentPage == 1 }">		
						<a class="disabled" href="javascript:;">上一页</a>							
				</c:if>
				
					<c:forEach begin="1"  end="${pageBean.totalPage}" step="1" var="num">
						
						<a  class="${pageBean.currentPage==num ?'select':'' }" href="${pageContext.request.contextPath }/productServlet?method=getProductListByCondition&currentPage=${num}&type=page">${num }</a>
					</c:forEach>
				<c:if test="${ pageBean.currentPage != pageBean.totalPage }">
						<a  href="${ pageContext.request.contextPath }/productServlet?method=getProductListByCondition&currentPage=${pageBean.currentPage + 1}&type=page">下一页</a>	
							
				</c:if>
				<c:if test="${ pageBean.currentPage == pageBean.totalPage }">						
							<a class="disabled" href="javascript:;">下一页</a>
				</c:if>
					
					
					<a class="disabled">${pageBean.currentPage}/${pageBean.totalPage}页</a>
					<form action="${pageContext.request.contextPath}/productServlet" method="post" class="page-order">
						到第
						<input type="hidden" name="method" value="getProductListByCondition"/>
						<input type="text" name="currentPage">
						页
						<input class="sub" type="submit" value="确定">
					</form>
				</div>
			</div>
			<div class="pull-right">				
				<div class="desc-segments__content">
					<div class="lace-title">
						<span class="c6">爆款推荐</span>
					</div>
					<div class="picked-box">
					<c:forEach items="${productlist }" begin="1" end="4" var="p">
						<a href="${pageContext.request.contextPath }/productServlet?method=getProductByPid&pid=${p.pid}" class="picked-item"><img src="${pageContext.request.contextPath }/${p.imagelist[0]}" alt="" class="cover"><span class="look_price">&yen;${p.price }</span></a>
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