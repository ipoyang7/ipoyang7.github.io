<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录狗东账号</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function changeImg() {
		document.getElementById("img1").src = "${path}/CheckImgServlet?"
				+ new Date().getTime();
	}
</script>
</head>

	<c:if test="${sessionScope.existUser != null }">
	<jsp:forward page="/SearchServlet"></jsp:forward>
	</c:if>
<body>
	<div class="container">
		<jsp:include page="/model/head.jsp" flush="true"></jsp:include>
		<jsp:include page="/model/menu.jsp" flush="true"></jsp:include>
		<!--登录主体-->
		<div class="row">
			<div class="col-sm-12 img-responsive"
				style="background-image: url(${path}/images/loginbg.jpg); background-size: auto;">
				<div class="row">
					<div class="col-sm-5 col-md-offset-6"
						style="background-color: white; border-radius: 10px; margin-top: 20px; margin-bottom: 50px; padding-top: 50px; padding-bottom: 50px;">
						<div class="row">
							<div class="col-sm-4">
								<font size="4">会员登录</font>
							</div>
						</div>
						<form class="form-horizontal" action="${path}/LoginServlet"
							method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="inputEmail3"
										name="username" placeholder="请输入用户名"
										value="${ cookie.rememberU.value}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="请输入密码"
										value="${ cookie.rememberP.value}">
								</div>
							</div>
							<div class="form-group">
								<label for="date" class="col-sm-2 control-label">验证码</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="checkcode">
								</div>
								<div class="col-sm-6">
									<a href="#" onclick="changeImg()"><img
										src="${path}/CheckImgServlet" id="img1" />点击切换</a>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3 col-sm-offset-2">
									<input type="checkbox" name="rememberU" value="true" />记住用户名
								</div>
								<div class="col-sm-3 col-sm-offset-1">
									<input type="checkbox" name="rememberP" value="true" />记住密码
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<input type="submit" value="登录" class="btn btn-danger btn-lg" />
								</div>
								<div class="col-sm-6" style="margin: 10px">
									<h4>
										<font color="red"> 	${requestScope.msg }</font>
									</h4>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--底部广告-->
			<jsp:include page="/model/foot.jsp"  flush="true"></jsp:include>
	</div>
</body>

</html>