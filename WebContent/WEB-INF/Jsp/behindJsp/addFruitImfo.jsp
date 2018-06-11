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
<link href="css/bcss/addFruitImfo.css" rel="stylesheet">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" charset="utf-8" src="js/UEditor/ueditor.config.js"></script>
<script type="text/javascript" src="js/UEditor/ueditor.all.js"></script>
<script src="JSresources/bjs/addFruitImfo.js"></script>

</head>
<body>
	<input type="hidden" value="${type}" id="type">
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		<div class="r">
		<form action="" method="post">
			<div class="sele">
					<span>水果类型</span>
					<select name ="fruittype" id="fruittype" >
						
					</select>
					<span>发布状况</span>
					<select name ="isshow" id="isshow" >
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
					
					<span>水果旺季月份</span>
					<select name ="season" id="season" >
							
					</select>
					<input type="button" onclick="subm()"value="保存提交" style="margin-left:30px">
				</div>
				
				<div class="content">
				 	<script type="text/plain" id="myEditor" name="myEditor">
        			</script>
				</div>
				</form>
		</div>
	</div>
	<input type="hidden" value="" id="infoId">
	
	
</body>
<script>
	

</script>
</html>