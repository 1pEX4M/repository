package com.qs.service.impl;

import com.qs.dao.GainDao;
import com.qs.dao.impl.GainDaoImpl;
import com.qs.javabean.Category;
import com.qs.service.GainBackService;

public class GainBackServiceImpl implements GainBackService {

	@Override
	public Category getGainService(int cid) {
		GainDao dao = new GainDaoImpl();
		return dao.getGainService(cid);
	}

}
