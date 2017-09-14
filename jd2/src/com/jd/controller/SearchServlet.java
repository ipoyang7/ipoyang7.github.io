package com.jd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jd.domain.Product;
import com.jd.model.ProductModel;

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			String pname = (String) request.getParameter("pname");
			ProductModel productModel = new ProductModel();
			List<Product> pList = null;
			// 判断有没有传递过来pname
			if (pname == null || "".equals(pname)) {
				pList = productModel.search();
			} else {
				pList = productModel.search(pname);
			}
			request.setAttribute("pList", pList);
			request.setAttribute("pname", pname);
			request.getRequestDispatcher("/product/list.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
