<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link rel="stylesheet" href="css/common.css">
    
</head>
<body>
<hr style="border: 0.5px solid black">
<div class="inner">
<div class="c"></div>
    <div class="footer">
            <div class = "nav">
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li><a href="#">人才招聘</a></li>
                    <li><a href="#">商家入驻</a></li>
                    <li><a href="#">广告服务</a></li>
                    <li><a href="#">友情链接</a></li>
                    <li><a href="javascript:void(0)" onclick="demo4()">销售联盟</a></li>
                    <li><a href="javascript:void(0)" onclick="demo3()">水果社区</a></li>
                    <li><a href="javascript:void(0)" onclick="demo2()">水果公益</a></li>
                    <li ><a href="javascript:void(0)" onclick="demo1()">English Site</a></li>
                </ul>
                <p>Copyright&copy2004-2006&nbspwww.52ihomes.com

                    版权所有</p>
            </div>
    </div>
</div>


</body>
  <script>
  
  	$(function(){
  		
  	})
  	
  	function demo1(){
  		$.ajax({
  			type:'post',
  			url:'demo1',
  			datatype:'json',
  			success:function(data){
  				//var a =JSON.parse(data)
  				var a = eval("("+data+")")
  					alert("User对象是："+a.user_name)
  			}
  		})
  	}
  	function demo2(){
  		$.ajax({
  			type:'post',
  			url:'demo2',
  			datatype:'json',
  			success:function(data){
  				//var a =JSON.parse(data)
  				var a = eval("("+data+")")
  					alert("Map键"+a.name)
  			}
  		})
  	}
  	function demo3(){
  		$.ajax({
  			type:'post',
  			url:'demo3',
  			datatype:'json',
  			success:function(data){
  				//var a =JSON.parse(data)
  				var a = eval("("+data+")")
  				for(var i in a){
  					console.log("List<Integer>是"+a[i])
  				}
  			}
  		})
  	}
  	function demo4(){
  		$.ajax({
  			type:'post',
  			url:'demo4',
  			datatype:'json',
  			success:function(data){
  				//var a =JSON.parse(data)
  				alert("String"+data)
  			}
  		})
  	}
  </script>
</html>