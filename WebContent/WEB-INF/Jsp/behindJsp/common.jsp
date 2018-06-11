<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bcss/common.css" rel="stylesheet">
	<script type="text/javascript" src="js/easyui/jquery.min.js"></script> 
	<script src="JSresources/bjs/common.js"></script>
		
<title></title>
</head>
<body ng-app="s">
<div class="inner">
<div class="heads">
	<div class="pp">水果销售后台管理系统</div>
	<div class="remove">管理员：${admin.admin_name } <a href="adminremove">注销？</a><a href="adminindex">返回首页</a></div>
</div>
	<hr>
    <div class="c"></div>
    <div class="right">
    	<div class="block">
    		    <div class="head">账号管理</div>
	    		<div class="cell" id="11"><img src="imgs/icon_user.png"><a  id=""href="accountManager?type=11&currentpage=1">权限管理</a></div>
	    		<div class="cell" id="12"><img src="imgs/22.png"><a href="accountManager?type=12&currentpage=1">用户管理</a></div>
	    		<div class="cell" id="13"><img src="imgs/23.png"><a href="accountManager?type=13&currentpage=0">密码设置</a></div>
    	</div> 
    	
    	<div class="block">
    		    <div class="head">商品管理</div>
	    		<div class="cell" id="14"><img src="imgs/17.png"><a   href="accountManager?type=14&currentpage=1">修改信息</a></div>
	    		<div class="cell" id="15"><img src="imgs/16.png"><a href="addProduct?type=15">增加商品</a></div>
    			<div class="cell" id="22"><img src="imgs/16.png"><a href="addFruitImfo?type=22">水果知识</a></div>
    	</div> 
    	
    	<div class="block">
    		    <div class="head">批量管理</div>
	    		<div class="cell" id="16"><img src="imgs/19.png"><a href="batchManager?type=16&currentpage=1&size=20&amount=100">库存管理</a></div>
	    		<div class="cell" id="17"><img src="imgs/18.png"><a href="batchManagerOrder?type=17&currentpage=1&size=20&vals=13">货单管理</a></div>
	    		<div class="cell" id="18"><img src="imgs/20.png"><a  href="batchManagerofshangxiajia?type=18&currentpage=1&size=20&values=00">上下架管理</a></div>
	    		<div class="cell" id="24"><img src="imgs/18.png"><a href="batchManagerDiscuss?type=24&currentpage=1&size=20&state=11">评价审核</a></div>
	    		<div class="cell" id="20"><img src="imgs/21.png"><a href="batchManagercuidan?type=20&currentpage=1&size=20">催单记录</a></div>
    	</div> 
    	
    	<div class="block">
    		    <div class="head">消息管理</div>
	    		<div class="cell" id="19"><img src="imgs/11.png"><a href="serviceInfo?type=19&isread=11">聊天列表</a></div>
    	</div> 
    	
    	<div class="block">
    		    <div class="head">信息统计</div>
	    		<div class="cell" id="21"><img src="imgs/14.png"><a href="CountSell?type=21">销售统计</a></div>
    	</div> 
    	<div class="block">
    		    <div class="head">配置管理</div>
	    		<div class="cell" id="23"><img src="imgs/15.png"><a href="discussConfig?type=23">评价配置</a></div> 
    	</div> 
    </div>
    
</div>
</body>
<script>

</script>
</html>