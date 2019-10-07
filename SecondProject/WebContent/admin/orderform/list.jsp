<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${ pageContext.request.contextPath }" var="ctx"></c:set>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${ ctx }/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
   function test(obj){
    	   if(obj.value == obj.defaultValue){
    		   obj.value = "";
    	   }
       } 
    </script>
</HEAD>
<body>
	<br>
	<form action="${ ctx }/backProductStrvlet?method=tea&currentPage=1" method="post"  style="text-align:center">
		订单编号：<input  type="text" size="20"   name="oid" id="text1" value="${tea.oid == null ? '' : tea.oid}" onfocus="test(this)" />&ensp;&ensp;
		用户名：<input type="text"  size="10" name="username" value="${tea.username == null ? '' : tea.username }" onfocus="test(this)" />&ensp;&ensp; 
		订单时间		<input type="text" size="10" " name="ordertime"  value="${tea.ordertime == null ? '' : tea.ordertime}" onfocus="test(this)" />	
		<input type="submit" value="搜索">
	</form>
	
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>订单列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="7%">序号</td>
								<td align="center" width="13%">订单用户</td>
								<td align="center" width="18%">订单编号</td>
								<td align="center" width="16%">订单时间</td>
								<td align="center" width="12%">订单价格</td>
								<td width="7%" align="center">订单详情</td>
								<td width="7%" align="center">订单状态</td>
								<td width="6%" align="center">商品发货</td>
								<td width="6%" align="center">取消订单</td>
							</tr>
							<c:forEach items="${pageBean.list}" var="p" varStatus="vs">
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<!-- 序号 -->
								<td align="center" style="HEIGHT: 22px">
								   ${vs.count }
								</td>
									<!-- 订单用户 -->
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									> ${p.username }  </td>
									<c:forEach items="${p.orderss }" var="o">
							<!-- 	订单编号 -->
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									>${ o.oid }</td>
								
									<!-- 订单时间 -->
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									>${ o.ordertime }</td>
									<!-- 订单价格 -->
								<td style="CURSOR: hand; HEIGHT: 22px" align="center">
									${o.total }
									</td>	
									<!-- 订单详情 -->
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									>
									 <a href="${pageContext.request.contextPath}/backProductStrvlet?method=seek&oid=${o.oid}&uid=${p.uid}"
									 style="color: red;">查看</a>
									</td>
								<!-- 	订单状态 --> 	
								<td align="center" style="HEIGHT: 22px"align="center">
								<c:if test="${ o.state == 1 }"><a href="#">未付款</a></c:if>
								<c:if test="${ o.state == 2 }"><span style="color:blue;">等待发货</span></c:if>
								
								<c:if test="${ o.state == 3 }"><a href="#">确认收货</a></c:if>
								<c:if test="${ o.state == 4 }">订单完成</c:if>
								<c:if test="${ o.state == 5 }">已取消</c:if>&ensp;&ensp;
								</td>
									<td align="center" style="HEIGHT: 22px"align="center">
								<c:if test="${ o.state<2}">
									 未发货
									</c:if>
									<c:if test="${ o.state== 2}">
									<a href="${ pageContext.request.contextPath }/backProductStrvlet?method=shipments&oid=${o.oid}&currentPage=${pageBean.currentPage}" style="color: red;">
									  发货
									</a>
									</c:if>
										<c:if test="${ o.state> 2}">
									  已发货
									</c:if>
								</td>
								<td align="center" style="HEIGHT: 22px"align="center">
								<c:if test="${ o.state> 0 and o.state < 5}">
									<a href="${ pageContext.request.contextPath }/backProductStrvlet?method=cancle&oid=${o.oid}&currentPage=${pageBean.currentPage}" style="color: red;">
									  取消订单
									</a>
									</c:if>
								</td>
								</c:forEach>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr align="center" height="40">
					<td colspan="7">
<!-- 第 _ 页 / 共 _ 页     [首页] [上一页] [下一页] [末页]    -->
 <c:if test="${  empty  haha  }">
第&nbsp;${ pageBean.currentPage }&nbsp;页&nbsp;/&nbsp; 共&nbsp;${ pageBean.totalPage }&nbsp;页&nbsp;&nbsp;
<c:if test="${ pageBean.currentPage != 1 }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=orderform&currentPage=1">[首页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=orderform&currentPage=${pageBean.currentPage -1}">[上一页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == 1 }">
[首页]
[上一页]
</c:if>
<c:if test="${ pageBean.currentPage != pageBean.totalPage }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=orderform&currentPage=${pageBean.currentPage +1}">[下一页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=orderform&currentPage=${pageBean.totalPage}">[末页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == pageBean.totalPage }">
[下一页]	
[末页]	
</c:if>
</c:if>




  <c:if test="${not  empty  haha  }">
  第&nbsp;${ pageBean.currentPage }&nbsp;页&nbsp;/&nbsp; 共&nbsp;${ pageBean.totalPage }&nbsp;页&nbsp;&nbsp;
<c:if test="${ pageBean.currentPage != 1 }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=tea&currentPage=1">[首页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=tea&currentPage=${pageBean.currentPage -1}">[上一页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == 1 }">
[首页]
[上一页]
</c:if>
<c:if test="${ pageBean.currentPage != pageBean.totalPage }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=tea&currentPage=${pageBean.currentPage +1}">[下一页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=tea&currentPage=${pageBean.totalPage}">[末页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == pageBean.totalPage }">
[下一页]	
[末页]	
</c:if>
  
  
  
  
  
  </c:if>





					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

