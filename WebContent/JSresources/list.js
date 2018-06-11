
$(document).ready(function(){
	load =function(obj){
		//alert(obj);
		//设置变量记录当前第几次点击（第几页）每次点击一次都要加一
		var pages = $("#page").val();
		
		$.ajax({
			method:'post',
			url:'loadmore?type='+obj+'&page='+pages,
			datatype:'json',
			success:function(e){
				var html ="";
				//alert("当前数据e"+e+"当前页\\\p"+pages);
				var a =eval("("+ e +")");
				 if(a.meg !="none"){
					for(var i in a){
						 html +='<a href="product?id='+a[i].id+'">' +
						 		'<div class="cell"><img src="fruitImages/'+a[i].id+'_ (1).png"><dd>'+a[i].name;
						 if(obj=='3')
							 html +='<h5 style="margin-left:30px">('+a[i].place.substr(a[i].place.indexOf("f")+1,a[i].place.length)+')</h5>'
						 html += '</dd> <dt>￥'+a[i].sprice+'</dt><del>￥'+a[i].price+'</del>   </div></a>';
					}
					//alert(html);
					$("#domore").append(html);
					 $("#page").attr("value",Number(pages)+1);
				 }else{
					 $("#hit").text("已加载全部数据");
					// $("#ban").
					    $("#ban").removeAttr("onclick");  
				 }
				
			}
		});
		
	}
	
	
})