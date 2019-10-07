package com.qs.utils;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {
	
	private static final ComboPooledDataSource dataSource = new ComboPooledDataSource(); 
	
	private C3P0Utils(){}
	
	public static DataSource getDataSource(){
		return dataSource;
	}
}
