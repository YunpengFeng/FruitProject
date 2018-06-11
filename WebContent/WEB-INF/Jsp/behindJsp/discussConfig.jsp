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
</head>
<body>
	<input type="hidden" value="${type}" id="type">
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		<div class="r">
					<div class="dirty">
					<div style="float:left">
							<input class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px" id="search"> 
						    <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >搜索</a>
				  </div>
				   <div class="state" style=" float:left; margin-left:150px; font-size:20px;;margin-bottom:10px">发布评价<input  id ="configbutton"class="easyui-switchbutton" onText="自动" offText="手动" name="unitState" ></div>  
						   <table id="tt"></table>
				 </div>
				  
		</div>
		
	</div>
<input type="hidden" value="${type}" id="type">
</body>
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo/demo.css">
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="JSresources/bjs/discussConfig.js"></script>
<link href="css/bcss/discussConfig.css" rel="stylesheet">
</html>