<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.nchu.fruit.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络水果销售平台</title>
<link href="css/bcss/CountSell.css" rel="stylesheet">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="JSresources/bjs/CountSell.js"></script>

<script src="js/code/highcharts.js"></script>
<script src="js/code/modules/exporting.js"></script>
<script src="js/code/highcharts-3d.js"></script>


</head>
<body>
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		<input type="hidden" value="${map.type}" id="type">
		<div class="r">
		选择年份<select name ="ye" id="ye">
					</select>
		选择月份<select name ="mo" id="mo">
							<option  value="" selected></option>
							<option  value="1">1月</option>
							<option  value="2">2月</option>
							<option   value="3">3月</option>
							<option  value="4">4月</option>
							<option  value="5">5月</option>
							<option  value="6">6月</option>
							<option  value="7">7月</option>
							<option   value="8">8月</option>
							<option  value="9">9月</option>
							<option  value="10">5月</option>
							<option  value="11">11月</option>
							<option  value="12">12月</option>
			</select>
			<!-- 折线图年份销售额、销售量 -->
			<div class="content" id="contents">
			</div>
			<!-- 前十 -->
			<div style="margin-top: 50px;margin-left:0px;width:450px">
				<div id="topten"></div>
			</div>
			<!-- 订单交易成交量 -->
			<div style="margin-top:-400px;margin-left:450px;width:450px;height:400px;">
				<div id="ordersSuccess"></div>
			</div>
		</div>
	</div>

</body>
</html>