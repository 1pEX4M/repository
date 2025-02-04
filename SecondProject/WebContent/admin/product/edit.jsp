<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
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
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/backProductStrvlet?method=poralter&pid=${product.pid}" method="post" enctype="multipart/form-data">
			
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑商品</STRONG>
						</strong>
					</td>
				</tr>

			
			<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="pname" value="${product.pname }" id="userAction_save_do_logonName" class="bg" onfocus="test(this)" />
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品颜色：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="color" value="${product.color }" onfocus="test(this)">
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="price" value="${product.price }" id="userAction_save_do_logonName" class="bg" onfocus="test(this)"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品尺码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="size" value=" ${product.size }"  id="userAction_save_do_logonName" class="bg" onfocus="test(this)"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="file" name="Pimage" />
					</td>
					   	<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品库存：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="count" value="${product.count }" id="userAction_save_do_logonName" class="bg" onfocus="test(this)"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属分类：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="cid">
							<option value="">--请选择--</option>
							<c:forEach items="${categorylist }" var="c">
							<c:if test="${c.parentId != 0 }">
							<option value="${c.cid }">${ c.cname}</option>
							</c:if>				
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="pdesc"  rows="5" cols="30"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>