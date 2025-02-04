package com.qs.web.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qs.javabean.Cart;
import com.qs.javabean.CartItem;
import com.qs.javabean.OrderItem;
import com.qs.javabean.Orders;
import com.qs.javabean.ShippingAddress;
import com.qs.javabean.User;
import com.qs.service.OrderService;
import com.qs.service.impl.OrderServiceImpl;
import com.qs.utils.BaseServlet;
import com.qs.utils.PageBean;
import com.qs.utils.UUIDUtils;

public class OrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	private OrderService orderService = new OrderServiceImpl();

	/**
	 * 添加订单 用session中的购物车生成订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.从session中得到cart 2.使用cart生成Order对象 3.调用service方法完成添加订单
		 * 4.保存order到request中，转发到/jsps/order/desc.jsp
		 */
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		User user = (User) request.getSession().getAttribute("existUser");
		String aid = request.getParameter("aid");
		//System.out.println(aid);
		
		/*
		 * 2. 使用cart生成Order对象 并手动生成cart中没有的(order中需要的)相关属性
		 * 
		 * Cart --> Order
		 * 
		 */
		ShippingAddress address = orderService.getadd(aid);
		//System.out.println(address);
		request.getSession().setAttribute("address", address);
		
		Orders order = new Orders();
		order.setAname(address.getUsername());
		order.setAddress(address.getAddress());
		order.setTelephone(address.getTelephone());
		order.setOid(UUIDUtils.getUUID()); // 设置订单编号
		order.setOrdertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); // 设置下单时间（使用当前系统时间）
		order.setState(1); // 设置状态为1，表示未付款
		// 得到当前用户，设置订单所有者
		
		//System.out.println(user);
		//User user = new User();
		//user.setUid("11");
		order.setUser(user); // 设置订单所有者
		order.setTotal(cart.getTotalprice()); // 设置订单合计，从cart中获取

		// 创建订单条目(集合)
		// cartItemList --> orderItemList
		Collection<CartItem> cartItems = cart.getCartItems();
		
		
		//List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		// 需要通过遍历cart条目，对每个订单条目属性赋值)
		for (CartItem cartItem : cartItems) {
			//System.out.println(cartItem.getCountss());
			OrderItem oi = new OrderItem(); // 创建订单条目

			oi.setItemid(UUIDUtils.getUUID()); // 设置条目ID
			oi.setCounts(cartItem.getCountss()); // 设置条目数量
			oi.setProduct(cartItem.getProduct()); // 设置条目的图书
			oi.setSubtotal(cartItem.getSubtotal()); // 设置小计
			oi.setOrder(order); // 设置所属订单
			oi.setShop_price(cartItem.getSubtotal1());
			order.getOrderItems().add(oi); // 把订单条目添加到订单条目集合中
		}
		// 把所有订单条目添加到订单中
		
		// 清空购物车
		cart.clear();

		/*
		 * 3.调用orderService完成添加订单
		 */
		orderService.add(order);

		// 4.保存order到request域，转发
		request.setAttribute("order", order);

		return request.getContextPath() + "/orderServlet?method=myOrders&currentPage=1&uid=" + user.getUid();
	}

	/**
	 * 我的订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.从session中得到当前用户. 2.使用当前用户uid调用orderService#myOrders(uid),
		 * --得到该用户的所有订单List<Order> 3.把订单列表保存到request域中 4.转发到/jsps/order/list.jsp
		 */
		// 得到当前用户
		User user = (User) request.getSession().getAttribute("existUser");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageSize = 4;

		//User user = new User();
		//user.setUid("11");
		
		// 得到该用户的所有订单List<Order>
		PageBean orderList = orderService.myOrders(user.getUid(),currentPage,pageSize);
		
		

		// 把订单列表保存到request域中,并转发
		request.setAttribute("orderList", orderList);
		
		//待付款订单
		List<Orders> orderList1 = orderService.myOrders(user.getUid(),1);
		request.setAttribute("orderList1", orderList1);
		//待发货
		List<Orders> orderList2 = orderService.myOrders(user.getUid(),2);
		request.setAttribute("orderList2", orderList2);
		//待收货
		List<Orders> orderList3 = orderService.myOrders(user.getUid(),3);
		request.setAttribute("orderList3", orderList3);
		//待评价
		List<Orders> orderList4 = orderService.myOrders(user.getUid(),4);
		request.setAttribute("orderList4", orderList4);
		return "/udai_order.jsp";
	}

	/**
	 * 加载订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.得到oid参数 2.使用oid调用service方法得到Order 3.保存Order到request，转发
		 */
		String oid = request.getParameter("oid");
		request.setAttribute("order", orderService.load(oid));
		return "/udai_order_detail.jsp";
		
	}
	
	public String load1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.得到oid参数 2.使用oid调用service方法得到Order 3.保存Order到request，转发
		 */
		String oid = request.getParameter("oid");
		request.setAttribute("order", orderService.load1(oid));
		System.out.println(orderService.load1(oid));
		return "/udai_order_receipted.jsp";
		
	}
	
	/**
	 * 取消订单功能
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String cancleOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("existUser");
		//得到oid
		//User user = new User();
		//user.setUid("11");
		String oid = request.getParameter("oid");
		//System.out.println(oid);
		OrderService service = new OrderServiceImpl();
		service.cancleOrder(oid);
		
		//订单取消后要跳转到我的订单列表
		return request.getContextPath() + "/orderServlet?method=myOrders&currentPage=1&uid=" + user.getUid();	
	}
	
	/**
	 * 发货功能
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */

	/**
	 * 确认收货
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String confirm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.获取oid参数 2.调用service方法 异常：保存异常信息，转发到msg.jsp 3.保存成功信息，转发到msg.jsp
		 */
		User user = (User) request.getSession().getAttribute("existUser");
		String oid = request.getParameter("oid");

		orderService.confirm(oid);
		request.setAttribute("msg", "恭喜！确认完成，交易成功");

		return request.getContextPath() + "/orderServlet?method=myOrders&currentPage=1&uid=" + user.getUid();
	}
	
	//删除订单
	public String del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		User user = (User) request.getSession().getAttribute("existUser");
		orderService.del(oid);
		
		
		return request.getContextPath() + "/orderServlet?method=myOrders&currentPage=1&uid=" + user.getUid();
	
	}

}
