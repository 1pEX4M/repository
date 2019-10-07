package com.qs.web.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.qs.javabean.Condition;
import com.qs.javabean.PageBean;
import com.qs.javabean.Product;
import com.qs.service.ProductService;
import com.qs.service.impl.ProductServiceImpl;
import com.qs.utils.BaseServlet;

public class ProductServlet extends BaseServlet {


	public String getProductByPid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		System.out.println(pid);
		ProductService service = new ProductServiceImpl();
		Product product = service.getProductByPid(pid);
		double a = product.getPrice()*0.8;
		DecimalFormat myformat = new  DecimalFormat("#####0.00");
		String price = myformat.format(a);
		String pic[] = product.getPimage().split(",");
		product.setImagelist(Arrays.asList(pic));
		String[] color = product.getColor().split(",");
		if (product.getSize() != null) {
			
			String[] size = product.getSize().split(",");
			product.setSizelist(Arrays.asList(size));
		}
		product.setColorlist(Arrays.asList(color));
		
			
		
		request.setAttribute("product", product);
		request.setAttribute("price", price);
		
		
		return "/item_show.jsp";
		
	}
	public String getProductListByCondition( HttpServletRequest request, HttpServletResponse response){
		 //获取条件
		
		
		String currPage= request.getParameter("currentPage");
		Integer currentPage = 0;
		if(currPage != null && !"".equals(currPage)){
			currentPage = Integer.parseInt(currPage);
		}		
		Integer pageSize = 12;
		
		
		
		Condition c  =  (Condition) request.getSession().getAttribute("condition");
		if(c==null){
			
			String  cid   = request.getParameter("cid");
			String  cname =request.getParameter("cname");
			String  size = request.getParameter("size");
			String color = request.getParameter("color");
			String minPrice = request.getParameter("minPrice");
			String maxPrice = request.getParameter("maxPrice");
			c = new Condition();			
			Map map = new HashMap();
			map.put("cid",cid);
			map.put("cname", cname);
			map.put("size", size);
			map.put("color", color);
			map.put("minPrice", minPrice);
			map.put("maxPrice", maxPrice);
			try {
				BeanUtils.populate(c, map);
				request.getSession().setAttribute("condition", c);
			
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
		}else{
			//条件不等于空，说明不是第一次点进来
				String  cname =c.getCname();
				String  size = c.getSize();
				String color = c.getColor();
				Double minPrice = c.getMinPrice();
				Double maxPrice = c.getMaxPrice();
				String  cid   = c.getCid();
				
				String  cid1 =request.getParameter("cid");
				if(cid1!=null){
					cid=cid1;
				}
				String  cname1 =request.getParameter("cname");
				if(cname1!=null){
					cname=cname1;
				}
				String  size1 =request.getParameter("size");
				if(size1!=null){
					size=size1;
				}
				String  color1 =request.getParameter("color");
				if(color1!=null){
					color=color1;
				}
				String  minPrice1 =request.getParameter("minPrice");
				if(minPrice1!=null){
					minPrice=Double.valueOf(minPrice1);
				}
				String  maxPrice1 =request.getParameter("maxPrice");
				if(maxPrice1!=null){
					maxPrice=Double.valueOf(maxPrice1);
				}
				Map map = new HashMap();
				map.put("cname", cname);
				map.put("size", size);
				map.put("color", color);
				map.put("minPrice", minPrice);
				map.put("maxPrice", maxPrice);
				map.put("cid", cid);
				try {
					BeanUtils.populate(c, map);
					request.getSession().setAttribute("condition", c);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				} 
			
		}
		ProductService service = new ProductServiceImpl();
		PageBean pageBean =service.getProductListByCondition(c, currentPage, pageSize);
		request.setAttribute("pageBean", pageBean);		
		return "/item_category.jsp";
	}
	

}
