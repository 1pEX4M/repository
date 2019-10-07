package com.qs.web.listener;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.qs.javabean.Cart;
import com.qs.javabean.Category;
import com.qs.javabean.News;
import com.qs.javabean.Product;
import com.qs.javabean.User;
import com.qs.service.NewsService;
import com.qs.service.ProductService;
import com.qs.service.UserService;
import com.qs.service.impl.NewsServiceImpl;
import com.qs.service.impl.ProductServiceImpl;
import com.qs.service.impl.UserServiceImpl;


public class MyServletContextListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent event)  { 
    }

    public void contextInitialized(ServletContextEvent event)  {
    	// 1. 监听用户是否成功登录
		User existUser = (User) event.getServletContext().getAttribute("existUser");
		
		if(existUser != null){
			// 用户登录成功,则根据用户uid去查找用户之前是否有添加过购物车历史记录
			UserService service = new UserServiceImpl();
			
			Cart cart = service.getCart(existUser.getUid());
			
			// 3.购物不为空   ,  则将购物车加载到session域中
			if(cart != null){
				// 2.将得到的cart集合添加到context 
				event.getServletContext().setAttribute("cart", cart);
				}
			
			}else{
			}
    	/* (non-Javadoc)
    	 */
    	NewsService service1 = new NewsServiceImpl();
    	List<News> news = service1.getAllNews();
    	event.getServletContext().setAttribute("news", news);
    	
    	ProductService service = new ProductServiceImpl();
    	List<Category> category = service.getAllCategory();
    	List<Product> product = service.getAllProduct();
    	for (Product product2 : product) {
			String pic[] = product2.getPimage().split(",");
			product2.setImagelist(Arrays.asList(pic));
			
		}
//    	鎶婂晢鍝佷俊鎭拰鍒嗙被淇℃伅瀛樺叆ServlertContext 鍩熶腑
    	event.getServletContext().setAttribute("productlist", product);
    	event.getServletContext().setAttribute("categorylist", category);
    }
	
}
