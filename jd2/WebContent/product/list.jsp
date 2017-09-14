<%@page import="java.util.List"%>
<%@page import="org.apache.commons.dbutils.handlers.BeanListHandler"%>
<%@page import="com.jd.Utils.JDBCUtils"%>
<%@page import="org.apache.commons.dbutils.QueryRunner"%>
<%@page import="com.jd.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品清单</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}//js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("selectAll").onclick = function() {
			var eles = document.getElementsByClassName("ids");
			for (var i = 0; i < eles.length; i++) {
				eles[i].checked = this.checked;
			}
		}
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/model/head.jsp" flush="true"></jsp:include>
		<jsp:include page="/model/menu.jsp" flush="true"></jsp:include>
		<form action="${path}/SearchServlet" method="post" onsubmit="search()">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td colspan="8">名称:<input type="text" id="pname" name="pname"
							class="form-control"><br> <input type="submit"
							value="查询" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${path}/product/add.jsp"><input type="button"
								value="添加" class="btn btn-info"></a>&nbsp;&nbsp;&nbsp;&nbsp;
							<%
								String pname = (String) request.getAttribute("pname");
								if (pname != null && !"".equals(pname)) {
							%> 筛选结果<font color="red"><b><%=pname%></b></font> <%
 	}
 %> <!--  <input	type="button" value="删除" class="btn btn-danger"	 onclick="delete()">&nbsp;&nbsp;&nbsp;&nbsp; -->
							<font color="red" size="4"> ${requestScope.editMsg}</font>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

		<form action="${path}/DeleteServlet" method="post" id="form1">
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="批量删除"
				class="btn btn-danger">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>序号</td>
						<td><input type="checkbox" id="selectAll">全选</td>
						<td>商品名称</td>
						<td>市场价格</td>
						<td>商城价格</td>
						<td>是否热门</td>
						<td>是否下架</td>
						<td>操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<c:forEach var="product" items="${requestScope.pList }">
						<tr>
							<td><%=i++%></td>
							<td><input type="checkbox" name="pid" class="ids"
								value="${product.pid }"></td>
							<td>${product.pname }</td>
							<td>${product.market_price }</td>
							<td>${product.shop_price }</td>
							<c:choose>
								<c:when test="${product.is_hot==1 }">
									<td>是</td>
								</c:when>
								<c:otherwise>
									<td>否</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${product.pflag==1 }">
									<td>是</td>
								</c:when>
								<c:otherwise>
									<td>否</td>
								</c:otherwise>
							</c:choose>
							<td><a href="${path}/product/edit.jsp?product=${product }">修改</a>|
								<a href="${path}/DeleteServlet?pid=${product.pid }"
								onclick="del()">删除</a>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</form>
		<jsp:include page="/model/foot.jsp" flush="true"></jsp:include>
	</div>
</body>
</html>