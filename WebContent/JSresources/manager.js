$(document).ready(function(){
	
	var  type=$("#type").prop("value");
	$("#"+type+"").css("background-color","#ff4401");
	
	//星级评论初始化
	var array=$(".stras");//单引号 的name替换为相应的name
	for(var i=0;i<array.length;i++){
	 $(array[i]).raty({
         score:function() { 
             return $(this).attr('data-score'); 
         } ,
         
         click: function(score) {
        	 $(this).attr("data-score",score);
            // alert('ID: ' + this.id + "\nscore: " + score);
           },
         number: 6,
         starOn:'imgs/star-on.png',
         starOff:'imgs/star-off.png',
         starHalf:'imgs/star-half.png',
         cancelOff:'imgs/cancle-off.png',
         cancelOn:'imgs/cancle-on.png',
         readOnly:false,
         halfShow:true,
         size:40,
               
	 })
	}
/*	//备份发布评论
	sendDiscuss= function(itemid){
		//星星数量
		var  num = $("#stra"+itemid+"").attr("data-score");
		//评价内容
		var content =$("#area"+itemid+"").val();
		//alert("num"+num+"content"+content);
		//获取图片******先不写
		//var pic =$("#area"+itemid+"").val();
		$.ajax({
			type:'post',
			url:'discussItem',
			datatype:'json',
			data:{"num":num,"content":content,"itemid":itemid},
			success:function(a){
				var e=eval("("+a+")");
				if(e.meg=="ok"){
					$("#"+itemid+"").remove();
					toastr.success("评价成功");
				}
				if(e.meg=='error'){
					toastr.error("数据异常");
				}
			}
			
		});
		
	}*/
		//支付              
	pay = function(obj){
			window.location.href="fromManagerTopay?orders_id="+obj;
	}
	
	/*查看细节*/
	opendetails = function(obj){
			//alert("查看细节"+obj);
			$.ajax({
				type:'post',
				url:'getOrdersItems',
				datatype:'json',
				data:{"orderid":obj},
				success:function(e){
					var a=eval("("+e+")");
					var html='';
					
					for(var i  in a){
						if(i==0){
							html +='<table><caption>订单号：'+a[i].orders_id +'<img src="imgs/close.jpg" onclick="closes()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<strong>总价:'+a[i].total+'元)</strong></caption><tr><td>收件人</td>';
							html +='<td>'+a[i].man+'</td><td>购买时间：</td><td colspan="2" align="center">'+a[i].order_time+'</td></tr>';
							html +='<tr><td>收件人地址</td><td colspan="4" align="center">'+a[i].address+'</td></tr>';
							continue;
						}else
							html += '<tr><td><img src="fruitImages/'+a[i].fruit_id+'_ (1).png"></td><td>'+a[i].fruit_name+'</td><td>￥'+a[i].fruit_price+'</td><td>'+a[i].amount+'件</td><td>'+a[i].count+'RMB</td></tr>';
					}
					html+="</table>";
					console.log(html);
					$("#wind").html(html);
				
				}
			});
		}
	
		/*催单*/
		outOrders  = function(obj){
			$.ajax({
				type:'post',
				url:'outOrders',
				datatype:'json',
				data:{"orderid":obj ,"type":1},
				success:function(a){
					
					var e=eval("("+a+")");
					if(e.meg=="ok"){
						toastr.success("催单成功，已提醒商家");
					}
					if(e.meg=='error'){
						toastr.error("你的催单次数达到上限，系统管理员会联系商家尽快发货");
					}
				}
			});
		}
		
		/*收货*/
		getOrders = function(obj){
			$.ajax({
				type:'post',
				url:'updatStates',
				datatype:'json',
				data:{"orderid":obj ,"type":1},
				success:function(a){
					
					var e=eval("("+a+")");
					if(e.meg=="ok"){
						toastr.success("收货成功");
						$("#"+obj+"").remove();
					}
					if(e.meg=='error'){
						toastr.error("数据异常");
					}
				}
			});
		}
		
		//关闭
		closes =function(){
			$("#wind").empty();
		}
	
		
		//消息设置
		 var messageOpts = {
				            "closeButton" : true,//是否显示关闭按钮
				            "debug" : false,//是否使用debug模式
				              "positionClass" : "toast-top-center",//弹出窗的位置
				              "onclick" : null,
				             "showDuration" : "300",//显示的动画时间
				             "hideDuration" : "1000",//消失的动画时间
				             "timeOut" : "3000",//展现时间
				             "extendedTimeOut" : "1000",//加长展示时间
				             "showEasing" : "swing",//显示时的动画缓冲方式
				             "hideEasing" : "linear",//消失时的动画缓冲方式
				             "showtype" : "fadeIn",//显示时的动画方式
				             "hidetype" : "fadeOut" //消失时的动画方式
				        };
			 toastr.options = messageOpts;
			 
				//测试发布评论
				sendDiscuss= function(itemid){
					//星星数量
					var  num = $("#stra"+itemid+"").attr("data-score");
					//评价内容
					var content =$("#area"+itemid+"").val();
					
					var formData =new FormData();
					
					//得到img的图片张数
					var ping=""
					var ps =$("#picss"+itemid+"").find("img");
					if(ps.length==0)
						ping = "flag";
					else{
						ps.each(function(i){
							var s =$(this).prop("src");
							ping +=s.substr(s.lastIndexOf("/")+1,s.length)+"/";
						});
					}
					formData.append("picname",ping);
					
					formData.append("num",num);
					formData.append("content",content);
					formData.append("itemid",itemid);
					console.log("数据"+formData.toString());
					//alert("num"+num+"content"+content);
					//获取图片******先不写
					//var pic =$("#area"+itemid+"").val();
					$.ajax({
						processData: false,
						contentType: false,
						type:'post',
						url:'discussItem',
						datatype:'json',
						data:formData,
						success:function(a){
							var e=eval("("+a+")");
							if(e.meg=="ok"){
								$("#"+itemid+"").remove();
								toastr.success("评价成功");
							}
							if(e.meg=='error'){
								toastr.error("数据异常");
							}
						}
						
					});
					
				}
				       
				oparetion = function(type,id){
					$.ajax({
						type : 'post',
						url : 'oparetion',
						datatype : 'json',
						data : {"type":type,"id":id},
						success : function(e) {
							var a = eval("("+e+")");
							if(a.meg=='31'){
								$("#"+id+"").remove();
								toastr.success("移除成功！");
							}
						}
					});
				}     
				//管理页面数量获取
				$.ajax({
					type : 'post',
					url : 'ManagerOfAmount',
					datatype : 'json',
					success : function(e) {
						var a = eval("("+e+")");
						$("#all").html(a.all);
						$("#con").html(a.con);
						$("#send").html(a.send);
						$("#discuss").html(a.discuss);
						$("#pay").html(a.pay);
						$("#get").html(a.get);
					}
				});
})

	//增加图片,限制四张图片
	function sendPictrues(obj){
		var total=$("#picss"+obj+"").find("img").length;
		if(total<4){
			var  tempdata= new FormData();
			var file =$("#up"+obj+"")[0];
			for(var i=0; i<file.files.length;i++){
				tempdata.append('file[]', file.files[i]);
			}
			$.ajax({
				processData: false,
				contentType: false,
				method:'post',
				url:'tempFiles',
				data:tempdata,
				success:function(a){
					var e=eval("("+a+")");
					var html="";
					for(var i in e){
						var name = e[i].name;
						if(name.length>10){
							var s = name.substr(0,3)+".."+name.substr(name.indexOf("."),name.length);
							console.log(s);
							html += '<td><img src ="temp/'+name+'"><dd>'+s+'</dd></td>';
						}else{
							html += '<td><img src ="temp/'+name+'"><dd>'+name+'</dd></td>';
						}
					}
					console.log(html);
					$("#picss"+obj+"").append(html);	
				},
				error:function(){
					alert("失败");
				}
			})
		}else{
			toastr.error("超出上传图片张数，只限制四张");
		}
	}
	
	

	//修改用户信息
	function getinfo(){
		var pass =$("#pass").val();
		var phone =$("#phone").val();
		var passagain =$("#passagain").val();
		var address =$("#address").val();
		if(pass == ""||pass ==null){
			window.setTimeout (function(){$("#pass").focus();},0);
			toastr.error("请完善填写密码");
			return false;
		}
		if(passagain == ""||passagain ==null){
			window.setTimeout (function(){$("#passagain").focus();},0);
			toastr.error("请完善填写确认密码");
			return false;
		}
		if(phone == ""||phone ==null){
			window.setTimeout (function(){$("#phone").focus();},0);
			toastr.error("请完善填写联系方式");
			return false;
		}
		if(address == ""||address ==null){
			window.setTimeout (function(){$("#address").focus();},0);
			toastr.error("请完善填写地址");
			return false;
		}
		if(passagain != pass){
			$("#passa").html("确认密码不正确");
			window.setTimeout (function(){$("#passagain").focus();},0);
			return false;
		}else{
			$("#passa").html("");
		}
		return true;
	
	}

