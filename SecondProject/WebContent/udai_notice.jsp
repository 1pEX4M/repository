<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
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
	<style type="text/css">
		.msg-list{
			height:300px;
		}
		.text-right{
			padding-right: 40px;
		}
	</style>
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
				<a href="udai_shopcart.jsp" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 0 件
				</a>
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
		<section class="panel__div panel-message__div clearfix">
			<div class="filter-value">
				<div class="filter-title">平台公告</div>
			</div>
			<div class="pull-left">
				<div class="msg-list">
					<c:forEach items="${pageBean.list }" var="p">
					<a class="ep" href="${ctx }/newsServlet?method=getNewsByNid&nid=${p.nid }&currentPage=${pageBean.currentPage}">${p.title }</a>
					</c:forEach>
					
				</div>
				<div class="page text-right clearfix">
				<c:if test="${pageBean.currentPage == 1 }">
					<a class="disabled">上一页</a>
				</c:if>
				<c:if test="${pageBean.currentPage != 1 }">
					<a class="" href="${ctx }/newsServlet?method=getNewsByNid&nid=${onenews.nid }&currentPage=${pageBean.currentPage - 1}">上一页</a>
				</c:if>
				  	<c:forEach begin="1" end="${pageBean.totalPage }" var="num">
				  	<c:if test="${pageBean.currentPage == num }">
					<a class="select">${num }</a>
					</c:if>	
					<c:if test="${pageBean.currentPage != num }">
					<a class="" href="${ctx }/newsServlet?method=getNewsByNid&nid=${onenews.nid }&currentPage=${num}">${num }</a>
					</c:if>	
					
					</c:forEach>
					
				<c:if test="${pageBean.currentPage == pageBean.totalPage }">
					<a class="disabled" >下一页</a>
				</c:if>
				<c:if test="${pageBean.currentPage != pageBean.totalPage }">
					<a class="" href="${ctx }/newsServlet?method=getNewsByNid&nid=${onenews.nid }&currentPage=${pageBean.currentPage + 1}">下一页</a>
				</c:if>
				
				</div>
			</div>
			<div class="message-box pull-right">
				<div class="head-div clearfix posr">
					<div class="title">${onenews.title }</div>
				</div>
				<div class="html-code">
					<p></p>
					<p style="text-indent: 2em">${onenews.content }</p>
					
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