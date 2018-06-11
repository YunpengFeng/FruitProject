$(document).ready(function(){
	
	var type=$("#type").val();
	var vas  = $("#vas").val();
	
	$("input[name=vals]").each(function() {
		if($(this).prop("value")==vas){
			$(this).prop("checked", "checked");
		/*	alert(vas==$(this).prop("value"));*/
			/*each没有	break; 用return*/
			return ;
		}
	});
	var state  = $("#state").val();
	//alert("ss"+state);
	$("input[name=state]").each(function() {
		if($(this).prop("value")==state){
			$(this).prop("checked", "checked");
		
			return ;
		}
	});
	
	
	$("#"+type+"").css("background","pink");
	//全选中事件
	$("#all").bind("click",function(){
		$("input[name=ck]").each(function() {
			$(this).prop("checked", true); 
		});
		$("input[name=cck]").prop("checked", false); 
		/*
		if (!$(":checkbox").prop("checked")) {
			$(":checkbox").prop("checked", true);
		} else {
			$(":checkbox").prop("checked", false);
		}*/
	});
	//全取消事件
$("#cancelall").bind("click",function(){
		
	$("input[name=ck]").each(function() {
		$(this).prop("checked", false); 
	});
	$("input[name=ack]").prop("checked", false); 
	});
	
	//设置库存数量提交
	shezhi =function(){
		var string="";
		/*var shezhiamount =$("#shezhi option:selected").text();*/
		var shezhiamount =$("#shezhi").val()
		if(!isNumber(shezhiamount)){
			alert("你输入的数值是非法值，请重新输入")
			return
		}
		var minamount  =$("#amounts option:selected").text();
			
			$("input[name=ck]").each(function() {
				if($(this).prop("checked")){
						var id =$(this).prop("value");
						string +=id+'#';
				}
			});
			if(string==null||string==''){
				alert("对不起，一个都没有，请选择复选框");
			}else{
				//发送得到的id拼接的字符串,设置值小于请求的最小值不予修改
				/*if(parseInt(shezhiamount)<parseInt(minamount)){
					alert("设置的值需要大于请求最小值")
				}else{*/
					$.ajax({
						method:'post',
						url:'updateAmount',
						datatype:'json',
						data:{"string":string,"shezhiamount":shezhiamount},
						success:function(a){
							var e= eval("("+a+")");
							if(e.meg=='ok'){
								toastr.success("修改成功");
								setTimeout(function(){location.reload()},1000); 
							}else{
								setTimeout(function(){location.reload()},1000); 
//								 window.location.reload();
								toastr.error("数据错误");
							}
						},
					
					});
				//}
			}
	}
	
	//设置上下架
	shangjia = function(obj){
		var string="";
			$("input[name=ck]").each(function() {
				if($(this).prop("checked")){
						var id =$(this).prop("value");
						string +=id+'#';
				}
			});
			if(string==null||string==''){
				alert("对不起，一个都没有，请选择复选框");
			}else{
					$.ajax({
						method:'post',
						url:'updateFruit_states',
						datatype:'json',
						data:{"string":string,"obj":obj},
						success:function(a){
							var e= eval("("+a+")");
							if(e.meg=='ok'){
								toastr.success("批量设置成功");
								setTimeout(function(){location.reload()},1000); 
							}else{
								setTimeout(function(){location.reload()},1000); 
								 /*window.location.reload();*/
								toastr.error("数据错误");
							}
						},
					
					});
				
			}
	}
	//展开详情
	opendetail =function(obj){
		$.ajax({
			method:'post',
			url:'getOrdersItems',
			datatype:'json',
			data:{"orderid":obj},
			success:function(e){
				var a=eval("("+e+")");
				var html='';
				
				for(var i  in a){
					if(i==0){
						html +='<table><caption>订单号：'+a[i].orders_id +'<img src="imgs/close.jpg" onclick="closes()">(<strong>总价:'+a[i].total+'元)</strong>';
						if(a[i].express!=null||a[i].express!=""){
							html +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运单号:'+a[i].express;
						}else{
							html +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运单号:&nbsp;&nbsp;&nbsp;暂未发货';
						}
						html +='</caption><tr><td>收件人</td><td>'+a[i].man+'</td><td>购买时间：</td><td colspan="2" align="center">'+a[i].order_time+'</td></tr>';
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
	//关闭窗口
	closes =function(){
		$("#wind").empty();
		/*toastr.error("你未做任何操作");*/
	}
	//发货详情
	sendgoods =function(obj){
		$.ajax({
			method:'post',
			url:'getOrdersItems',
			datatype:'json',
			data:{"orderid":obj},
			success:function(e){
				var a=eval("("+e+")");
				var html='';
				var orderid ='';
				for(var i  in a){
					if(i==0){
						orderid =a[i].orders_id;
						html +='<table><caption>订单号：'+a[i].orders_id +'<img src="imgs/close.jpg" onclick="closes()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<strong>总价:'+a[i].total+'元)</strong></caption><tr><td>收件人</td>';
						html +='<td>'+a[i].man+'</td><td>购买时间：</td><td colspan="2" align="center">'+a[i].order_time+'</td></tr>';
						html +='<tr><td>收件人地址</td><td colspan="4" align="center">'+a[i].address+'</td></tr>';
						break;
					}
				}
				var companys='<select><option selected>顺丰</option><option>天天快递</option><option>EMS</option><option>邮政速递</option><option>圆通</option><option>菜鸟快递</option><option>中通</option><option>顺通</option></select>';
				html +='<form action="productyundao"method="post"><tr><td colspan=2 id="danhao"></td><td><a href="javascript:void(0)"id="yundanhao"onclick="yundanhao()">产生运单号</a></td><td>快递公司'+companys+'</td></tr><tr><td colspan=4></tr></form>';
				html+='<tr><td colspan=2 ><div style="margin:10px 0px" id="tiaoxingma"></div></td><td colspan=2 id="ss"><a href ="#"onclick="sendGoods(\''+orderid+'\')">确认发货</a></td></tr></table>';
				console.log(html);
				$("#wind").html(html);
			  }
		});
  }
	//产生订单号
	yundanhao =function(){
		console.log("yundanhao最后会显示000,下面的不会"+new Date().getTime()/*Date.parse(new Date())*/);
		//模拟生成虚拟订单号,组成部分：2个[0-9]随机数+时间戳2个[0-9]随机数
		var rnd="";
		
	    for(var i=0;i<3;i++){
		    if(i==2){
		    	rnd +=new Date().getTime();   
		    }
	    rnd+=Math.floor(Math.random()*10);
	    }
	    
		$("#danhao").html(rnd);
		/*$("#tiaoxingma").html("aa");条形码生成不了啊， fack you ,I don't to do9 */
		/*$("#tiaoxingma").barcode(rnd, "ean13");*/
		$("#bcTarget").barcode("1234567890128", "code128");
	}
	
	//运单号发送后台
	sendGoods =function(orderid){
		var danhao = $("#danhao").html();
		if(danhao==null||danhao=="")
			alert("请产生订单号，点击'产生订单号'即可");
		else{
			$.ajax({
				method:'post',
				url:'produce_yundao',
				datatype:'json',
				data:{"danhao":danhao,"orderid":orderid},
				success:function(a){
					var e =eval ("("+a+")");
					if(e.meg=='ok'){
						
						$("#wind").empty();
						$("#"+orderid+"").empty();
						toastr.success("发货成功");
					/*	$("#"+itemid+"").empty();
*/					}else{
						setTimeout(function(){location.reload()},1000); 
/*						 window.location.reload();*/
						toastr.error("数据错误");
					}
				},
			
			});
		}
	}
	
	
	//批量操作js
	batchOparetion = function(pid){
		var string="";
		$("input[name=ck]").each(function() {
			if($(this).prop("checked")){
					var id =$(this).prop("value");
					string +=id+'#';
			}
		});
		
		if(string==null||string==''){
			alert("对不起，一个都没有，请选择复选框");
		}else{
				$.ajax({
					method:'post',
					url:'updatecomment_states',
					datatype:'json',
					data:{"string":string,"obj":pid},
					success:function(a){
						var e =eval ("("+a+")");
						if(e.meg=='ok'){
							toastr.success("批量设置成功");
							setTimeout(function(){location.reload()},1000); 
						}else{
							setTimeout(function(){location.reload()},1000); 
							 /*window.location.reload();*/
							toastr.error("数据错误");
						}
					},
				
				});
		}
	}
	
	//单一操作js
	Oparetion = function(itemid,pid){
		var string=itemid+'#';
				$.ajax({
					method:'post',
					url:'updatecomment_states',
					datatype:'json',
					data:{"string":string,"obj":pid},
					success:function(a){
						var e =eval ("("+a+")");
						if(e.meg=='ok'){
							toastr.success("设置成功");
							$("#"+itemid+"").empty();
						}else{
							/* window.location.reload();*/
							toastr.error("数据错误");
						}
					},
				
				});
		}
	
});

function isNumber(str) {
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) < 0x0030 || str.charCodeAt(i) > 0x0039) {
            return false;
        }
    }
    return true;
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
				toastr.success("操作成功,款项已经退回原账户")
				$("#"+orderid+"").empty();
			}
		}
	})
}
