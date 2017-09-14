package com.jd.filter;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sun.org.apache.bcel.internal.generic.RETURN;

public class EncodeHandler implements InvocationHandler {
	private HttpServletRequest requset;
	// 定义变量，判断get方法是否被编译
	private boolean hasEncode;

	public EncodeHandler(HttpServletRequest requset) {
		super();
		this.requset = requset;
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		// TODO Auto-generated method stub
		if ("getParameterMap".equalsIgnoreCase(method.getName())) {
			if ("get".equalsIgnoreCase(requset.getMethod())) {
				Map<String, String[]> map = requset.getParameterMap();
				// 如果get方式还没被正常编译
				if (!hasEncode) {
					for (String name : map.keySet()) {
						String[] values = map.get(name);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								values[i] = new String(values[i].getBytes("ISO-8859-1"),
										"UTF-8");
							}
						}
					}
					hasEncode = true;
				}
				return map;

			} else if ("post".equalsIgnoreCase(requset.getMethod())) {
				requset.setCharacterEncoding("UTF-8");
				return requset.getParameterMap();
			}
			return method.invoke(requset, args);
		}
		if("getParameter".equalsIgnoreCase(method.getName())) {
			Map<String, String[]> parameterMap = requset.getParameterMap();
			System.out.println(args);
			String[] values = parameterMap.get(args);
			if (values == null) {
				return null;
			}
			return values[0]; // 取回参数的第一个值
		}
		if("getParameterValues".equalsIgnoreCase(method.getName())) {
			Map<String, String[]> parameterMap = requset.getParameterMap();
			String[] values = parameterMap.get(args);
			return values;
		}
		return method.invoke(requset, args);
	}

}
