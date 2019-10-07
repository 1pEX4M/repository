package com.qs.service.impl;

import java.util.List;

import com.qs.dao.DeleteDao;
import com.qs.dao.OrderDaoBack;
import com.qs.dao.impl.DeleteDaoImpl;
import com.qs.dao.impl.OrderDaoImplBack;
import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.Tea;
import com.qs.javabean.User;
import com.qs.service.OrderServiceBack;
import com.qs.utils.PageBean;

/**bwj
 * @author HASEE
 *
 */
public class OrderServiceImplBack implements OrderServiceBack {

      
	@Override
	public PageBean orderform(int currentPage, int pageSize) {
		//健壮性判断
		if (currentPage<1) {
			currentPage=1;
		}
		if (pageSize<2) {
			pageSize=2;
		}
		//获取所有订单数量dao
		OrderDaoBack dao = new OrderDaoImplBack();
		int count = dao.getorderform();
		System.out.println(count);
		//得到总页数
		int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize+1;
		//健壮性判断,当前页不能为0
		if (currentPage >= totalPage&&totalPage>0) {
			currentPage = totalPage;
		}
		//得到获取数据时的起始位置
		int begin = (currentPage - 1 ) * pageSize;
		//通过起始位置,拿到相应的得到订单的数据
		List<User>list = dao.getorderformAndPage(begin,pageSize);
		System.out.println(list);
		//把数据封装到PageBean
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotalCount(count);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<Orders> SeekService(String oid,String uid) {
		OrderDaoBack dao = new OrderDaoImplBack();
		return dao.SeekService(oid,uid);
	}

	@Override
	public void CancleServlet(String oid) {
		OrderDaoBack dao = new OrderDaoImplBack();
		dao.CancleServlet(oid);
	}

	@Override
	public PageBean tea(Tea tea, int currentPage, int pageSize) {
		if (currentPage<1) {
			currentPage=1;
		}
		if (pageSize<2) {
			pageSize=2;
		}
		OrderDaoBack dao = new OrderDaoImplBack();
		int count = dao.getTea(tea);
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize+1;
		
		if (currentPage >= totalPage&&totalPage>0) {
			currentPage = totalPage;
		}
		int begin = (currentPage - 1 ) * pageSize;
		List<User>list = dao.getTeaAndPage(tea,begin,pageSize);
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotalCount(count);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean product(int currentPage, int pageSize) {
		if (currentPage<1) {
			currentPage=1;
		}
		if (pageSize<6) {
			pageSize=6;
		}
		//获取所有订单数量
		OrderDaoBack dao = new OrderDaoImplBack();
		int count = dao.getproduct();
		//得到总页数
		int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize+1;
		//健壮性判断,当前页不能为0
		if (currentPage >= totalPage&&totalPage>0) {
			currentPage = totalPage;
		}
		//得到获取数据时的起始位置
		int begin = (currentPage - 1 ) * pageSize;
		//通过起始位置,拿到相应的得到订单的数据
		List<Product>list = dao.getpageSizeAndPage(begin,pageSize);
		//把数据封装到PageBean
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotalCount(count);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void getProdeleteService(int pid) {
		DeleteDao dao = new DeleteDaoImpl();
		dao.getProdeleteService(pid);
	}

	@Override
	public void save(Product p) {
		DeleteDao dao = new DeleteDaoImpl();
		dao.save(p);
	}

	@Override
	public Product getproquery(int pid) {
		OrderDaoBack dao = new OrderDaoImplBack();
		return dao.getproquery(pid);
	}

	@Override
	public void poralter(Product p) {
		OrderDaoBack dao = new OrderDaoImplBack();
		dao.poralter(p);
	}

	

}
