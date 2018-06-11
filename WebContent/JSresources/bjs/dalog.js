/**
 * 
 */

/** 
 * 获取指定的URL参数值 
 * 参数：paramName URL参数 
 * 调用方法:getRequest("name") 
 * 返回值:tyler 
 */ 
function getRequest(paramName) { 
    paramValue = "", isFound = !1; 
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) { 
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0; 
        while (i < arrSource.length && !isFound) 
        	arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++ 
    } 
    return paramValue == "" && (paramValue = null), paramValue 
} 



$(function(){
	var fruitid=getRequest("fruit_id");
	var sendid =getRequest("sendid");
	$.ajax({
		type:'post',
		url:'queryOtheronversation',
		datatype:'json',
		data:{"fruitid":fruitid,"sendid":sendid,"type":"three"},
		success	:function(data){
			var html ="";
			var e  = eval("("+data+")");
			for(var i in e){
				html += '<div class="cell"><img src="imgs/tou1.png"><div class="r">'+e[i].sendtime +"<br>"+e[i].content+'</div></div><div class="c"></div>'
			}
			$(".con").html(html);
		}
	});
	//水果信息
	$.ajax({
		type:'post',
		url:'getFruitById',
		datatype:'json',
		data:{"fruitid":fruitid},
		success	:function(data){
			e = $.parseJSON(data);
			var html ="";
		var info=	e.fruit_info;
			if(info.length>50)
				info=info.substr(0,50)+".....";
			html = '<a href="product?id='+e.fruit_id+ '"><img  style="width:40px;height:54px;float:left;margin-left:10px"src="fruitImages/'+e.fruit_id+'_ (1).png">'+info+"</a>";
				
			$(".goods").html(html);
		}
	});
	
	
	//清除屏幕记录
	$("#clearjilu").bind("click",function(){
		$(".con").empty();
	});
	
	//绑定Enter键发送
	$('#textarea1').bind('keypress',function(event){  
	    if(event.keyCode == "13") {
	    	send();
	    } 
	});
	
	//管理员发送聊天记录到服务器
	send = function(){
		var content =$("#textarea1").val();
		if($.trim(content)==null||$.trim(content)==""){
			toastr.error("请输入对话");
		}else{
			$("#textarea1").val("");
			//发送聊天记录到数据库
			$.ajax({
				type:'post',
				url:'sendConversation',
				datatype:'json',
				data:{"content":content,"fruitid":fruitid, "receivied":sendid},
				success	:function(a){
					var e=eval("("+a+")");
					var html="";
					if(e.meg=="ok"){
						var date =new Date();
						html += '<div class="cell"><img src="imgs/chart1.png"><div class="r">' +date.toLocaleString()+"<br>"+content+'</div></div><div class="c"></div>'
						$(".con").append(html);
					}else{
						toastr.error("数据异常");
					}
				}
			});
		}
	}
	
	
	//查看历史记录
	historyrecond =function(){
		$.ajax({
			type:'post',
			url:'queryOtheronversation',
			datatype:'json',
			data:{"fruitid":fruitid,"type":"four","sendid": sendid},
			success	:function(a){
				var e = eval("("+a+")");
			 var 	html="";
				if(eval(a).length== 0){
					$(".history").prepend("暂无聊天记录<br>");
				}else{
					for(var i in e){
						if(e[i].sendid== sendid)
							html += '<div class="cell"><img src="imgs/tou1.png"><div class="r">'+e[i].sendtime +"<br>"+e[i].content+'</div></div><div class="c"></div>'
						if(e[i].receiveid== sendid)
							html += '<div class="cell"><img src="imgs/chart1.png"><div class="r">'+ e[i].sendtime+"<br>"+e[i].content+'</div></div><div class="c"></div>'
					}
					$(".history").empty();
					$(".history").prepend(html);
				}
				
			}
		});
	}
	//定时器得到消息
	 var t = window.setInterval("requestcontent()",5000); 
	 requestcontent = function(){
			$.ajax({
				type:'post',
				url:'queryOtheronversation',
				datatype:'json',
				data:{"fruitid":fruitid,"type":"five","sendid":sendid},
				success	:function(a){
					var e=eval("("+a+")");
					var html="";
					if(a !=null){
						for(var i in e)
							html += '<div class="cell"><img src="imgs/tou1.png"><div class="r">'+e[i].sendtime +"<br>"+e[i].content+'</div></div><div class="c"></div>';
							$(".con").append(html);
					}else{
						toastr.error("数据异常");
					}
				}
			});
		}
	
	
})
