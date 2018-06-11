<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="com.nchu.fruit.utils.PerecentPage"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>水果销售网站</title>
 <link href="css/index.css" rel="stylesheet">
   		<!-- <script src="js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="js/bootstrap-3.3.7/dist/css/bootstrap.min.css">  -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
       <script type="text/javascript" src="JSresources/list.js"></script>
        <link href="css/index.css" rel="stylesheet">
        <link href="css/list.css" rel="stylesheet"> 
       
</head>
<body>
<div  class="inner">
	<jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
	<div class="c"></div>
		<div class="new" style="margin-left: 2%">
			<p>搜索内容</p>
			<div class="c"></div>
			<div id="total">
				<c:forEach items="${list}" var="f">
					<div class="cell">
						<a href="product?id=${f.fruit_id} "><img src="fruitImages/${f.fruit_images}_ (1).png"></a>
						<dd>${f.fruit_name}</dd>
						<dt>￥${f.fruit_sellprice}</dt>
						<del>￥${f.fruit_price}</del>
					</div>
				</c:forEach>
			</div>
		</div>
	<div class="c"></div>
	<div class="pagination">
		
		<ul>
			 <li><a href="#">&laquo;</a></li>
			 	<c:forEach  begin="1" end="${pagination.totalPage}"  step="1" var="x">
					<li><a href="search?crruentpage=${x}&content=${content}&of=aa">${x}</a></li>
				</c:forEach>
		    <li><a href="#">&raquo;</a></li>
		    &nbsp; &nbsp; &nbsp;<em>共有数据<b>${pagination.totalCount}</b>条</em>;
		    <em>共<b>${pagination.totalPage}</b>页</em>;
		    <em>当前第<b>${pagination.currentPage}</b>页</em>;
		</ul><br>
	</div>
	<div class="c"></div>
		
		
	 <jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>
 </div>
</body>
</html>