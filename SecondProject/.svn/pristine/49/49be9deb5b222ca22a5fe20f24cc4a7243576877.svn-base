package com.qs.dao;

import java.util.List;

import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.Tea;
import com.qs.javabean.User;

public interface OrderDaoBack {



    //获取所有订单的数量
	int getorderform();
	//通过起始位置,拿到相应的得到订单的数据
	List<User> getorderformAndPage(int begin, int pageSize);
   //展示订单详情
	List<Orders> SeekService(String oid,String uid);
   //取消订单
	void CancleServlet(String oid);
     //查询多条件搜索是订单的数量
	int getTea(Tea tea);
   //多条件搜索,分页展示
	List<User> getTeaAndPage(Tea tea, int begin, int pageSize);
	int getproduct();
	//分页展示商品数量
	List<Product> getpageSizeAndPage(int begin, int pageSize);
	//查询商品信息.发送给编写页面
	Product getproquery(int pid);
	//编辑商品
	void poralter(Product p);

	

}
