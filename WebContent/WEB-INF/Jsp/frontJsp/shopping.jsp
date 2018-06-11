<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>

     <link href="css/shopping.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.min.js"></script>
       <script type="text/javascript" src="JSresources/shopping.js"></script>
       <script src="js/toastr/toastr.js"></script>
		<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="inner">
   <jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
   
    <div class="c"></div>
    <c:if test="${empty map}"> <div style="margin-top:100px;font-size:20px;  text-align:center; font-weight: bold;">
	    你的购物车空空如也，尽快加入购物车吧
	    </div><div style="margin-top:200px;"></div>
    </c:if>
    <c:if test="${map.size()>0}">
	<div>
		<div class="top">
			<p class="p1">全部商品</p>
			<p class="p1">降价商品</p>
			<p class="p1">库存紧张</p>
			<p class="p2">已选商品<span id="total1">0</span>元<a href="javascript:void(0)"onclick="pay()">结算</a></p>
	   </div>
	   <div class="c"></div>
	   
	   <div class="meddile" style="margin-top: 37px;height: 37px;">
			   <input class="m" type="button"  style="background-color:#FFB6C1"onclick="allSelect();" value="全选">
			   <p class="m">商品信息</p>
			   <p class="m">单价</p>
			   <p class="m">数量</p>
			    <p class="m">金额</p>
			    <p class="m">操作</p>
	   </div>
		<div class="c"></div>
		<!-- 循环 -->
		<c:forEach items="${map}" var ="map">
		<div class="cell" id="cc${map.id}">
			<!--  很重要，根据name来找checkbox-->
			 <input class="m" type="checkBox" name="ck" value="${map.id}">
			 <img src="fruitImages/${map.id}_ (1).png"> 
			 <p class="m" >${map.name}</p>	
			 <p class="price" ><input type ="text"  id="c${map.id}"value="${map.price}元"><br><del style="color:gray">${map.p}元</del></p>
			 <div class="am">
				 <input class="amout" type="button" value="+" onclick="add(${map.id},${map.price})">
				 <!-- 使用水果id作为id选择器 ,数量输入框 -->
				 <input class="amout" type="text" id="${map.id}"value="${map.amount}">
				 <input class="amout" type="button"  value="--" onclick="sub(${map.id},${map.price})">
			 </div>
			 <!-- 使用水果id的前面拼接上‘a’作为id选择器 ,输入框 -->
			  <input class="total" type="text"  id="a${map.id}"value="${map.amount*map.price}">
			  <div class="bm">
				 <input class="move" type="button" value="移到收藏夹" onclick="oparetion(11,${map.id})">
				 <input class="amout" type="button"  value="删除"  onclick="oparetion(12,${map.id})">
			 </div>
			 <div class="c"></div>
		</div>
		</c:forEach>
		
		<div class="c"></div>
		
		 <div class="sum">
			 <input class="m" type="button" value="全选" style="background-color:#FFB6C1"onclick="allSelect();">
			 <p>已选中商品<b id="N"></b>件 &nbsp;&nbsp;&nbsp;
			 合计:￥<em id="total"><b style="font-size: 25px;color: #f40;">0</b></em> </p>
			 <a href="javascript:void(0)" onclick="pay()">结算</a>
			 
		</div>
     </div>
    </c:if>
       <jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>

</div>


</body>
</html>