package com.jd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.jd.domain.User;

/**
 * Servlet Filter implementation class AdminFilter
 */
public class AdminFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
		User existUser = (User) hsr.getSession().getAttribute("existUser");
		if (existUser != null) {
			chain.doFilter(request, response);
		} else {
			hsr.setAttribute("msg", "您无权访问后台页面");
			request.getRequestDispatcher("/login.jsp").forward(hsr, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
