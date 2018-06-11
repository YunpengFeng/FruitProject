<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo.css">

<title></title>
</head>
<body>
	<div class="content">
		<div class="jilu"><div class="history"></div><a  style="font-size: 15px;font-family: cursive;"href ="javascript:void(0)"onclick="historyrecond()">历史聊天记录</a>
			<div class="goods" style="margin-top:20px;"></div>
		</div>
		<div class="con">
		</div>
	</div>

	<div class="dalog">
		<div class="area"><textarea id="textarea1" maxlength="80"></textarea></div>
		<div class="zujian">
			<button id="clearjilu">清除记录</button>
			<button onclick="send()">发送</button>
		</div>
	</div>

</body>
	<script type="text/javascript" src="js/easyui/jquery.min.js"></script> 
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script src="js/toastr/toastr.js"></script>
	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="JSresources/bjs/dalog.js"></script>
<link rel="stylesheet" type="text/css" href="css/bcss/dalog.css">
</html>