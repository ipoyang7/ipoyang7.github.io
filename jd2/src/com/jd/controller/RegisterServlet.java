package com.jd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jd.domain.User;
import com.jd.model.UserModel;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
//			获取服务器中的验证码
			String checkcode =(String) request.getSession().getAttribute("checkcode");
			request.getSession().removeAttribute("checkcode");
//			获取用户输入的验证码
			String checkcode1 = request.getParameter("checkcode");
			if(!checkcode.equalsIgnoreCase(checkcode1)) {
				// 向request域中保存一个错误信息
				request.setAttribute("msg", "验证码输入错误!");
				// 使用请求转发进行页面跳转
				request.getRequestDispatcher("/register.jsp").forward(request, response);
				
			}
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String birthday = request.getParameter("birthday");
			String email = request.getParameter("email");
			String province = request.getParameter("province");
			String sex = request.getParameter("sex");
			String city = request.getParameter("city");
			User user = new User(null, username, password, name, email, birthday, sex, province, city);
			UserModel userModel = new UserModel();
			Boolean flag = userModel.register(user);
			if (flag) {
				System.out.println(user);
				int  count =(int) this.getServletContext().getAttribute("registerCount");
				this.getServletContext().setAttribute("registerCount", ++count);
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else {
				request.setAttribute("msg", "注册失败，用户名已存在！");
				request.getRequestDispatcher("/register.jsp").forward(request, response);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
