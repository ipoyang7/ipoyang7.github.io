<%@page import="com.jd.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>狗东商城</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<!--  head-->
		<jsp:include page="/model/head.jsp" flush="true"></jsp:include>
		<jsp:include page="/model/menu.jsp"  flush="true"></jsp:include>

		<!--轮播图-->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/jd/img/1.jpg" alt="图片1">
					<div class="/jd/carousel-caption">图片1的声明</div>
				</div>
				<div class="item">
					<img src="/jd/img/2.jpg" alt="图片2">
					<div class="/jd/carousel-caption">图片2的说明</div>
				</div>
				<div class="item">
					<img src="img/3.jpg" alt="图片3">
					<div class="carousel-caption">图片3的说明</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!--热门商品-->
		<div class="row">
			<div class="col-sm-2">
				<img src="image/q.jpg" width="100%" />
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-6">
						<img src="image/3.jpg" width="100%" height="150px" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
					<div class="col-sm-2">
						<img src="img/a03.jpg" />
					</div>
				</div>
			</div>
			<!--广告-->
			<div class="row">
				<div class="col-sm-12">
					<img src="products/hao/ad.jpg" width="100%" />
				</div>
			</div>
			<!--热门商品-->
			<div class="row">
				<div class="col-sm-2">
					<img src="products/1/cs10001.jpg" width="150%" />
				</div>
				<div class="col-sm-10">
					<div class="row">
						<div class="col-sm-6">
							<img src="products/hao/middle01.jpg" width="100%" height="150px" />
						</div>
						<div class="col-sm-2">
							<img src="img/a03.jpg" />
						</div>
						<div class="col-sm-2">
							<img src="img/a03.jpg" />
						</div>
						<div class="col-sm-2">
							<img src="img/a03.jpg" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2">
							<img src="products/1/cs10010.jpg" width="100%" />
						</div>
						<div class="col-sm-2">
							<img src="products/1/cs10002.jpg" width="100%" />
						</div>
						<div class="col-sm-2">
							<img src="products/1/cs10003.jpg" width="100%" />
						</div>
						<div class="col-sm-2">
							<img src="products/1/cs10005.jpg" width="100%" />
						</div>
						<div class="col-sm-2">
							<img src="products/1/cs20007.jpg" width="100%" />
						</div>
						<div class="col-sm-2">
							<img src="products/1/cs30008.png" width="100%" />
						</div>
					</div>
				</div>
				<!--广告声明-->
			</div>
		</div>
	<jsp:include page="/model/foot.jsp"  flush="true"></jsp:include>
	</div>
</body>

</html>