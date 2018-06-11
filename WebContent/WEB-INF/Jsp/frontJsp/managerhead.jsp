<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link href="css/managerhead.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
     <script type="text/javascript" src="JSresources/manager.js"></script>
       <script src="js/toastr/toastr.js"></script>
    	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
    	 <script src="js/raty/jquery.raty.js"></script>
    	 <script src="js/raty/jquery.raty.min.js"></script>
    	  
</head>
<body>
<div class="inner">

    <div class="head" style="height: 50px;">
        <div class="headleft">
          <img src="imgs/in_02.jpg"> <a href="index">&nbsp;<strong class="em1">水果首页</strong> </a> <img src="imgs/in_04.jpg">&nbsp;<strong class="em1">南京</strong> 
       </div>
    
        <div class="headright"> 
        <ul>
				<li><a href="remoce"><b style="color: #990033;">${sessionScope.user.user_name}</b><h5 style="display: inline; font-weight: 100">用户</h5></a>
                  		<a  style="color: yellow"href="remove">&nbsp;注销</a>
				</li>
	            <li><a href="manager?type=1">我的订单</a></li>
	            <li><a href="manager?type=8">我的收藏</a></li>
	            <li><a href="manager?type=9">购物车</a></li>
	            <li><a href="manager?type=5">待发货</a></li>
	            <li><a href="manager?type=2">待付款</a></li>
	            <li><a href="manager?type=3">待收货</a></li>
	            <li><a href="manager?type=4">待评价</a></li>
	            <li><a href="manager?type=6">信息设置</a></li>
	            <li><a href="manager?type=7">消息服务</a></li>
            <li style="color: #990033;font-size:20px;font-weight: bold ;font-family: cursive;letter-spacing: 0px"><a href="index.html">首&nbsp;页</a></li>
        </ul>
        
        </div>
    </div>
    <div class="m"></div>
     
		<div class="meddile">
			<div class="aa">我的宝贝</div>
			<form action="search" method="post" >
			<input id="content" class="search" type="text" name="content"
						placeholder="西瓜"> 
						<input type="hidden" id="crruentpage"name="crruentpage"value="1">
				<input class="submit"  type="submit" value="查询">
			</form>
		</div>
		<input type="hidden" id="type" value="${type}">
		<div class="nav">
				<ul>
						
						<li id="1"><a  href="manager?type=1">所有订单<span id="all"></span></a></li>
						<li id="2"><a  href="manager?type=2">待付款<span id ="pay"></span></a></li>
						<li id="5"><a  href="manager?type=5">待发货<span id="send"></span></a></li>
						<li id="3"><a href="manager?type=3">待收货<span id="get"></span></a></li>
						<li id="4"><a  href="manager?type=4">待评价<span id="discuss"></span></a></li>
						 <li id="8"><a href="manager?type=8">收藏夹<span id="con"></span></a></li>
						<li id="6"><a  href="manager?type=6">信息设置</a></li>
						<li id="7"><a href="manager?type=7">消息服务</a></li>
						
				</ul>
		</div>
		<div class="c"></div>
	
		<div class="sm">
		<c:if test="${array.size()==0}">
				<div class="cell">暂无任何信息 </div>	
		</c:if>
			<!-- 订单类别 -->
				<c:if test="${type=='1'||type=='2'||type=='3'||type=='5'}">
					<c:forEach items="${array}" var="orders">
						<div class="cell" id="${orders.orders_id}">
								<div class="orders">&nbsp;&nbsp;&nbsp;&nbsp;订单编号：${orders.orders_id}
								<b>下单时间：${orders.order_time}</b>
								<em style="margin-left: 0px">支付状态：<strong><c:if test="${orders.pay_states==0}"><strong style="color:red">未支付</strong></c:if><c:if test="${orders.pay_states==1}">已支付</c:if>
								</strong></em><span>总价:${orders.total}元</span>
											<br>
										 <c:forEach var="num" items="${fn:split(orders.tempinfo, 'a')}">
					                     	   <c:set var ="a" value="${num}" /> 
					                     	   <img src="fruitImages/${fn:substring(a, 0, 5)}_ (2).png">
					                    </c:forEach>							
					                    <div class="inputs">
						                   <c:if test="${type=='5'}"> 
						                      <c:if test ="${orders.cancal_order=='0'}"><input type="button" value="去催单" onclick="outOrders('${orders.orders_id}')"><input type="button"  id="c${orders.orders_id}" value="取消订单" onclick="cancle_order(12,'${orders.orders_id}')"></c:if>
						                       <c:if test ="${orders.cancal_order=='1'}"><input type="button"  id="c${orders.orders_id}"  value="取消审核" onclick="cancle_order(13,'${orders.orders_id}')"></c:if>
						                    </c:if>
						                    
						                    <c:if test ="${type=='3'}"><input type="button" value="请收货" onclick="getOrders('${orders.orders_id}')"></c:if>	
						                    <c:if test ="${type=='2'}">
						                        <c:if test="${orders.pay_states==0}"><input type="button"  value="取消订单" onclick="cancle_order(11,'${orders.orders_id}')"><input type="button"  value="去支付" onclick="pay('${orders.orders_id}')"></c:if>
						                    </c:if>
						                     <c:if test ="${orders.pay_states==0 and type=='1'}">
						                        <c:if test="${orders.check_cancal_order == 0}"><input type="button"  value="取消订单" onclick="cancle_order(11,'${orders.orders_id}')"><input type="button"  value="去支付" onclick="pay('${orders.orders_id}')"></c:if>
						                        <c:if test="${orders.check_cancal_order == 1}"><input type="button"  value="订单失效" ></c:if>
						                    </c:if>
											<c:if test="${orders.pay_states==1}"><input type="button"  value="展开详情" onclick="opendetails('${orders.orders_id}')"></c:if>
										</div>
								</div>
						</div>
					</c:forEach>
				</c:if>
				
			<c:if test="${type=='4' }">
			<c:forEach items="${array}" var="items">
				<div class="tabs" id="${items.item_id}">
					 <div class="left">
						<img src="fruitImages/${items.fruit_id}_ (2).png">
						<p>${items.fruit_name}</p>
					 </div>
						<div class="middle" >
							<p>星级评价：</p><div  class="stras" id="stra${items.item_id}" data-score="5"></div>
							<div class="c"></div>
							<div class="area">评论内容（100字内）</div>
							<div class="areas"><textarea cols="48"rows="8" maxlength="80" id="area${items.item_id}"></textarea></div>
						</div>
						
						<div class="right">
						<table id="picss">
							<tr id="picss${items.item_id}">
									
							</tr>
						</table>
						<input type="file" id="up${items.item_id}" value="选择图片" accept="image/*" multiple="multiple"  onchange="sendPictrues(${items.item_id})"style="margin-right:10px;margin-top:20px"/>
						
						</div> 
						<div><input class="discuss" type="button" onclick="sendDiscuss(${items.item_id})" value="发表评论"></div>
					</div>
				</c:forEach>
			</c:if>
			
		<!-- 信息设置 -->
			<c:if test="${type=='6' }">
			<div class="info">
					<c:forEach items="${array}" var="users">
					<label>账&nbsp;户&nbsp;名：</label><input type="text" disabled="disabled" value="${users.user_name}"><br>
					<label>账&nbsp;户余额：</label><input type="text" disabled="disabled" value="${users.money}元"><br>
					<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input type="password" value="${users.user_pass}" id="pass"><br>
					<label>确认密码：</label><input type="password" value="${users.user_pass}" id="passagain"><span id="passa"></span><br>
					<label>手&nbsp;&nbsp;机&nbsp;&nbsp;号：</label><input type="text"  value="${users.user_phone}" id="phone"><br>
					<label>收件地址：</label><input type="text"  value="${users.user_address}" id="address">
						<input type="button" onclick="infoSetting()" value="提交" style="margin-left:520px;width:100px ;background-color: orange;text-align: left;font-size: 20px">
					</c:forEach>
			</div>
			</c:if>
			
			<!-- 收藏夹-->
			<c:if test="${type=='8' }">
				<c:forEach items="${array}" var="map">
				
					<div class="cell"  style="height:100px;border-top:gray;border-right:gray;border-left:gray;"id="${map.fruit_id}">	
							<button onclick="oparetion(13,${map.fruit_id})" style="background-color: gray">移除</button>
							<a href="product?id=${map.fruit_id}">
							<img style="width:100px;height:80px"src="fruitImages/${map.fruit_id}_ (1).png">
							<div style="margin-top:-80px ;margin-left:158px">
									<b style="margin-left:8px">【${map.fruit_place}】</b>${map.fruit_info}
							</div>
							</a>
					</div>	
				
				</c:forEach>	
			</c:if>
			
		</div>
		<div class="c"></div>
		
		<div class="open" id="wind" > 
					
		</div>
		
  </div>

</body>
<script>

</script>
</html>