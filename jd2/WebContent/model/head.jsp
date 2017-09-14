<%@page import="com.jd.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!--logo-->
		<div class="row">
			<c:set var="path" value="${pageContext.request.contextPath}"
				scope="application"></c:set>
			<div class="col-md-4">
				<img src="${path}/img/logo2.png" />
			</div>
			<div class="col-md-4">
				<img src="${path}/img/header.png" />
			</div>
			<div class="col-md-4" style="margin-top: 10px;">
				<c:choose>
					<c:when test="${sessionScope.existUser !=null}">
						<a href="${path}/SearchServlet" class="btn btn-danger">商品管理</a>
											您好：${sessionScope.existUser.name }
									<a href="${path}/LogoutServlet">退出</a>
					</c:when>
					<c:otherwise>
							<ul class="list-inline">
								<li><a href="${path}/login.jsp" class="btn btn-primary ">登录</a></li>
								<li><a href="${path}/register.jsp" class="btn btn-primary ">注册</a></li>
								<li><a href="${path}/SearchServlet"
									class="btn btn-danger">购物车</a></li>
								<li>
							</ul>
						</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>