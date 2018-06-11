<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link rel="stylesheet" href="css/product.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
   <link href="css/index.css" rel="stylesheet">
    <link href="css/list.css" rel="stylesheet"> 
    <script type="text/javascript" src="JSresources/products.js"></script>
     <script src="js/toastr/toastr.js"></script>
    	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
    <script src="js/raty/jquery.raty.js"></script>
    <script src="js/raty/jquery.raty.min.js"></script>
       
</head>
<body>
<div class="inner">
	<jsp:include page="/WEB-INF/Jsp/frontJsp/head.jsp" flush="false"/>
	<div class="c"></div>         
    <hr style="border-bottom: 2px solid #990033">

    <div class="c"></div>
    <div class="show">
        <div class="head"><em>水果&nbsp;&nbsp;&nbsp;<b>>&nbsp;${fruit.fruit_type}</b></em>>&nbsp;&nbsp;&nbsp;${fruit.fruit_name}&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="javascript:void(0)" onclick="show()">  <img  style="margin-left:700px; width:50px;height:45px"src="imgs/hide.jpg"></a>
           <a href="javascript:void(0)" onclick="hide()"><img style="margin-left:20px ;width:50px;height:45px"src="imgs/show.jpg"></a></div>
        <!--放置图片` -->
        <div class="body">
            <img src="fruitImages/${fruit.fruit_images}_ (1).png" alt="${fruit.fruit_images}_ (1).png">
            <div class="text"><strong>${fruit.fruit_name}</strong><br>
                <p>${fruit.fruit_info}</p>产地 &nbsp;【${fruit.fruit_place}】<br><br>现价<p class="strong1" >￥${fruit.fruit_sellprice} &nbsp;</p>【原价<del>￥${fruit.fruit_price}</del>】  &nbsp;  &nbsp;月销售<b style="color:red">${monthsell}</b>件 &nbsp;  &nbsp;库存量${fruit.fruit_amount}件<br>
                  &nbsp;   &nbsp;  &nbsp;服务由 顺丰 发货,并提供售后服务. 现在至明天11:10前下单,预计明天<br>
                  &nbsp;   &nbsp;  &nbsp;(10月28日)送达,因近期安检要求提升，10月13日至10月31日期间，您的商  
                  &nbsp;   &nbsp;  &nbsp; 品可能会出现配送时限延长，我们会全力加快为您服务，谢谢！<b style="color:blue">(限量10件)</b>
            </div>
			  <c:forEach begin ="2" end="${fruit.fruit_imgcount}" step="1" var="x">
					<div class="images"> <img src="fruitImages/${fruit.fruit_images}_ (${x}).png" alt="${fruit.fruit_images}_ (${x}).png"></div>
		      </c:forEach>	 
            
            
            <form action="addcar" id="form1" name="addcar" method="post" onsubmit="return check(this)">
               <div class="oparetion">
                   <input type="button" onclick="add()" name="addto" value="+" style="width: 60px;background-color:gray;text-align: center;border-radius: 3px">
                   <input type="text" id="amount" style="width: 60px;text-align: center;border-radius: 6px;color: red;font-family: cursive;font-size: 25px;font-weight: bold" name ="amount" value=1>
                   <input type="hidden" style="" id="fruitid"name="id" value="${fruit.fruit_id}" >
                      <input type="hidden" style=""id="u_id" name="u_id" value="${user.users_id}">
                       <input type="hidden" name="type" value="p">
                   <input type="button"  onclick="sub()" name="subto" value="—" style="width: 60px;background-color:gray;text-align: center ;border-radius: 3px">
                    </div>
                <input class="car" type="submit"value="">
               <a id="achart"href="javascript:void(0)" onclick="chart(${fruit.fruit_id})"><div class="chart"> <img class="chartimg" src="imgs/chart1.png"><b class="chartimg"> 联系商家</b></div></a>
            </form>
            
            
         </div>
        <!-- 加入购物车直接展示在旁边栏目 -->
        <div class="left">
         </div>
      
    </div>
    <div class="c"></div>
		<div class="stra" id="" data-score="5"> </div>
        <div class="discuss">
        
        </div>
        <!-- 对话框 -->
      <div class="dalog">
			<div class="head"><p style="margin-left:30px;letter-spacing: 2px;float:left">小毛桃........正在为你服务</p>
				<a href="javascript:void(0)" onclick="closesd(${fruit.fruit_id})"><img src="imgs/close.jpg" style="width:20px;height:25px;float:left;margin-left:180px;"></a>
			</div>
			<div class="jilu"><div class="history"></div><a  style="margin-left:30%;font-size: 15px;font-family: cursive;"href ="javascript:void(0)"onclick="historyrecond()">历史聊天记录</a></div>
			<div class="right">
					<img src="fruitImages/${fruit.fruit_images}_ (2).png" alt="${fruit.fruit_images}_ (2).png"><br>
					<p>${fruit.fruit_name}</p><p>￥${fruit.fruit_sellprice} </p>
			</div>
			<div class="conversation"><textarea id="textarea1" maxlength="40"></textarea></div>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"onclick="clearblank()">清除记录</a>
			<div class="send"><a href="javascript:void(0)"onclick="send()">发送</a></div>限40,剩<span class="counts">40</span>字
 		</div>
 		
    	<jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>
</div>
	<input type="hidden" id="user" value="${user.users_id}" >
	<input type="hidden" value="${fruit.fruit_states}" id="fruit_states">
 </body>


<script>

//累计评价星级数
/* d= function(){
  var img = document.getElementById('files').files;
  for(var i =0; i<img.length;i++){
	  alert(img[i].val);
  }
	 
  
} */
function check(){
	var account=document.getElementById('user').value;
	if(account=="null"||account.length==0){
		alert("对不起你尚未登入");
		window.location.back=-1;
		return false;
	}else
		return true;
}
	/*减  */
    function sub(){
        var num=document.getElementById('amount').value;
        if(num<=1)
//                通过form表弟那的第name进行传值
            document.addcar.amount.value=1;
        else
         document.addcar.amount.value=Number(num)-1;
    }

    <!--加-->

        function add(){
            var amount=document.getElementById('amount').value;
//            alert(amount);
            if( amount>=10){
                document.addcar.amount.value=10;
            }
            else
            {
                document.addcar.amount.value=Number(amount)+1;
            }

        }

</script>
</html>