<%@page import="org.apache.commons.dbutils.handlers.BeanHandler"%>
<%@page import="com.jd.Utils.JDBCUtils"%>
<%@page import="org.apache.commons.dbutils.QueryRunner"%>
<%@page import="com.jd.domain.Product"%>
<%@page import="com.jd.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑商品</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		
		<!-- 静态包含 -->
		<div class="row"
			style="height: 800px; padding: 100px; background-image: url(../img/bg.jpg);">
			<div class="col-sm-8 col-sm-offset-2"
				style="background-color: white; padding: 50px; border: 5px solid gray; border-radius: 10px;">
				<form class="form-horizontal" action="/jd/EditServlet" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">商品名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="pname"
								value="${ product.getPname()}" /> <input type="hidden"
								name="pid" value="${product.getPid()}" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">市场价格</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="market_price"
								value="${ product.getMarket_price()}" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商城价格</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="shop_price"
								value="${product.getShop_price()}" />
						</div>
					</div>
					<%
						boolean ishot1 = false;
								boolean ishot0 = false;
								if (product.getIs_hot() == 1) {
									ishot1 = true;
								} else {
									ishot0 = true;
								}
					%>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">是否热门</label>
						<div class="col-sm-2">
							<input type="radio" name="is_hot" value="1" checked="<%=ishot1%>">是

						</div>
						<div class="col-sm-2">
							<input type="radio" name="is_hot" value="0" checked="<%=ishot0%>">否
						</div>
					</div>
					<%
						boolean pflag0 = false;
								boolean pflag1 = false;
								if (product.getPflag() == 1) {
									pflag1 = true;
								} else {
									pflag0 = true;
								}
					%>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">是否下架</label>
						<div class="col-sm-6">
							<select name="pflag" class="form-control">
								<option value="0" selected="<%=pflag0%>">否</option>
								<option value="1" selected="<%=pflag1%>">是</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商品描述</label>
						<div class="col-sm-6">
							<textarea name="pdesc" class="form-control"><%=product.getPdesc()%></textarea>
						</div>
					</div>
					<%
						boolean selected1 = false;
								boolean selected2 = false;
								boolean selected3 = false;
								boolean selected4 = false;
								String cid = product.getCid();
								if (cid == "1") {
									selected1 = true;
								} else if (cid == "2") {
									selected2 = true;
								} else if (cid == "3") {
									selected3 = true;
								} else if (cid == "4") {
									selected4 = true;
								}
					%>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">商品分类</label>
						<div class="col-sm-6">
							<select name="cid" class="form-control">
								<option value="1" selected="<%=selected1%>">手机数码</option>
								<option value="2" selected="<%=selected2%>">电脑办公</option>
								<option value="3" selected="<%=selected3%>">汽车用品</option>
								<option value="4" selected="<%=selected4%>">鞋靴箱包</option>
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
						<button type="submit" class="btn btn-info">提交</button>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="/model/foot.jsp" flush="true"></jsp:include>
	</div>
	
</body>
</html>