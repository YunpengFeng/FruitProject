<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>

     <link href="css/index.css" rel="stylesheet">
        <link href="css/list.css" rel="stylesheet"> 
         <script type="text/javascript" src="js/jquery.min.js"></script> 
       <script type="text/javascript" src="JSresources/list.js"></script>
</head>
<body>

<div class="inner">
   <jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
   
    <div class="c"></div>

		<div class="new" style="margin-left: 2%">
			<c:if test="${type =='1'}">
				<p>新品上市</p>
			</c:if>
			<c:if test="${type=='2'}">
				<p>折扣水果</p>
			</c:if>
			<c:if test="${type=='3'}">
				<p>进口水果</p>
			</c:if>
			<br> <br> <br>
			<div id="more">
				<c:forEach items="${list}" var="f">
					<div class="cell">
						<a href="product?id=${f.fruit_id} "><img
							src="fruitImages/${f.fruit_id}_ (1).png"></a>
						<dd>${f.fruit_name}</dd>
						<c:if test="${type=='3'}">
							<h5 style="margin-left:60px ;margin-top:20px">(${fn:replace(f.fruit_place, "f", "")})</h5>
						</c:if>
						<dt>￥${f.fruit_sellprice}</dt>
						<del>￥${f.fruit_price}</del>
					</div>
				</c:forEach>
				<div id="domore"></div>
			</div>

			<div class="c"></div>
			<div class="sss">
		
				<div class="load">
					<a  id ="ban" href="javascript:void(0)" onclick="load(${type})">
					<input type="hidden" value="1" id="page" name="page">
						<p id="hit">点击加载更多</p>
					</a>
				</div>
				<img  src="imgs/load.gif">
			</div>
	
		</div>

		<div class="c"></div>
    
     
      
       <jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>

</div>

</body>
</html>