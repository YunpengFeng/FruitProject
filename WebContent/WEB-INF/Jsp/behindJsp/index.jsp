<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bcss/index.css" rel="stylesheet">
     <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/toastr/toastr.js"></script>
    <link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
	<script src="JSresources/bjs/indexcontroller.js"></script>
	
	<link rel="stylesheet" href="js/bootstrap-3.3.7/dist/css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	
<title></title>
</head>
<body ng-app="s">
<div class="inner">
	<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false"/>
	
	<div class="c"></div>
	<div class="r">
			<div class="cells">
				<div class="top">聊天消息<span id="meg">(11)</span><a href="serviceInfo?type=19&isread=11"><img src="imgs/27.png"></a></div>
			</div>
			<div class="cells">
				<div class="top">订单消息<span id="orders">(12)</span><a href="batchManagerOrder?type=17&currentpage=1&size=20&vals=13"><img src="imgs/29.png"></a></div>
			</div>
			<div class="cells">
				<div class="top">催单记录<span id="orders">(14)</span><a href="batchManagercuidan?type=20&currentpage=1&size=20"><img src="imgs/29.png"></a></div>
			</div>
			<div class="cells">
				<div class="top">商家入驻<span id="meg">(11)</span><a href="accountManager?type=11&currentpage=1"><img src="imgs/71.png"></a></div>
			</div>
	</div>
	
	
</div>
</body>
<script>

</script>
</html>