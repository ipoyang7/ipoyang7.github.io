<%@page import="com.jd.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/model/head.jsp" flush="true"></jsp:include>
		<jsp:include page="/model/menu.jsp" flush="true"></jsp:include>
		<!-- 静态包含 -->
		<div class="row"
			style="height:400px; padding: 30px; background-image: url(/jd/img/bg.jpg);">
		
			<div class="col-sm-8 col-sm-offset-2"
				style="background-color: white; padding: 30px; border: 5px solid gray; border-radius: 10px;">
				<form class="form-horizontal" action="/jd/AddServlet" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">商品名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="pname">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">市场价格</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="market_price">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商城价格</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="shop_price">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">是否热门</label>
						<div class="col-sm-2">
							<input type="radio" name="is_hot" value="1" checked="">是

						</div>
						<div class="col-sm-2">
							<input type="radio" name="is_hot" value="0">否
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">是否下架</label>
						<div class="col-sm-6">
							<select name="pflag" class="form-control">
								<option value="0" selected="">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商品描述</label>
						<div class="col-sm-6">
							<textarea name="pdesc" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商品分类</label>
						<div class="col-sm-6">
							<select name="cid" class="form-control">
								<option value="1">手机数码</option>
								<option value="2">电脑办公</option>
								<option value="3">汽车用品</option>
								<option value="4">鞋靴箱包</option>
							</select>
						</div>
					</div>

					<!-- 	<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">商品图片</label>
							<div class="col-sm-6">
								<input type="file" name="pimage">
							</div>
						</div>		  -->


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-info">提交</button>
						</div>
						<h4><font color="red"> ${requestScope.editMsg}</font></h4>
					</div>
				</form>
			</div>
		</div>
			<jsp:include page="/model/foot.jsp" flush="true"></jsp:include>
	</div>

</body>
</html>