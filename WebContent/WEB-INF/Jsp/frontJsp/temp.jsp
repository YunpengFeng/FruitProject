<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">  
    var time = 3;  
  
    function returnUrlByTime() {  
  
        window.setTimeout('returnUrlByTime()', 1000);  
  
        time = time - 1;  
  
        document.getElementById("layer").innerHTML = time;  
    }  
</script>  
  <style>
 /*页面居中*/
.inner{
    width: 100%;
    height:auto;
   
    
}
  .center{
  	margin:10% 20% ;
  	width: 500px;
  	height: 100px;
  	background-color:gray;
  	background-image:./imgs/center.jpg ;
  	}
  	.center span{
  		margin-left: 250px;
  	}
  </style>
</head>  
  
<body  onload="returnUrlByTime()">  

<div class="inner">
      <div class="center">
     <img src="imgs/center.jpg">
    <b><span id="layer">3</span>秒后，转入首页。</b>  
      
    <%  
        //转向语句  
        response.setHeader("Refresh", "1;URL=index");  
    %>  
    </div>
    </div>
  
</html>