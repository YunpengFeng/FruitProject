<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@page import="com.nchu.fruit.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站水果销售网站</title>
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo/demo.css">
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>

<link href="css/bcss/addproduct.css" rel="stylesheet">
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="JSresources/bjs/addproduct.js"></script>
</head>
<body>
	<div class="inner">
			<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
			<div class="r">
			<div class="content">
			<input type="hidden" value="${type}" id="type">
				<form action="addproject">
			<table width="800px" border="2px">
				<tr>
					<td><label>编号: </label></td>
					<td><input id="fruit_id" name="fruit_id"class="easyui-validatebox" data-options="required:true" readonly="readonly"></td>
					<td><label>所属种类: </label></td>
					<td>
					<!-- <input id="fruit_types" class="easyui-combobox" name="types" 
						data-options="valueField:'type', textField:'type' ,url:'JSresources/fruittype.json'">  -->
						 <select name ="fruit_type" id="fruit_type" style="width:110px">
						</select>
					</td>
				</tr>
				<tr>
					<td><label>水果名: </label></td>
					<td><input id="fruit_name" name="fruit_name"class="easyui-validatebox" data-options="required:true"></td>
					<td><label>数量: </label></td>
					<td>	<input type="text" class="easyui-numberbox" value="100" data-options="min:0"id="fruit_amount" name="fruit_amount">件</td>
				</tr>
				<tr>
					<td><label>水果进价: </label></td>
					<td><input id="fruit_enterprice" name="fruit_enterprice"class="easyui-validatebox" value="30" data-options="required:true">元</td>
					<td></td><td></td>
				</tr>
				<tr>
					<td><label>水果原价: </label></td>
					<td><input id="fruit_price" name="fruit_price"class="easyui-validatebox" data-options="required:true">元</td>
					<td><label>水果售价: </label></td>
					<td><input id="fruit_sellprice" name="fruit_sellprice"class="easyui-validatebox" data-options="required:true">元</td>
				</tr>
				<tr>
					<td><label>产地: </label></td>
					<td><input id="fruit_place" name="fruit_place"class="easyui-validatebox" data-options="required:true"><input type="radio"name="ra" value="11">进口<input type="radio" checked name="ra"  value="22">国产</td>
					<td><label>上架: </label></td>
					<td><select id="fruit_states" name="fruit_states"><option selected value="1">上架</option><option  value="2">下架</option></select></td>
				</tr>	
				
				<tr>
					<td><label>上架时间：</label></td>
					<td><input  type="text"  id="fruit_time" class="easyui-datetimebox"editable="false" ></td>	
					<td><label>保鲜期：</label></td>
					<td><input type="text" class="easyui-numberbox" value="200" data-options="min:0"id="fruit_date" name="fruit_date">天</td>
				</tr>
				<tr>
					<td><label>描述信息：</label></td>
					<td colspan="3"><input class="easyui-textbox" id="fruit_info"name="description" data-options="multiline:true" style="height:100px;width:100%"/></td>
				</tr>	
				<tr>
					<td rowspan="3"><label>图片区域:</label></td>
					<td colspan="3" rowspan="3">
					
					<table width="700px" border="2px" style="text-align: left">
							<tr height="150px" >
								<td colspan="5" id="picss">
									
								</td>
								
							</tr>
							<tr>
									<td colspan="2">
									<div class="fileInputContainer"><input class="fileInput" accept="image/*"  multiple="multiple"type="file" name=""></div>
									<td colspan="2"><button>预览</button></td>
									<td colspan="2"><input type="button" value="提交" onclick="submitForm()"></td>
							</tr>
							
						</table>
						 
					</td>
				</tr>
				</table>
				</form>
			</div>
	</div>
	</div>
		
</body>
</html>