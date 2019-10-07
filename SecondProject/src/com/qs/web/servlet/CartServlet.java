package com.qs.web.servlet;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qs.javabean.Cart;
import com.qs.javabean.CartItem;
import com.qs.javabean.Product;
import com.qs.javabean.ShippingAddress;
import com.qs.javabean.User;
import com.qs.service.CartService;
import com.qs.service.ProductService;
import com.qs.service.impl.CartServiceImpl;
import com.qs.service.impl.ProductServiceImpl;
import com.qs.utils.BaseServlet;
import com.qs.utils.UUIDUtils;

public class CartServlet extends BaseServlet {
	
	public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		// 从session域中获得用户信息
		User existuser = (User) request.getSession().getAttribute("existUser");
		String uid = existuser.getUid();
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("countss"));
		ProductService service = new ProductServiceImpl();
		Product product = service.getProductByPid(pid);
		String[] split = product.getPimage().split(",");
		product.setImagelist(Arrays.asList(split));
		CartItem cartItem = new CartItem();
		cartItem.setCountss(count);
		cartItem.setProduct(product);
		cart.add(cartItem);
		// 保存商品到数据库
		CartService service1 = new CartServiceImpl();
		service1.saveProduct(uid,pid,count);
		cart.setOrdertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		cart.setOid(UUIDUtils.getUUID());
		return request.getContextPath() + "/udai_shopcart.jsp";
	}
	
	public String delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		int pid = Integer.parseInt(request.getParameter("pid"));
		cart.remove(pid);
		return request.getContextPath() + "/udai_shopcart.jsp";
	}

	public String clear(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		cart.clear();
		return request.getContextPath() + "/udai_shopcart.jsp";
	}
	
	public String putIn(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		CartService service = new CartServiceImpl();
		List<ShippingAddress> list = service.getAddress();
		request.getSession().setAttribute("addresslist", list);
		return request.getContextPath() + "/udai_shopcart_pay.jsp";
	}
	
	
	public String saveAddress(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("existUser");
		String uid = user.getUid();
		String username = request.getParameter("username");
		String specific = request.getParameter("specific");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String area = request.getParameter("area");
		String town = request.getParameter("town");
		String address = province+city+area+town+specific;
		String phone = request.getParameter("phone");
		String telephone = request.getParameter("telephone");
		CartService service = new CartServiceImpl();
		System.out.println(""+username+address+phone+telephone+uid);
		service.saveAddress(username,address,phone,telephone,uid);
		List<ShippingAddress> list = service.getAddress();
		request.getSession().setAttribute("addresslist", list);
		return request.getContextPath() + "/udai_shopcart_pay.jsp";
	}
}
