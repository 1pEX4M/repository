package com.qs.web.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.qs.javabean.Category;
import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.Tea;
import com.qs.service.AddBackService;
import com.qs.service.AlterBackService;
import com.qs.service.ClassifyBackProductService;
import com.qs.service.DeleteBackService;
import com.qs.service.GainBackService;
import com.qs.service.OrderService;
import com.qs.service.OrderServiceBack;
import com.qs.service.impl.AddBackServiceImpl;
import com.qs.service.impl.AlterBackServiceImpl;
import com.qs.service.impl.ClassifyBackProductServiceImpl;
import com.qs.service.impl.DeleteBackServiceImpl;
import com.qs.service.impl.GainBackServiceImpl;
import com.qs.service.impl.OrderServiceImpl;
import com.qs.service.impl.OrderServiceImplBack;
import com.qs.utils.BaseServlet;
import com.qs.utils.PageBean;

/**bwj
 * @author HASEE
 *
 */
public class BackProductStrvlet extends BaseServlet {
	public String register(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		System.out.println(username);
		if (username.equals("zhangsan")&&password.equals("123")) {
			return request.getContextPath()+"/admin/home.jsp";
		}else{
			request.setAttribute("msa", "账号或密码错误");
			return "/admin/index.jsp";
		}
	}
	//修改商品
	public String poralter(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		  //得到磁盘文件项工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//创建核心解析类
		ServletFileUpload fileUpload =  new ServletFileUpload(factory);
		Map<String, String>map = new HashMap<>();
		Product p = new Product();
		String pids= request.getParameter("pid");
		 int pid = Integer.parseInt(pids);
		System.out.println(pid);
		//解析请求
		try {
			List<FileItem> list = fileUpload.parseRequest(request);
			for (FileItem fileItem : list) {
				//判断是普通项还是文件项
				if (fileItem.isFormField()) {
					map.put(fileItem.getFieldName(), fileItem.getString("utf-8")); 
				}else {
					//创建输入流
					InputStream in = fileItem.getInputStream();
					//存放在本地磁盘
					FileOutputStream fos = new FileOutputStream("d:/upload/"+fileItem.getName());
					//设置缓冲区
				    byte[] b= new byte[8192];
				    int len= 0 ;
				    while ((len=in.read(b)) != -1) {
						fos.write(b,0,len);
					}
				    in.close();
				    fos.close();
				    p.setPimage("/upload/"+fileItem.getName());
				}
			}
			BeanUtils.populate(p, map); 
			p.setPid(pid);
			System.out.println(p);
			//创建类和方法
			 OrderServiceBack service = new OrderServiceImplBack();
			 service.poralter(p);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return request.getContextPath()+"/backProductStrvlet?method=product&currentPage=1";
	}
	//通过pid查询,把商品信息传送到编辑页面
	public String proquery(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 String pids= request.getParameter("pid");
		 int pid = Integer.parseInt(pids);
		 OrderServiceBack service = new OrderServiceImplBack();
		 Product product=service.getproquery(pid);
		 request.setAttribute("product", product);
		return "/admin/product/edit.jsp";
	}
	//商品添加
	public String proadd(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	    //得到磁盘文件项工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//创建核心解析类
			ServletFileUpload fileUpload =  new ServletFileUpload(factory);
			Map<String, String>map = new HashMap<>();
			Product p = new Product();
			//解析请求
			try {
				List<FileItem> list = fileUpload.parseRequest(request);
				for (FileItem fileItem : list) {
					//判断是普通项还是文件项
					if (fileItem.isFormField()) {
						map.put(fileItem.getFieldName(), fileItem.getString("utf-8")); 
					}else {
						//创建输入流
						InputStream in = fileItem.getInputStream();
						//存放在本地磁盘
						FileOutputStream fos = new FileOutputStream("d:/upload/"+fileItem.getName());
						//设置缓冲区
					    byte[] b= new byte[8192];
					    int len= 0 ;
					    while ((len=in.read(b)) != -1) {
							fos.write(b,0,len);
						}
					    in.close();
					    fos.close();
					    p.setPimage("/upload/"+fileItem.getName());
					}
				}
				BeanUtils.populate(p, map); 
				//创建类和方法
				 OrderServiceBack service = new OrderServiceImplBack();
				 service.save(p);
				//重定向
				 
			} catch (Exception e) {
				e.printStackTrace();
			}
			return request.getContextPath()+"/backProductStrvlet?method=product&currentPage=1";
			
		}

	
	//商品删除
	public String prodelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String pids= request.getParameter("pid");
		String currentPage = request.getParameter("currentPage");	
		 OrderServiceBack service = new OrderServiceImplBack();
		 int pid = Integer.parseInt(pids);
		 System.out.println(pid);
		 service.getProdeleteService(pid);
	   return request.getContextPath()+"/backProductStrvlet?method=product&currentPage="+currentPage;
	}
 //商品展示
	public String product(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 int currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		 int pageSize = 6;
		 OrderServiceBack service = new OrderServiceImplBack();
		  PageBean pageBean=service.product(currentPage,pageSize); 
	      request.setAttribute("pageBean", pageBean);
		  return  "/admin/product/list.jsp";
	}
	//商品分类展示
	public String classify(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		ClassifyBackProductService service = new ClassifyBackProductServiceImpl();
		List<Category> list = service.getClassifyService();
		if (list != null && !"".equals(list)) {
			request.setAttribute("list", list);
		}
		return "/admin/category/list.jsp";
	}
	
