<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/admin/product/add.jsp";
			}
			function bwj() 
			{ 
			    if(confirm('确定要执行此操作吗?')==true) { 
			        return true; 
			    } else{
			    	return false
			    	}
			    
			} 
		</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addProduct()">
							&#28155;&#21152;</button>

					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="18%">序号</td>
								<td align="center" width="17%">商品图片</td>
								<td align="center" width="17%">商品名称</td>
								<td align="center" width="17%">商品价格</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${pageBean.list}" var="p" varStatus="vs">
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="18%">${vs.count }</td>
								<td  width="60" width="40%" style="padding-left: 44px;padding-right: 42px;">
								<input type="hidden" name="id"value="22">
								 <img src="${ pageContext.request.contextPath }/${p.imagelist[0]}" width="70"
								height="60"></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="17%">${p.pname }</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="17%">${p.price }</td>
								<td align="center" style="HEIGHT: 22px"><a
									href="${ pageContext.request.contextPath }/backProductStrvlet?method=proquery&pid=${p.pid}">
										<img
										src="${pageContext.request.contextPath}/images/i_edit.gif"
										border="0" style="CURSOR: hand">
								</a></td>

								<td align="center" style="HEIGHT: 22px"><a
									href="${ pageContext.request.contextPath }/backProductStrvlet?method=prodelete&pid=${p.pid}&currentPage=${pageBean.currentPage}" onclick="bwj()">
										<img src="${pageContext.request.contextPath}/images/i_del.gif"
										width="16" height="16" border="0" style="CURSOR: hand">
								</a></td>
							</tr>
								</c:forEach>
						</table>
					</td>
				</tr>
               		<tr align="center" height="40">
					<td colspan="7">
<!-- 第 _ 页 / 共 _ 页     [首页] [上一页] [下一页] [末页]    -->
第&nbsp;${ pageBean.currentPage }&nbsp;页&nbsp;/&nbsp; 共&nbsp;${ pageBean.totalPage }&nbsp;页&nbsp;&nbsp;
<c:if test="${ pageBean.currentPage != 1 }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=product&currentPage=1">[首页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=product&currentPage=${pageBean.currentPage -1}">[上一页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == 1 }">
[首页]
[上一页]
</c:if>
<c:if test="${ pageBean.currentPage != pageBean.totalPage }">
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=product&currentPage=${pageBean.currentPage +1}">[下一页]</a>	
<a style="color:blue;" href="${pageContext.request.contextPath}/backProductStrvlet?method=product&currentPage=${pageBean.totalPage}">[末页]</a>	
</c:if>
<c:if test="${ pageBean.currentPage == pageBean.totalPage }">
[下一页]	
[末页]	
</c:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

