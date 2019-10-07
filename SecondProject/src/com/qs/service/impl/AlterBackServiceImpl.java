package com.qs.service.impl;

import com.qs.dao.AlterDao;
import com.qs.dao.impl.AlterDaoImpl;
import com.qs.service.AlterBackService;

public class AlterBackServiceImpl implements AlterBackService {

	@Override
	public void getAlterService(int cid, String cname) {
		AlterDao dao = new AlterDaoImpl();
		dao.getAlterService(cid,cname);
	}

}