function infoSetting(){
	var  submits = getinfo();
	if(submits){
		$.ajax({
			type : 'post',
			url : 'updateInfoUser',
			datatype : 'json',
			data:{"pass":$("#pass").val() ,"phone":$("#phone").val() ,"address":$("#address").val()},
			success : function(e) {
				toastr.success("修改成功！");
				window.location.href="toLogin";
			}
		});
	}
	
}

function cancle_order(type,  orderid){
	$.ajax({
		type : 'post',
		url : 'cancle_order',
		datatype : 'json',
		data : {"type":type,"orderid":orderid},
		success : function(data) {
			console.log(data.meg);
			var a = $.parseJSON(data)
			if(a.meg=='ok'){
				if(a.type == '11'){
					$("#"+orderid+"").remove();
					toastr.success("订单取消成功！");
				}
				if(a.type == '12'){
					$("#c"+orderid+"").prop("value","等待审核");
					$("#c"+orderid+"").prop("onclick","");
					toastr.success("等待商家审核");
				}
				if(a.type == '13'){
					$("#c"+orderid+"").prop("value","取消订单");
					$("#c"+orderid+"").prop("onclick","cancle_order(12,'"+orderid+"')");
					toastr.success("取消成功");
				}
			}
		}
	});
}


$("#phone").bind("blur",function(){
	var str = $("#phone").val()
	if(str.length<11){
		alert("手机号不正确")
		return
	}
	  for (var i = 0; i < str.length; i++) {
	        if (str.charCodeAt(i) < 0x0030 || str.charCodeAt(i) > 0x0039) {
	            alert("输入手机号错误")
	        }
	    }
	    return true;
});
