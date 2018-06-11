<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>水果销售网站</title>
<link href="css/pay.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
	<div class="inner">
	

		<div class="top">
			*******************************************你的购物订单*************************************<br>
			<br> 订单编号&nbsp;&nbsp;&nbsp;&nbsp;${orderid}<br>
			订单时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${time}<br>
		付款人姓名:&nbsp;&nbsp;<span style="font-weight: bold">&nbsp;${sessionScope.user.user_name}</span><br>
		  确认订单信息：
		</div>
		<div class="meddile">
			<table align="center" style="border-bottom: 0px solid #b2d1ff;" width="100%"
				cellpadding="10px">
				<tr style="border: 0px solid white; color: #b2d1ff">
					<th>商品名称： &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</th>
					<th>价格： &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</th>
					<th>数量： &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</th>
					<th>小计： &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</th>
				</tr>
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${list}" var="b">
					<tr style="border-bottom: 1px solid gray; background-color: #f2f7ff;">
						<td style="padding-left: 50px"><a href ="product?id=${b.id}">${b.name}<a></td>
						<td style="text-align: center"><b>${b.price}</b>&nbsp;&nbsp;&nbsp;元</td>
						<td style="text-align: center"><b>${b.amount}</b>&nbsp;&nbsp;&nbsp;&nbsp;件</td>
						<td style="text-align: center"><b><fmt:formatNumber type="number" value="${b.price*b.amount}" pattern="0.00" maxFractionDigits="2"/></b>&nbsp;&nbsp;&nbsp;&nbsp;元</td>
							<c:set var="count" value="${b.price*b.amount+count}"></c:set>
					</tr>
				</c:forEach>
			</table>
			<br>
			<hr>
			<p style="color: black">
				总计：<span  id="totalmoney"style="color: red; font-weight: bold; font-size:25px; font-family:fantasy; letter-spacing: 2px">${count}</span>RMB<p>
		<br></div>
	<form action="info" method="post">
		<div class="behand">
			&nbsp;&nbsp;收&nbsp;件&nbsp;人 &nbsp; &nbsp;&nbsp;&nbsp;<input type="text" name="man" id="username" placeholder="收件人姓名">
			<br> 收&nbsp;货&nbsp;地&nbsp;址：<input type="text" name="address" id="address"placeholder="收件人地址"> <span><a
				href="javascript:void(0)" style="background-color:#f2f7ff; " onclick="moren()">使用默认信息</a></span>
				  <br>  联系方式：&nbsp;&nbsp;&nbsp;<input type="text" name="phone" id="phone"style="display: inline;"placeholder="收件人联系方式（很重要）">
				  <input type="hidden"  name ="orderid"value="${orderid}">
				   <input type="hidden"  name ="totalmoney"value="${count}">
				    <input type="hidden"  id ="hideaddress"value="${user.user_address}">
				     <input type="hidden"  id ="phone1"value="${user.user_phone}">
				     <input type="hidden"  id ="username1"value="${user.user_name}">
				     <input type="hidden"  id ="money"value="${user.money}">
				      <input type="hidden"  id ="info" name ="info"value="${info}">
				   <input style="display: inline;background-color:#ff0036;border-radius: 5px;width: 100px;text-align: center;padding:0px"
				   type="submit" value="确认付款"><br><br>
				付款方式：<input type="radio" name ="radios" id="yue"value="2" class="ra"><img id="changess"src="imgs/ye.jpg">
				<input type="radio" name ="radios" class="ra" value="1" ><img src="imgs/zfb.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/wx.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/gs.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/zs.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/ns.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/ms.jpg"><br><br>
				<input type="radio" name ="radios" class="ra"value="1" style="margin-left:102px"><img src="imgs/jt.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/xy.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/js.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/sha.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/gd.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/yz.jpg">
				<input type="radio" name ="radios" class="ra"value="1" ><img src="imgs/zg.jpg">
		</div>
		
		</form>
		<jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false" />
		
	</div>
</body>
<script>
$(document).ready(function(){
	$("#ccc").empty();
	var  money = $("#money").val();
	var  totalmoney =$("#totalmoney").text();
	if(Number(money)>Number(totalmoney)){
		$("#yue").prop("checked",'checked');
	}else{
		$("#changess").prop("src","imgs/buzu.jpg");
		$("#yue").prop("disabled", true);
	}
		
	moren = function(){
		var address = $("#hideaddress").attr('value');
		$("#address").prop("value" ,"");
		$("#address").prop("value" ,address);
		
		var phone = $("#phone1").attr('value');
		$("#phone").prop("value" ,"");
		$("#phone").prop("value" ,phone);
		
		var name = $("#username1").attr('value');
		$("#username").prop("value" ,"");
		$("#username").prop("value" ,name);
	}
	
});
	
</script>
</html>