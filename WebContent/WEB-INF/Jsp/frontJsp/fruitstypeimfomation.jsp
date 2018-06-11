<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link href="css/head.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="inner">

    <div class="head">
        <div class="headleft">
          <img src="imgs/in_02.jpg"> <a href="index">&nbsp;<strong class="em1">水果首页</strong> </a> <img src="imgs/in_04.jpg">&nbsp;<strong class="em1">南京</strong> 
       </div>
    
        <div class="headright"> 
        <ul>
					<li><c:if test ="${empty sessionScope.user}" >你好，<a href="toLogin">请登入&nbsp;</a>
					<a href="toRegister">免费注册</a></c:if>
					  <c:if test ="${not empty sessionScope.user}"> <a href="remoce"><b style="color: #990033;">${sessionScope.user.user_name}</b><h5 style="display: inline; font-weight: 100">用户</h5></a>
                  <a  style="color: yellow"href="remove">&nbsp;注销</a></c:if>
					</li>
			<c:if test="${empty user}">
	            <li><a href="javascript:void(0)" onclick="check()">我的订单</a></li>
	            <li><a href="javascript:void(0)" onclick="check()">收藏夹</a></li>
	            <li><a href="javascript:void(0)" onclick="check()">待付款 </a></li>
	             <li><a href="javascript:void(0)" onclick="check()">待发货</a></li>
	            <li><a href="javascript:void(0)" onclick="check()">待收货</a></li>
	            <li><a href="javascript:void(0)" onclick="check()">待评价</a></li> 
	          	<li><a href="javascript:void(0)" onclick="check()">信息设置</a></li>
	            <li><a href="javascript:void(0)" onclick="check()">消息服务</a></li> 
	             <li><a href="adminmanager">进入系统</a></li> 
            </c:if>
           
            <c:if test="${not empty user}">
	             <li><a href="manager?type=1">我的订单</a></li>
	            <li><a href="manager?type=8">收藏夹</a></li>
	              <li><a href="manager?type=5">待发货</a></li>
	            <li><a href="manager?type=2">待付款</a></li>
	            <li><a href="manager?type=3">待收货</a></li>
	            <li><a href="manager?type=4">待评价</a></li>
	            <li><a href="manager?type=6">信息设置</a></li>
	            <li><a href="manager?type=7">消息服务</a></li>
	            <li><a href="javascript:void(0)" onclick="check2()">进入系统</a></li> 
            </c:if>
            <li style="color: #990033;font-size:20px;font-weight: bold ;font-family: cursive;letter-spacing: 0px"><a href="index.html">首&nbsp;页</a></li>
        </ul>
        
        </div>
    </div>

    <div class="m"></div>
     <div class="total">
        <div style="float:left;margin-top: -15px;"><img class="img2"src="imgs/1.png"></div>
        <div class="s">
        	<div class="sear">
				<form action="search" method="post" >
					<input id="content" class="search" type="text" name="content"
						placeholder="西瓜"> 
						<input type="hidden" id="crruentpage"name="crruentpage"value="1">
					<div class="query"></div>
					<input class="button1" type="submit" value="搜索">
				</form>
			</div>
				<div class="b">
               <c:if test="${not empty user}"> <a  href="shopping"><div class="buycar">购物车</div></a></c:if>
               <c:if test="${empty user}"> <a href="javascript:void(0)" onclick="tishi()"><div class="buycar">购物车</a></div></c:if>
               
                <div><img src="imgs/5.jpg" alt="error"></div>
            </div>

        </div>
        </div>

    <div class="c"></div>
    <div class="m"></div>
       <div class="index" id="ccc">
        <p>水果大全</p>
        <ul id="type">
        	
        </ul>
    </div>
     <div style="clear:both"></div>
     <div style="float:right"><img src="imgs/zhang.jpg"> </div>
     <div class="contents" style="margin-top:20px">
     		${fruitinfomation.information}
     </div>
      <jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
 <script src="JSresources/fruitstypeimfomation.js"></script>
</html>