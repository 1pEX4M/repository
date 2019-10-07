package com.qs.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.qs.dao.DeleteDao;
import com.qs.javabean.Product;
import com.qs.utils.C3P0Utils;

public class DeleteDaoImpl implements DeleteDao {

	@Override
	public void getDeleteService(int cid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		//SET FOREIGN_KEY_CHECKS=0;   外键失效
		//SET FOREIGN_KEY_CHECKS=1   恢复外键
		System.out.println(cid);
		String ss=""+cid;
		System.out.println(ss);
		String sql1="SET FOREIGN_KEY_CHECKS=0";
		String sql2="delete  from category where cid=?";
		String sql3="SET FOREIGN_KEY_CHECKS=1";
		try {
			query.update(sql1);
			query.update(sql2,ss);
			query.update(sql3);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void getProdeleteService(int pid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String ss=""+pid;
		String sql1="SET FOREIGN_KEY_CHECKS=0";
		String sql2="delete  from product where pid=?";
		String sql3="SET FOREIGN_KEY_CHECKS=1";
		try {
			query.update(sql1);
			query.update(sql2,ss);
			query.update(sql3);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void save(Product p) {
   QueryRunner query= new QueryRunner(C3P0Utils.getDataSource()); 
/*`pid` int(10) NOT NULL AUTO_INCREMENT,
` pname` varchar(32) DEFAULT NULL,
`price` double DEFAULT NULL,
`pimage` varchar(255) DEFAULT NULL,
`color` varchar(32) DEFAULT NULL,
`size` varchar(32) DEFAULT NULL,
`pdesc` varchar(64) DEFAULT NULL,
`count` int(10) DEFAULT NULL,
`cid` int(10) DEFAULT NULL,
`popularity` int(10) DEFAULT NULL,*/
        String sql="insert into product values(?,?,?,?,?,?,?,?,?,?)";
        Object[] params={null,p.getPname(),p.getPrice(),p.getPimage(),p.getColor(),
        		p.getSize(),p.getPdesc(),p.getCount(),p.getCid(),null};
        try {
			query.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
