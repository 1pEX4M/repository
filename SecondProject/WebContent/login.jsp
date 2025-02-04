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
	<link rel="stylesheet" href="css/login.css">
	<script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="js/jquery.form.js" charset="UTF-8"></script>
	<script src="js/global.js" charset="UTF-8"></script>
	<script src="js/login.js" charset="UTF-8"></script>
	<title>U袋网 - 登录 / 注册</title>
	<script type="text/javascript" >
	$(function(){
		$("#register_username").blur(function(){
			// 获得文本框的值:
			var username = $(this).val();
			// 演示load方法:
			// $("#s1").load("/day15/ServletDemo3",{"username":username});
			// 演示get/post方法:
			$.get("${pageContext.request.contextPath}/registServlet",{"username":username},function(data){
				if(data == 1){
					$("#s1").html("<font color='green'>√</font>");
					
				}else if(data == 2){
					$("#s1").html("<font color='red'>×用户名已存在</font>");
					
				}else if( data==3){
					$("#s1").html("<font color='red'>×用户名不能为空</font>");
					
				}
			});
		});
		
		$("#mm2").change(function(){
			
			
			if($("#register_pwd").val()!=$("#mm2").val()){
				$("#mm2MSG").html("<font color='red'>×两次密码输入不一致</font>");
			}else{
				
				$("#mm2MSG").html("√");
			}
		});
	}); 
	
	
	
	
	</script>
</head>
<body>
<%
   //从请求域中得到信息
   	String msg=(String)request.getAttribute("msg");
	String goLogin=(String)request.getAttribute("goLogin");
    
