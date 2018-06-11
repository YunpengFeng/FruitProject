/**
 * 
 */

$(function(){
	$(".index").empty();
	$.ajax({
		   url: "JSresources/fruittype.json",
		   type: "GET",
		   dataType: "json", 
		   success: function(data) {
				var html="<p>水果大全</p>";
				flag = 0 
				 $.each(data, function(i, item) {
						 html +=' <a href="javascript:void(0)"onclick="jump('+item.number+",'"+item.type+'\')" id="'+item.number+'">'+item.type+'</a>' ;
			       });
				$(".index").html(html);
		   }  
	});
	
	

})

function jump(num,type){
	  $("#"+num+"").css("background-color",'pink')
	/*("#"+num+"").css("background-color",'pink');*/
	$.ajax({
		   url: "fruitstypeimfomation",
		   type: "GET",
		   dataType: "json", 
		   data:{"type": num},
		   success: function(data) {
			   if(data.id ==0){
				   $(".contents").empty();
				   $(".contents").html("<div style='text-align:center ;height:500px;font-size: 36px;'>暂无&nbsp;"+type+"&nbsp;相关知识信息介绍</div>");
			   }else{
				   $(".contents").empty();
				   $(".contents").html(data.information);
			   }
			  
		   }
	})
			   
}
