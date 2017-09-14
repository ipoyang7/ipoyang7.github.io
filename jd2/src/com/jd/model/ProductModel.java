package com.jd.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.jd.Utils.JDBCUtils;
import com.jd.domain.Product;

public class ProductModel {
	QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
	public List<Product> search() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from product";
		List<Product> pList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class));
		return pList;
	}

	public List<Product> search(String pname) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from product where pname like '%"+pname+"%'";
		List<Product> pList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class));
		return pList;
	}

}
