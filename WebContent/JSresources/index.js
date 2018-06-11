$(document).ready(function(){
	
	
	//进口水果
	$.ajax({
		type:'post',
		url:'jinkou',
		datatype:'json',
		success:function(e){
		var a = eval("("+ e + ")");
		
			var html="";
			for(var i in a){
			 html+='<a href="product?id='+a[i].id+'">' +
			 		'<div class="cell"><img src="fruitImages/'+a[i].id+'_ (1).png"><dd>'+a[i].name+'<h5 style="margin-left:30px">('+a[i].place+')</h4></dd> <dt>￥'+a[i].sprice+'</dt><del>￥'+a[i].price+'</del>   </div></a>'
			}
			//alert(html);
			$("#in").html(html);
		}
	});
	
	//折扣水果
	$.ajax({
		type:'post',
		url:'zhekou',
		datatype:'json',
		success:function(e){
		var a = eval("("+ e + ")");
		
			var html="";
			for(var i in a){
			 html+='<a href="product?id='+a[i].fruit_id+'">' +
			 		'<div class="cell"><img src="fruitImages/'+a[i].fruit_id+'_ (1).png"></a><input id="bt"type="button"value="+"onclick="add('+a[i].fruit_id+')"><dd>'+a[i].fruit_name+'</dd> <dt>￥'+a[i].fruit_sellprice+'</dt><del>￥'+a[i].fruit_price+'</del>   </div>'
			}
			//alert(html);
			$("#zhekou").html(html);
		}
	});
	
	//新品上市
	$.ajax({
		type:'post',
		url:'news',
		datatype:'json',
		success:function(e){
		var a = eval("("+ e + ")");
		
			var html="";
			for(var i in a){
			 html+='<a href="product?id='+a[i].id+'">' +
			 		'<div class="cell"><img src="fruitImages/'+a[i].id+'_ (1).png"></a><input id="bt"type="button"value="+"onclick="add('+a[i].id+')"><dd>'+a[i].name+'</dd> <dt>￥'+a[i].sprice+'</dt><del>￥'+a[i].price+'</del>   </div>'
			}
			//alert(html);
			$("#total").html(html);
		}
	});
	
	//添加购物车
	add= function(id){
		var userid=$("#user").prop("value");
		if(userid==""){
			 toastr.warning("你尚未登入，请登入!");
		}else{
			$.ajax({
				type:'post',
				url:'addcarone',
				datatype:'json',
				data:{id:id},
				success:function(e){
					var m=eval("("+ e+")");
					if(m.meg=="ok")
						toastr.success('加入购物车成功');
				}
			});
		}
}
	
	//在底部显示推荐信息
	$.ajax({
		type:'post',
		url:'recommendToIndex',
		datatype:'json',
		data:{page:1},
		success:function(_data){
			var data = $.parseJSON(_data)
			var page = data[Object.keys(data).length-1].page;
			var html =""
			if(page == 1 )
				html ='<a href ="javascript:void(0)"onclick="recommendToIndex('+page+')"><img src="imgs/zuo.jpg"></a>';
			else
				html ='<a href ="javascript:void(0)"onclick="recommendToIndex('+(page-1)+')"><img src="imgs/zuo.jpg"></a>';
			for(var  i  in data){
				
				 if(i <(Object.keys(data).length-1))
					 html += '<a href="product?id='+data[i].fruit_id+'"><img src="fruitImages/'+data[i].fruit_id+'_ (2).png"></a>';
			 }
			 
			 html +='<a href ="javascript:void(0)"onclick="recommendToIndex('+(page+1)+')"><img src="imgs/you.jpg"></a>';
			$("#recommendToIndex").html(html);
		}
		
	})
	recommendToIndex = function(page){
		$.ajax({
			type:'post',
			url:'recommendToIndex',
			datatype:'json',
			data:{page:page},
			success:function(_data){
				var data = $.parseJSON(_data)
				var page = data[Object.keys(data).length-1].page;
				var html =""
				if(page == 1 )
					html ='<a href ="javascript:void(0)"onclick="recommendToIndex('+page+')"><img src="imgs/zuo.jpg"></a>';
				else
					html ='<a href ="javascript:void(0)"onclick="recommendToIndex('+(page-1)+')"><img src="imgs/zuo.jpg"></a>';
				for(var  i  in data){
					
					 if(i <(Object.keys(data).length-1))
						 html +=  '<a href="product?id='+data[i].fruit_id+'"><img src="fruitImages/'+data[i].fruit_id+'_ (2).png"></a>';
				 }
				 
				 html +='<a href ="javascript:void(0)"onclick="recommendToIndex('+(page+1)+')"><img src="imgs/you.jpg"></a>';
				$("#recommendToIndex").html(html);
			}
			
		})
	}
	
	//消息设置
	 var messageOpts = {
			            "closeButton" : true,//是否显示关闭按钮
			            "debug" : false,//是否使用debug模式
			              "positionClass" : "toast-bottom-center",//弹出窗的位置
			              "onclick" : null,
			             "showDuration" : "300",//显示的动画时间
			             "hideDuration" : "1000",//消失的动画时间
			             "timeOut" : "3000",//展现时间
			             "extendedTimeOut" : "1000",//加长展示时间
			             "showEasing" : "swing",//显示时的动画缓冲方式
			             "hideEasing" : "linear",//消失时的动画缓冲方式
			             "showMethod" : "fadeIn",//显示时的动画方式
			             "hideMethod" : "fadeOut" //消失时的动画方式
			        };
			       toastr.options = messageOpts;
			       	
			  
})
     
			     /*  消息样式
			      * toastr.info("你有新消息了!");    
			       
			       2 //成功消息提示，默认背景为浅绿色   
			       toastr.success("你有新消息了!");   
			         
			       3 //警告消息提示，默认背景为橘黄色   
			       toastr.warning("你有新消息了!");   
			         
			       4 //错误消息提示，默认背景为浅红色   
			       toastr.error("你有新消息了!");    
			         
			       5 //带标题的消息框  
			       toastr.success("你有新消息了!","消息提示");  */
			      /* 位置
			       * toast-top-left  顶端左边  
			       2 toast-top-right    顶端右边  
			       3 toast-top-center  顶端中间  
			       4 toast-top-full-width 顶端，宽度铺满整个屏幕  
			       5 toast-botton-right    
			       6 toast-bottom-left  
			       7 toast-bottom-center  
			       8 toast-bottom-full-width  
	
	*/

							