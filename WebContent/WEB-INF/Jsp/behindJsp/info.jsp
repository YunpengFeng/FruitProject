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
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo/demo.css">

<link href="css/bcss/info.css" rel="stylesheet">
<!-- <script src="js/toastr/toastr.js"></script>
	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />  -->

<title></title>
</head>
<body>
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		<div class="r">
			<div class="content">
			<input type="hidden" id="type"value="${map.type}">
			<!--聊天消息聊表  -->
				<c:if test="${map.type=='19'}">
					<ul id="conversation">
						<li><h4 style="margin-right: 30px; color: green">未读消息</h4></li>
						<div style="margin-top: 2px" id="infolist">
							
							<c:forEach items="${list}" var="obj" >
								<li id="${obj.sendid}-${obj.fruit_id}" ><a target="${obj.sendid}-${obj.fruit_id}"href="dalog?sendid=${obj.sendid}&fruit_id=${obj.fruit_id}" 
								onclick="addTab('${obj.user_name}_${obj.fruit_name}' ,'${obj.sendid}-${obj.fruit_id}')">
								<img src="imgs/tou1.png">${obj.user_name}<span id="${obj.sendid}_${obj.fruit_id}">(${obj.c})</span>条</a></li>
							</c:forEach>
						</div>
					</ul>
					
					<div id="tt" class="easyui-tabs"
						style="">
						<div title="Home" id="home">
								<p style="text-align:center ;letter-spacing: 2px;font-size: 18px;margin-top:0px">客户就是上帝，以良好的态度服务于客户<p>
						</div>
					</div>
					<!-- 已读消息 -->
						<ul id="ready">
							<li><h4 style="margin-right: 30px; color: green">已读消息</h4></li>
								
						</ul>
				</c:if>
				
				
				
				
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script src="JSresources/bjs/info.js"></script>

</html>