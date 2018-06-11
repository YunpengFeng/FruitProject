<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="js/slide/less/reset.css">
    <link rel="stylesheet" href="js/slide/less/slide.css">
    <link rel="stylesheet" href="js/slide/less/index.css">
      
</head>
<body>
<header>
    <div class="banner" style="margin-top:11px">
       
        <div id="slide3d" class="slide-carousel slide-3d">
            <ul  class="item-list clearfix">
              <li class="item0">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="fruitImages/10019_ (1).png" alt="">
                        </a>
                    </div>
                </li>
                <li class="item1">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="fruitImages/10012_ (1).png" alt="">
                        </a>
                    </div>
                </li>
                <li class="item2">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="fruitImages/10019_ (1).png" alt="">
                        </a>
                    </div>
                </li>
               <li class="item3">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="js/slide/image/p2.jpg" alt="">
                        </a>
                    </div>
                </li>
                <li class="item4">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="js/slide/image/p1.jpg" alt="">
                        </a>
                    </div>
                </li>
              
                <li class="item5">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="fruitImages/10013_ (1).png" alt="">
                        </a>
                    </div>
                </li>
                <li class="item6">
                    <div class="item-content">
                        <a href="javascript:void(0);">
                            <img class="cover-img" src="fruitImages/10012_ (1).png" alt="">
                        </a>
                    </div>
                </li>
            </ul>
            <!--indicators-->
            <div class="indicator-list">
                <a href="javascript:void(0);" data-slide-index="0"></a>
                <a href="javascript:void(0);" data-slide-index="1"></a>
                <a href="javascript:void(0);" data-slide-index="2"class="selected"></a>
                <a href="javascript:void(0);" data-slide-index="3"></a>
                <a href="javascript:void(0);" data-slide-index="4"></a>
                <a href="javascript:void(0);" data-slide-index="5"></a>
                <a href="javascript:void(0);" data-slide-index="6"></a>  
            </div>
            <!--controls-->
            <div class="controls">
                <a  class="item-prev glyphicon glyphicon-menu-left" href="javascript:void(0);"></a>
                <a  class="item-next glyphicon glyphicon-menu-right" href="javascript:void(0);"></a>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
$(function(){
    //3d
     $('#slide3d').slideCarsousel({slideType:'3d',indicatorEvent:'mouseover'});
    $.ajax({
    	method:'post',
		url:'slideshow',
		datatype:'json',
		success:function(_data){
			//获取轮播相关的数据
			var count = 0  
			/* 因为返回的格式是 json类型 ，要转一下 */
			var data = $.parseJSON(_data)
			for(var x in data){
				if(count<3)    
					 $(".item"+count+"").find("a").prop("href",'product?id='+data[x].fruit_id); 
				else if(count<5)
					$(".item"+count+"").find("a").prop("href","fruitstypeimfomations?type="+data[x].t);
				else
					$(".item"+count+"").find("a").prop("href",'product?id='+data[x].fruit_id);
				count ++;
			}
        }	
    })
});
</script>
</body>
</html>

