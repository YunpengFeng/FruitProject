$(document).ready(function(){
var u_id=$("#u_id").val();
var fruitid=$("#fruitid").val();
var t2 ;
	//聊天	,在点击联系卖家
	chart =function(fruitid){
		
		if(typeof(u_id) =='undefined'||u_id==""){
			toastr.error("登入后才能和商家联系");
		}else{
			$('#achart').removeAttr('onclick');
			$(".dalog").css('display','block');
			//文本域检测字数
			$("#textarea1").keyup(function(){
				var a=$(this).val().length;
				var count=40-a;
				$(".counts").html(count);
			});
			//查询以往记录显示
			t2= window.setInterval("requestcontent()",4000); 
			/*setInterval("requestcontent()", 4000);*/
		}
	}
	
	//实现ajax进行轮询
	requestcontent = function(){
		$.ajax({
			type:'post',
			url:'queryOtheronversation',
			datatype:'json',
			data:{"fruitid":fruitid,"type":"one"},
			success	:function(a){
				var e=eval("("+a+")");
				var html="";
				if(a !=null){
					for(var i in e)
						html +='<div class="he"><div class="content">'+e[i].content+'</div><img src="imgs/chart1.png"></div><div class="c"></div>';
					$(".jilu").append(html);
				}else{
					toastr.error("数据异常");
				}
			}
		});
	}
	
	//绑定Enter键发送
	$('#textarea1').bind('keypress',function(event){  
	    if(event.keyCode == "13") {
	    	send();
	    } 
	});
	//发送聊天记录到服务器
	send =function(){
		
		var content =$("#textarea1").val();
		if($.trim(content)==null||$.trim(content)==""){
			toastr.error("请输入对话");
		}else{
			$("#textarea1").val("");
			console.log("内容"+content);
			//发送聊天记录到数据库
			$.ajax({
				method:'post',
				url:'sendConversation',
				datatype:'json',
				data:{"content":content,"fruitid":fruitid},
				success	:function(a){
					var e=eval("("+a+")");
					var html="";
					if(e.meg=="ok"){
						html +='<div class="my"><img src="imgs/tou1.png"><div class="content">'+content+'</div></div><div class="c"></div>';
						
						$(".jilu").append(html);
					}else{
						toastr.error("数据异常");
					}
				}
			});
			 //对方数据html +='<div class="he"><div class="content">'+content+'</div><img src="imgs/chart1.png"></div><div class="c"></div>';
		}
	}
	
	
	//清除面板上的聊天记录
	clearblank= function(){
		//alert("s");
		$(".jilu").empty();
	}
	
	//关闭聊天记录
	closesd = function(obj){
		$(".dalog").css('display','none');
		$("#achart").attr("onclick","chart("+obj+")");
		//关闭轮询
		clearInterval(t2); 
	}
	
	//查看历史记录
	historyrecond =function(){
		$.ajax({
			method:'post',
			url:'queryOtheronversation',
			datatype:'json',
			data:{"fruitid":fruitid,"type":"two"},
			success	:function(a){
				var e = eval("("+a+")");
			 var 	html="";
				if(eval(a).length== 0){
					$(".history").prepend("暂无聊天记录<br>");
				}else{
					for(var i in e){
						if(e[i].sendid== u_id)
							html +='<div class="my"><img src="imgs/tou1.png"><div class="content">'+e[i].content+'</div></div><div class="c"></div>';
						if(e[i].receiveid== u_id)
							html +='<div class="he"><div class="content">'+e[i].content+'</div><img src="imgs/chart1.png"></div><div class="c"></div>';
					}
					$(".history").empty();
					$(".history").prepend(html);
				}
				
			}
		});
	}

	
	
	//有用户则发送请求，没有则隐藏
	if(typeof(u_id) !='undefined'&&u_id!=""){
		$.ajax({
			method:'post',
			url:'smallcar',
			datatype:'json',
			success	:function(e){
				var a =eval("("+ e +")");
				var  html='<p><img  style="margin-top:20px width:50px;height:50px"src ="imgs/wins.gif"><a href ="shopping"><img  style="margin-left:140px"src ="imgs/s.gif"></a></p><ul>';
				
				for(var i in a){
					html +=	'<li><img src="fruitImages/'+a[i].id+'_ (1).png" style="width:50px;height:50px">'+
						'<a href ="product?id='+a[i].id+'">'+a[i].name+',小计￥<b><em>'+a[i].price*a[i].amount+'</em></b></a><br>数量:<b>'+
						a[i].amount+'</b>件，单价：'+a[i].price+'元</li>';
				}
				console.log(html);
				$(".left").html(html+'</ul>');
				//$(".left").hide(1000);
			
			},
			error:function(e){
				alert("e"+e);
			}
		});
	}
	
	show= function(){
		$(".left").show(1000);
		
	}
	
	hide=function (){
		$(".left").hide(1000);
	}
	
	
	$.ajax({
		async:false,
		method:'post',
		url:'getDicussByFruit',
		datatype:'json',
		data:{"fruitid":$("#fruitid").val()},
		success	:function(e){
			
			var html="";
			if(eval(e).length==0){
				html='<div class="cell">暂无评论,快来购买发表你的评论吧！</div>'
				$(".discuss").html(html);
			}else{
				var a =eval("("+e+")");
				for(var i in a){
					html+='<div class="cell"'
					if(a[i].c_imgcounts =='0')
						html+='style="height:100px"';
					html+='><div class="lefts"><img src="imgs/tou.png"><br><p>'+a[i].user_name;
					html +='</p></div><div class="right"><h1>'+a[i].content+'</h1>';
					if(a[i].c_imgcounts !='0'){
						var num=Number(a[i].c_imgcounts);
						for(var j=1;j<=num;j++){
							html+='<img src="comImages/'+a[i].c_images+'_('+j+').png">';
						}
					 }
					html+='<div class="c"></div><p>'+a[i].c_date.substr(0,16)+'&nbsp;&nbsp;&nbsp;&nbsp;星级评价:</p>&nbsp;<div class="stras" id="'+a[i].item_id+'"data-score="'+a[i].c_rank+'"> </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>数量 :'+a[i].amount+'件</p></div></div>';
				}
				$(".discuss").html(html);
			
				var array=$(".stras");
				for(var i=0;i<array.length;i++){
					var c =(Number($(array[i]).attr("data-score")));
					var id=$(array[i]).attr("id");
					var h ="";
						for(var j=0;j<c;j++){
							h += '<img src ="imgs/star-on.png" style="float:left;margin-left:0px;width:20px;height:20px">';
						}
						$("#"+id+"").html(h);
				}
			}
		}
	});

})
	
