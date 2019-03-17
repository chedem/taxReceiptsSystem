<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="jsp/css/plugins/bootstrap/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="jsp/css/plugins/fontawe/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="jsp/css/common/animate.css" type="text/css"></link>
<link rel="stylesheet" href="jsp/css/common/style.css" type="text/css"></link>
<link rel="stylesheet" href="jsp/login/css/login.css" />
</head>
<body class="login-bg">
	<div id="textMain">
		<h1>税务凭证自动化平台</h1>
		<footer>SHUIWUPINGZHENGZIDONGHUAPINGTAI</footer>
	</div>
	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<div>
				<h1 class="logo-name">SWPZ</h1>
			</div>
			<h3>欢迎使用SWPZ</h3>
			<form class="m-t" role="form"
				action="<%=basePath%>test/login.do" method="post">
				<div class="form-group">
					<input type="text" name="logname" class="form-control"
						placeholder="用户名" required>
				</div>
				<div class="form-group">
					<input type="password" name="logpass" class="form-control"
						placeholder="密码" required>
				</div>
				<button id="getLogin" type="submit"
					class="btn btn-primary block full-width m-b" onclick="sendName()">登 录</button>
			</form>
			<p class="text-muted text-center">
				<a href="login.html#"><small>忘记密码了？</small> </a> | <a
					href="register.html">注册一个新账号</a>
			</p>
		</div>
	</div>
	<!-- 全局js -->
	<script type="text/javascript" src="jsp/js/plugins/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="jsp/js/plugins/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="jsp/js/lib/jquery.cookie.js"></script>
	<script>
		function sendName() {
			var uName = $("[name=logname]").val();
			$.cookie('name', uName, {
				path : '/',
				secure : false
			});

		}
	</script>
	<!-- <script type="text/javascript" src="js/login.js"></script> -->
</body>
</html>
