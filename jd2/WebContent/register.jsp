<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册狗东账户</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery-1.11.3.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script>
	function checkForm() {
		var flag1 = checkNotNull("username");
		var flag2 = checkNotNull("password");
		var flag3 = checkNotNull("repassword");
		var flag4 = checkPwdAndRpwd(flag2, flag3);
		return flag1 && flag2 && flag3 && flag4;
	}

	function checkNotNull(id) {
		var div = document.getElementById(id + "Div");
		var msg = document.getElementById(id + "Msg");
		var nid = document.getElementById(id).value;
		var reg = /^\w{3,10}$/;
		if (reg.test(nid)) {
			div.className = "form-group";
			msg.innerHTML = "";
			return true;
		} else {
			div.className += " has-error";
			msg.innerHTML = "<font size=1>必须是3~10位的数字/英文字母组成</font>";
			return false;
		}
	}

	function checkPwdAndRpwd(f1, f2) {
		var msg = document.getElementById("repasswordMsg");
		var repassword = document.getElementById("repassword").value;
		var div = document.getElementById("repasswordDiv");
		var password = document.getElementById("password").value;
		if (f1 && f2) {
			if (password == repassword) {
				div.className = "form-group";
				msg.innerHTML = "";
				return true;
			} else {
				div.className += " has-error";
				msg.innerHTML = "必须和密码相同";
				return false;
			}

		} else {
			return false;
		}
	}
	var provinces=["浙江省","江苏省","湖北省","河北省","吉林省"];
	var cities = [ [ "杭州市", "绍兴市", "温州市", "义乌市", "嘉兴市" ],
			[ "南京市", "苏州市", "扬州市", "无锡市" ],
			[ "武汉市", "襄阳市", "荆州市", "宜昌市", "恩施" ],
			[ "石家庄市", "唐山市", "保定市", "邢台市", "廊坊市" ],
			[ "长春市", "吉林市", "四平市", "延边市" ] ];

	function changeCity(value) {
		
		var city = document.getElementById("city");
		city.innerHTML = "<option value=null> --请选择--</option>";
		var index = -1;
		for(var i =0;i<provinces.length;i++){
			if(value==provinces[i]){
				index = i;
			}
		}
		
		if (index !=-1) {
			for (var i = 0; i < cities[index].length; i++) {
				city.innerHTML += "<option value="+ cities[index][i] +">" + cities[index][i] + "</option>";
			}
		}
	}
	function changeImg() {
		document.getElementById("img1").src = "/jd/CheckImgServlet?"
				+ new Date().getTime();
	}
</script>
</head>
<body>
	
	<div class="container">
			<jsp:include page="/model/head.jsp" flush="true"></jsp:include>
		<jsp:include page="/model/menu.jsp" flush="true"></jsp:include>
		<!--主体-->
		<div class="row">
			<div class="col-md-12"
				style="background-image: url(img/regist_bg.jpg);">
				<div class="row">
					<div class="col-md-8 col-md-offset-2"
						style="border: 5px solid gainsboro; background-color: white;">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2">
								<font color="#286090" size="4">会员注册</font>
							</div>
						</div>
						<div class="row">
							<form action="RegisterServlet" class="form-horizontal"
								onsubmit="return checkForm()" method="post">
								<div class="form-group" id="usernameDiv">
									<label class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="username"
											placeholder="请输入用户名" name="username">
									</div>
									<label class="col-sm-2 control-label" id="usernameMsg"></label>
								</div>
								<div class="form-group" id="passwordDiv">
									<label class="col-sm-2 control-label">密码</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password"
											placeholder="请输入密码" name="password">
									</div>
									<label class="col-sm-2 control-label" id="passwordMsg"></label>
								</div>
								<div class="form-group" id="repasswordDiv">
									<label class="col-sm-2 control-label">确认密码</label>
									<div class="col-sm-8">
										<input type="password" class="form-control"
											placeholder="请再次输入密码" name="repassword" id="repassword">
									</div>
									<label class="col-sm-2 control-label" id="repasswordMsg"></label>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">邮箱</label>
									<div class="col-sm-8">
										<input type="email" class="form-control" placeholder="请输入邮箱"
											name="email" id="email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" placeholder="请输入姓名"
											name="name" id="name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">性别</label>
									<div class="col-sm-8">
										<input type="radio" name="sex" value="male" checked="checked">男
										<input type="radio" name="sex" value="female">女
									</div>
								</div>
								<div class="form-group">
									<label for="date" class="col-sm-2 control-label">出生日期</label>
									<div class="col-sm-6">
										<input type="date" class="form-control" name = "birthday">
									</div>
								</div>
								<div class="form-group">
									<label for="date" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-6">
										省<select name="province" id="province"
											onchange="changeCity(this.value)">
											<option value="null" >--请选择--</option>
											<option value="浙江省">浙江省</option>
											<option value="江苏省">江苏省</option>
											<option value="湖北省">湖北省</option>
											<option value="河北省">河北省</option>
											<option value="吉林省">吉林省</option>
										</select> 市 <select name="city" id="city">
											<option value="null"> --请选择--</option>
										</select>
									</div>
								</div>

								<div class="form-group">
								<label for="date" class="col-sm-2 control-label">验证码</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="checkcode">
								</div>
								<div class="col-sm-6">
								 <a href="#"onclick="changeImg()"><img	src="/jd/CheckImgServlet" id="img1" />点击切换</a>
								</div>
							</div>
								<div class="row" style="margin-bottom: 10px;">
									<div class="col-sm-offset-2 col-sm-2" >
										<input type="submit" class="btn btn-danger btn-lg" value="注册" />
									</div>
									<div class="col-sm-4" >
										<font size="4" color="red"> ${requestScope.msg}</font>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--foot-->
			<jsp:include page="/model/foot.jsp"  flush="true"></jsp:include>
	</div>
</body>
</html>