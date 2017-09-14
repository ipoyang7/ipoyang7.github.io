package com.jd.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;

import com.jd.Utils.JDBCUtils;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num=0;
		try {
			String[] values = request.getParameterValues("pid");
			for (String value : values) {
				int pid = Integer.parseInt(value);
				String sql = "delete from product where pid=?";
				QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
				 num = qr.update(sql,pid);
			}
			if(num>0) {
				request.setAttribute("editMsg", "删除成功");
				
			}else {
				request.setAttribute("editMsg", "删除失败");
			}
			request.getRequestDispatcher("/SearchServlet").forward(request, response);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
