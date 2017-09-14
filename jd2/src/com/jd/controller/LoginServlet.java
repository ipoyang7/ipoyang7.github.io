package com.jd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jd.domain.User;
import com.jd.model.UserModel;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (username == null || "".equals(username) || password == null || "".equals(password)) {
				request.setAttribute("msg", "用户名或密码不能为空!");
				// 使用请求转发进行页面跳转
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
			}
			// 获取服务器中的验证码
			String checkcode = (String) request.getSession().getAttribute("checkcode");
			request.getSession().removeAttribute("checkcode");
			// 获取用户输入的验证码
			String checkcode1 = request.getParameter("checkcode");

			if (!checkcode.equalsIgnoreCase(checkcode1)) {
				// 向request域中保存一个错误信息
				request.setAttribute("msg", "验证码输入错误!");
				// 使用请求转发进行页面跳转
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
			}

			User user = new User(username, password);
			UserModel userModel = new UserModel();
			User existUser = userModel.login(user);

			if (existUser != null) {

				request.getSession().setAttribute("existUser", existUser);

				String rememberU = request.getParameter("rememberU");
				if ("true".equals(rememberU)) {
					Cookie cookie = new Cookie("rememberU", existUser.getUsername());
					cookie.setMaxAge(60 * 2*60);
					response.addCookie(cookie);
				}
				String rememberP = request.getParameter("rememberP");
				if ("true".equals(rememberP)) {
					Cookie cookie = new Cookie("rememberP", existUser.getPassword());
					cookie.setMaxAge(60 *2*60  );
					response.addCookie(cookie);
				}
				response.sendRedirect(request.getContextPath() + "/SearchServlet");
			} else {
				request.setAttribute("msg", "用户名或密码错误！");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}

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