%>
	<div class="public-head-layout container">
		<a class="logo" href="index.jsp"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
	</div>
	<div style="background:url(images/login_bg.jpg) no-repeat center center; ">
		<div class="login-layout container">
			<div class="form-box login">
				<div class="tabs-nav">
					<h2 style="color:red"><%= goLogin==null? "":goLogin %></h2>
					<h2>欢迎登录U袋网平台</h2>
				</div>
				<div class="tabs_container">
				<h6 style="color:red"><%= msg==null? "":msg %></h6>
				
	<!-- 登陆 -->
					<form class="tabs_form" action="${ pageContext.request.contextPath}/userServlet?method=login" method="post" id="login_form">
					<!-- 想要在浏览器端获取数据，但是又不能显示出来，就可以使用表单中input的type=hidden -->
					
						<input type="hidden" name="method" value="login"/>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									
								</div>
								<input class="form-control phone" name="username" id="login_username" required placeholder="用户名" maxlength="11" autocomplete="off" type="text">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input class="form-control password" name="password" id="login_pwd" placeholder="请输入密码" autocomplete="off" type="password">
								<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
							</div>
						</div>
						
						<div class="checkbox">
	                        <label>
	                        	<input checked id="login_checkbox" type="checkbox"><i></i> 30天内免登录
	                        </label>
	                        <a href="javascript:;" class="pull-right" id="resetpwd">忘记密码？</a>
	                    </div>
	                    <!-- 错误信息 -->
						<div class="form-group">
							<div class="error_msg" id="login_error">
								<!-- 错误信息 范例html
								<div class="alert alert-warning alert-dismissible fade in" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>密码错误</strong> 请重新输入密码
								</div>
								 -->
							</div>
						</div>
	                    <button class="btn btn-large btn-primary btn-lg btn-block submit" id="login_submit" type="submit">登录</button><br>
	                    <p class="text-center">没有账号？<a href="javascript:;" id="register">免费注册</a></p>
                    </form>
                    <div class="tabs_div">
	                    <div class="success-box">
	                    	<div class="success-msg">
								<i class="success-icon"></i>
	                    		<p class="success-text">登录成功</p>
	                    	</div>
	                    </div>
	                    <div class="option-box">
	                    	<div class="buts-title">
	                    		现在您可以
	                    	</div>
	                    	<div class="buts-box">
	                    		<a role="button" href="index.jsp" class="btn btn-block btn-lg btn-default">继续访问商城</a>
								<a role="button" href="udai_welcome.jsp" class="btn btn-block btn-lg btn-info">登录会员中心</a>
	                    	</div>
	                    </div>
                    </div>
                </div>
			</div>
			
			
			<div class="form-box register">
  				<div class="tabs-nav">
  					<h2>欢迎注册<a href="javascript:;" class="pull-right fz16" id="reglogin">返回登录</a></h2>
  				</div>
  				<div class="tabs_container">
					<form class="tabs_form" action="${pageContext.request.contextPath }/userServlet?method=regist" method="post" id="register_form">
					    <input type="hidden" name="method" value="regist"/>
					    <div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									
								</div>
								<input class="form-control username" name="username"  id="register_username" required placeholder="用户名" maxlength="11" autocomplete="off" type="text">
							</div><span id="s1"></span><br />
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input class="form-control password" name="password" id="register_pwd" placeholder="请输入密码" autocomplete="off" type="password" required >
								<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
							</div>
						</div><span ><label style="color:red;"></label><font id="passwordMSG"></font></span><br />
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input class="form-control password1" name="password1" id="mm2" placeholder="确认密码" autocomplete="off" type="password" required >
								<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
								
							</div>
						</div><span><label style="color:red"></label><font id="mm2MSG"></font></span><br>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								</div>
								<input class="form-control phone" name="telephone" id="register_phone" required placeholder="手机号" maxlength="11" autocomplete="off" type="text" required >
							</div><span ><label style="color:red;"></label><font id="phoneMSG"></font></span><br />
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									
								</div>
								<input class="form-control email" name="email" id="register_username" required placeholder="邮箱" maxlength="20" autocomplete="off" type="text" required ">
							</div><span ><label style="color:red;"></label><font id="emailMSG"></font></span><br />
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									
								</div>
								<input class="form-control nickname" name="nickname" id="register_username" required placeholder="昵称" maxlength="11" autocomplete="off" type="text">
							</div>
						</div>
						
						<div class="checkbox">
	                        <label>
	                        	<input checked id="register_checkbox" type="checkbox"><i></i> 同意<a href="temp_article/udai_article3.jsp">U袋网用户协议</a>
	                        </label>
	                    </div>
	                    <!-- 错误信息 -->
						<div class="form-group">
							<div class="error_msg" id="register_error"></div>
						</div>
	                    <button class="btn btn-large btn-primary btn-lg btn-block submit" id="register_submit" type="submit">注册</button>
                    </form>
                    <div class="tabs_div">
	                    <div class="success-box">
	                    	<div class="success-msg">
								<i class="success-icon"></i>
	                    		<p class="success-text">注册成功</p>
	                    	</div>
	                    </div>
	                    <div class="option-box">
	                    	<div class="buts-title">
	                    		现在您可以
	                    	</div>
	                    	<div class="buts-box">
	                    		<a role="button" href="index.jsp" class="btn btn-block btn-lg btn-default">继续访问商城</a>
								<a role="button" href="udai_welcome.jsp" class="btn btn-block btn-lg btn-info">登录会员中心</a>
	                    	</div>
	                    </div>
                    </div>
                </div>
			</div>
			<div class="form-box resetpwd">
  				<div class="tabs-nav clearfix">
  					<h2>找回密码<a href="javascript:;" class="pull-right fz16" id="pwdlogin">返回登录</a></h2>
  				</div>
  				<div class="tabs_container">
					<form class="tabs_form" action="https://rpg.blue/member.php?mod=logging&action=login" method="post" id="resetpwd_form">
					<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									
								</div>
								<input class="form-control username" name="username" onblur="checkUsername(this.value)" id="register_username" required placeholder="用户名" maxlength="11" autocomplete="off" type="text">
							</div><span></span><br />
						</div>
						<div class="form-group">
							<div class="input-group">
							
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								</div>
								<input class="form-control phone" name="phone" id="resetpwd_phone" required placeholder="手机号" maxlength="11" autocomplete="off" type="text">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" name="sms" id="resetpwd_sms" placeholder="输入验证码" type="text">
								<span class="input-group-btn">
									<button class="btn btn-primary getsms" type="button">发送短信验证码</button>
								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input class="form-control password" name="password" id="resetpwd_pwd" placeholder="新的密码" autocomplete="off" type="password">
								<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
							</div>
						</div>
	                    <!-- 错误信息 -->
						<div class="form-group">
							<div class="error_msg" id="resetpwd_error"></div>
						</div>
	                    <button class="btn btn-large btn-primary btn-lg btn-block submit" id="resetpwd_submit" type="button">重置密码</button>
                    </form>
                    <div class="tabs_div">
	                    <div class="success-box">
	                    	<div class="success-msg">
								<i class="success-icon"></i>
	                    		<p class="success-text">密码重置成功</p>
	                    	</div>
	                    </div>
	                    <div class="option-box">
	                    	<div class="buts-title">
	                    		现在您可以
	                    	</div>
	                    	<div class="buts-box">
	                    		<a role="button" href="index.jsp" class="btn btn-block btn-lg btn-default">继续访问商城</a>
								<a role="button" href="login.jsp" class="btn btn-block btn-lg btn-info">返回登陆</a>
	                    	</div>
	                    </div>
                    </div>
                </div>
			</div>
			<script>
				$(document).ready(function() {
					// 判断直接进入哪个页面 例如 login.php?p=register
					switch($.getUrlParam('p')) {
						case 'register': $('.register').show(); break;
						case 'resetpwd': $('.resetpwd').show(); break;
						default: $('.login').show();
					};
					// 发送验证码事件
					$('.getsms').click(function() {
						var phone = $(this).parents('form').find('input.phone');
						var error = $(this).parents('form').find('.error_msg');
						switch(phone.validatemobile()) {
							case 0:
								// 短信验证码的php请求
								error.jsp(msgtemp('验证码 <strong>已发送</strong>','alert-success'));
								$(this).rewire(60);
							break;
							case 1: error.jsp(msgtemp('<strong>手机号码为空</strong> 请输入手机号码',    'alert-warning')); break;
							case 2: error.jsp(msgtemp('<strong>手机号码错误</strong> 请输入11位数的号码','alert-warning')); break;
							case 3: error.jsp(msgtemp('<strong>手机号码错误</strong> 请输入正确的号码',  'alert-warning')); break;
						}
					});
					// 以下确定按钮仅供参考
					$('.submit').click(function() {
						var form = $(this).parents('form')
						var phone = form.find('input.phone');
						var pwd = form.find('input.password');
						var error = form.find('.error_msg');
						var success = form.siblings('.tabs_div');
						var options = {
							beforeSubmit: function () {
								console.log('喵喵喵')
							},
							success: function (data) {
								console.log(data)
							}
						}
						// 验证手机号参考这个
						switch(phone.validatemobile()) {
							case 1: error.jsp(msgtemp('<strong>手机号码为空</strong> 请输入手机号码',    'alert-warning')); return; break;
							case 2: error.jsp(msgtemp('<strong>手机号码错误</strong> 请输入11位数的号码','alert-warning')); return; break;
							case 3: error.jsp(msgtemp('<strong>手机号码错误</strong> 请输入正确的号码',  'alert-warning')); return; break;
						}
						// 验证密码复杂度参考这个
						switch(pwd.validatepwd()) {
							case 1: error.jsp(msgtemp('<strong>密码不能为空</strong> 请输入密码',    'alert-warning')); return; break;
							case 2: error.jsp(msgtemp('<strong>密码过短</strong> 请输入6位以上的密码','alert-warning')); return; break;
							case 3: error.jsp(msgtemp('<strong>密码过于简单</strong><br>密码需为字母、数字或特殊字符组合',  'alert-warning')); return; break;
						}
						form.ajaxForm(options);
						// 请求成功执行类似这样的事件
						// form.fadeOut(150,function() {
						// 	success.fadeIn(150);
						// });
					})
				});
			</script>
		</div>
	</div>
	<div class="footer-login container clearfix">
		<ul class="links">
			<a href=""><li>网店代销</li></a>
			<a href=""><li>U袋学堂</li></a>
			<a href=""><li>联系我们</li></a>
			<a href=""><li>企业简介</li></a>
			<a href=""><li>新手上路</li></a>
		</ul>
		<!-- 版权 -->
		<p class="copyright">
			© 2005-2017 U袋网 版权所有，并保留所有权利<br>
			ICP备案证书号：闽ICP备16015525号-2&nbsp;&nbsp;&nbsp;&nbsp;福建省宁德市福鼎市南下村小区（锦昌阁）1栋1梯602室&nbsp;&nbsp;&nbsp;&nbsp;Tel: 18650406668&nbsp;&nbsp;&nbsp;&nbsp;E-mail: 18650406668@qq.com
		</p>
	</div>
</body>
</html>