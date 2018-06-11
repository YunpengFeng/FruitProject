<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link href="css/index.css" rel="stylesheet">
   
    <link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="inner">
     <jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
    <div class="img1">
    <!-- 轮播 -->
    	<jsp:include page="/WEB-INF/Jsp/frontJsp/slide.jsp" flush="false"/>
    </div>
	
	<div class="c"></div>

    
 <div class="c"></div>

    <div class="new">
        <p>新品上市</p>
       <a href="more?type=1"> <img  class="more"src="imgs/more.jpg"></a>
        <div class="c"></div>
        <div id="total">
      </div>
    </div>
    
   <div class="c"></div>

	
		<div class="count">
			<p>折扣水果</p>
			<a href="more?type=2"><img  class="more"src="imgs/more.jpg"></a>
			<div class="c"></div>
			<div id="zhekou"></div>
		</div>
	

		<div class="count" style="margin-left: 2%">
			<p>进口水果</p>
			<a href="more?type=3"><img class="more" src="imgs/more.jpg"></a>
			<div class="c"></div>
			<div id="in"></div>
		</div>

		<div class="c"></div>
		<div class="recommend" id="recommendToIndex">
				<!-- <img src="imgs/zuo.jpg">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="fruitImages/10000_ (1).png">
				<img src="imgs/you.jpg"> -->
	
		</div>
  		<input type="hidden" id="user" value="${user.users_id}">
    <jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>
</div>
</body>
   <script type="text/javascript" src="JSresources/index.js"></script>
</html>