	//删除
	public String delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	 String cids= request.getParameter("cid");
	 DeleteBackService service = new DeleteBackServiceImpl();
	 int cid = Integer.parseInt(cids);
	 service.getDeleteService(cid);
	return request.getContextPath()+"/backProductStrvlet?method=classify";
	}
	
	//添加
	public String add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String cname = request.getParameter("cname");
        AddBackService service= new AddBackServiceImpl();
        service.getAddService(cname);
		return request.getContextPath()+"/backProductStrvlet?method=classify";
	}
	//修改商品分类,获取商品分类信息
	public String gain(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 String cids= request.getParameter("cid");
		 int cid = Integer.parseInt(cids);
		 GainBackService service = new GainBackServiceImpl();
		 Category list=service.getGainService(cid);
		 if (list != null && !"".equals(list)) {
				request.setAttribute("list", list);				
			}
		return "/admin/category/edit.jsp";
	}
	//修改商品信息
	public String alter(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String cname = request.getParameter("cname");
		String cids = request.getParameter("cid");
		int cid = Integer.parseInt(cids);
		AlterBackService service = new AlterBackServiceImpl();
		service.getAlterService(cid,cname);
		return request.getContextPath()+"/backProductStrvlet?method=classify";
	}
	//订单
	public String orderform(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		int pageSize = 2;
		OrderServiceBack service = new OrderServiceImplBack();
	   PageBean pageBean=service.orderform(currentPage,pageSize); 
       request.setAttribute("pageBean", pageBean);
		return  "/admin/orderform/list.jsp";
      //return null;
	}
	//查看订单详细信息
	public String seek(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String oid = request.getParameter("oid");
		String uid = request.getParameter("uid");
	    OrderServiceBack service = new OrderServiceImplBack();
		List<Orders> orders=service.SeekService(oid,uid);	
		request.setAttribute("orders", orders);
		return "/admin/orderform/order_info.jsp";
      
	}
	//取消订单
	public String cancle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String oid = request.getParameter("oid");
		String currentPage = request.getParameter("currentPage");		
		 OrderServiceBack service = new OrderServiceImplBack();
		 service.CancleServlet(oid);
		 //跳转到取消订单的当前页
		 return request.getContextPath()+"/backProductStrvlet?method=orderform&currentPage="+currentPage;
	}
	//分页搜索
	public String tea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	   Tea tea = (Tea) request.getSession().getAttribute("tea");
		if (tea == null) {
			 tea = new Tea();
			 try {
				BeanUtils.populate(tea, request.getParameterMap());
			} catch (Exception e) {
				e.printStackTrace();
			}
			 request.getSession().setAttribute("tea", tea);
			 System.out.println("第一次"+tea);
		}else{
			try {
				BeanUtils.populate(tea, request.getParameterMap());
				System.out.println("第n次"+tea);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		
			String currentPages = request.getParameter("currentPage");
			int currentPage = Integer.parseInt(currentPages);
			int pageSize = 2;
			 OrderServiceBack service = new OrderServiceImplBack();
			 PageBean pageBean=service.tea(tea,currentPage,pageSize); 
			 request.setAttribute("pageBean", pageBean);
			 //在搜索框展示客户输入的信息
			 request.setAttribute("tea", tea);
			 request.setAttribute("haha", "哈哈");			 
			 return  "/admin/orderform/list.jsp";
	}
	public String shipments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//User user = (User) request.getSession().getAttribute("existUser");
		//得到oid
		String oid = request.getParameter("oid");
		String currentPage = request.getParameter("currentPage");
		OrderService service = new OrderServiceImpl();
		service.shipments(oid);
		
		//订单取消后要跳转到我的订单列表
		
		return request.getContextPath() + "/backProductStrvlet?method=orderform&currentPage=" + currentPage;	
	}
}