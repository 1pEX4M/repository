package com.qs.service;

import java.util.List;

import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.Tea;
import com.qs.utils.PageBean;
 
/**bwj
 * @author HASEE
 *
 */
public interface OrderServiceBack {

   //查看所有订单,分页展示
	PageBean orderform(int currentPage, int pageSize);
      //展示订单详情
	List<Orders> SeekService(String oid,String uid);
     //取消订单
	void CancleServlet(String oid);
   //多条件搜索,分页展示
	PageBean tea(Tea tea, int currentPage, int pageSize);
	//商品分页展示
	PageBean product(int currentPage, int pageSize);
	//商品删除
	void getProdeleteService(int pid);
	//商品添加
	void save(Product p);
	//查询商品信息,发送给编辑页面
	Product getproquery(int pid);
	//编辑页面
	void poralter(Product p);





}
