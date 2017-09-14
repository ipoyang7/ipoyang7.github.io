package com.jd.Utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	private JDBCUtils() {
	}

	private static final ComboPooledDataSource dataSource = new ComboPooledDataSource();

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public static DataSource getDataSource() {
		return dataSource;
	}
}
