package com.daleyzou.utils;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 封装常用的操作
 * @author 11543
 *
 */
public class JdbcUtils {
	
	//初始化 连接池
	private static DataSource dataSource;
	
	static {
		dataSource = new ComboPooledDataSource();
	}
	
	/**
	 * 返回数据源对象
	 * @return
	 */
	public static DataSource getDataSource(){
		return dataSource;
	}
	
	/**
	 * 创建DbUtils常用工具类对象
	 */
	public static QueryRunner getQueryRunner(){
		return new QueryRunner(dataSource);
	}
}







