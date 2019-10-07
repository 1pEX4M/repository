package com.qs.service.impl;

import com.qs.dao.DeleteDao;
import com.qs.dao.impl.DeleteDaoImpl;
import com.qs.service.DeleteBackService;

public class DeleteBackServiceImpl implements DeleteBackService {

	@Override
	public void getDeleteService(int cid) {
		DeleteDao dao = new DeleteDaoImpl();
		dao.getDeleteService(cid);
	}

}
