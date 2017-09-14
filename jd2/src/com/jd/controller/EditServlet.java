package com.jd.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;

import com.jd.Utils.JDBCUtils;

public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int pid = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		double market_price = Double.parseDouble(request.getParameter("market_price"));
		double shop_price = Double.parseDouble(request.getParameter("shop_price"));
		double is_hot = Double.parseDouble(request.getParameter("is_hot"));
		double pflag = Double.parseDouble(request.getParameter("pflag"));
		String pdesc = request.getParameter("pdesc");
		String cid = request.getParameter("cid");
		System.out.println(pname);
		String sql = "update product set pname=?,market_price=?,shop_price=?,is_hot=?,pflag=?,pdesc=?,cid=? where pid=?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			int num = queryRunner.update(sql, pname, market_price, shop_price, is_hot, pflag, pdesc, cid,
					pid);
			if (num > 0) {
				request.setAttribute("editMsg", "修改成功");
				request.getRequestDispatcher("/SearchServlet?pid=" + pid).forward(request, response);
				;

			} else {
				request.setAttribute("editMsg", "修改失败，请重新再试");
				request.getRequestDispatcher("/product/edit.jsp?pid=" + pid).forward(request,
						response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
