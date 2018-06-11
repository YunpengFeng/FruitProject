$(document).ready(function(){
	//水果大全
	/*$.ajax({
		type:'post',
		url:'JSresources/fruittype.json',
		datatype:'JSresources/json',
		success:function(e){
			//alert(e)
		var a = eval("("+ e + ")");
			var html="";
			for(var i in e){
			 html +=' <a href="type?id='+i+'">'+e[i].type+'</a>' ;
			}
			$("#type").html(html);
		}	
	});
	*/
	loadfruittype()
	
	/*异步加载*/

	//搜索框获得焦点，显示起来
	$(".search").focus(function(){
		$(".query").show();
	});
	//失去焦点清除
	//$(".search").blur(function(){
		//$(".query").empty();
	//});

	//自动补全,键盘弹起触发ajax
	$(".search").keyup(function(){
		var content=$(".search").val();
		$.ajax({
			type : "post", //传输方式
			data:{content:content},
			url:"ajaxSearch",
			datetype:"josn",
			success:function(e){
				var data=eval("("+e+")");
				//alert(e);
				$(".query").empty();
				$(".query").addClass("query1");
				var html="<ul>"
				 for(var i in data){
					 html+='<li>'+data[i].name+'</li>';
				 }
				html+="</ul>"
				
				$(".query").html(html);
				//点击<li>的可以自动搜索框
				$("li").click(function(){
					var litext =$(this).text();		
					$(".search").val(litext);
					//清除
					$(".query").empty();
					
				});
				
			},
			error:function(){
				alert("错误");
			}
			
		});
		
	});
	
})

function loadmore(){
$.ajax({
		   url: "JSresources/fruittype.json",
		   type: "GET",
		   dataType: "json", 
		   success: function(data) {
				var html="";
				flag = 1 
				 $.each(data, function(i, item) {
					 if(flag ==  0)
						 html +=' <a href="type?id='+item.number+'">'+item.type+'</a>' ;
					 if(item.number =='28')
						 flag = 0 
			       });
				html +=' <a href="javascript:void(0)" onclick="hidemore()" id="more"style="color:red;font-size:17px">隐藏∧</a>' ;
				$("#more").empty()
				$(".index").append(html);
		   }
	});
}

function hidemore(){
	loadfruittype()
}

function loadfruittype(){
	$.ajax({
		   url: "JSresources/fruittype.json",
		   type: "GET",
		   dataType: "json", 
		   success: function(data) {
				var html="<p>水果大全</p>";
				flag = 0 
				 $.each(data, function(i, item) {
					 if(flag ==  0)
						 html +=' <a href="type?id='+item.number+'" id="'+item.number+'">'+item.type+'</a>' ;
					 if(item.number =='28')
						 flag = 1 
			       });
					html +=' <a href="javascript:void(0)" onclick="loadmore()" id="more"style="color:red;font-size:17px">展开∨</a>' ;
				$(".index").html(html);
		   }
	});
}
	