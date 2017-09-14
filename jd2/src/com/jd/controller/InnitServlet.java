package com.jd.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 初始化的Servlert
 * 将这个Servlert配置成启动时加载
 * @author ipoyang7
 *
 */

public class InnitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	public void init(ServletConfig config) throws ServletException {
//		init();
	public void init() throws ServletException {
		//统计登录成功人数
		int loginCount = 0;
//		统计注册成功人数
		int registerCount = 0;
		this.getServletContext().setAttribute("loginCount", loginCount);
		this.getServletContext().setAttribute("registerCount", registerCount);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
