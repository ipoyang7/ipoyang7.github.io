package com.jd.model;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.jd.Utils.JDBCUtils;
import com.jd.domain.User;

public class UserModel {

	public User login(User user) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from user where username=? and password = ?";
		User result = queryRunner.query(sql, new BeanHandler<User>(User.class), user.getUsername(),
				user.getPassword());

		return result;
	}

	public boolean register(User user) throws SQLException {
		boolean flag = false;
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from user where username=? ";
		User result = queryRunner.query(sql, new BeanHandler<User>(User.class), user.getUsername());
		if (result == null) {
			String sql2 = "insert into user values(null,?,?,?,?,?,?,?,?)";
//			Data truncation: Incorrect date value: '' for column 'birthday' at row 1 Query: 
//			 insert into user values(null,?,?,?,?,?,?,?,?) Parameters: [123, 123, , male, null, null, , ]
			String birthday = user.getBirthday();
			if (!birthday.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")) {
				birthday = null;
			}
			int num = queryRunner.update(sql2, user.getUsername(), user.getPassword(), user.getName(),
					user.getSex(), user.getProvince(), user.getCity(), user.getEmail(), birthday);
			if (num > 0) {
				flag = true;
			}
		}
		return flag;
	}

}
