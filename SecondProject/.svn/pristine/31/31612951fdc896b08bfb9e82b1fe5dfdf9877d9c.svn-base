package com.qs.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {

	public static void sendMail(String email, String emailMsg)
			throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();
		// POP3   邮件传输协议 3
		// SMTP   简单的邮件传输协议
		/* 
		 * 1、首先要指定发送邮件的服务器
		 * 2、指定接收邮件的客户邮件地址  eee@qq.com
		 * 3、发送的内容
		 */
		props.setProperty("mail.transport.protocol", "SMTP");
		props.setProperty("mail.host", "smtp.163.com");
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
												//发送者帐号			授权码
				return new PasswordAuthentication("cx197603", "cx197603");
			}
		};

		Session session = Session.getInstance(props, auth);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);

		message.setFrom(new InternetAddress("cx197603@163.com")); // 设置发送者

		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

		message.setSubject("用户激活"); // 邮件标题
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");
		// 设置邮件内容
		/* 
		 * 恭喜您注册成功，请点击下面链接激活帐号： 
		 * <a href="http://192.168.1.51:8083/userServlet?method=active&code="+user.getCode()>激活链接</a>
		 */
		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送
		Transport.send(message);
	}
}
