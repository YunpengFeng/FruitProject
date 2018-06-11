<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.nchu.fruit.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络水果销售平台</title>
<link href="css/bcss/batchManager.css" rel="stylesheet">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="JSresources/bjs/batchManager.js"></script>
<script type="text/javascript" src="js/jquery.barcode.js"></script>

</head>
<body>
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		<div class="r">
			<div class="content">
				<c:if test="${map.type=='16'}">
					<form action="batchManager" method="post">
						<input type="hidden"name="currentpage" value="1">
						<input type="hidden"name="type" id="type"value="${map.type}">
							<label style="margin-left: 0px">每页数量</label>
								<select name="size" >
								<option selected>10</option><option selected>20</option><option >30</option><option >40</option><option >50</option><option >80</option><option >100</option><option selected >${map.size}</option>
						    	</select>
							<label style="margin-left: 20px">库存低于量</label>
							<select name="amount" id="amounts" >
							<option selected>40</option><option >50</option><option >80</option><option >100</option>	<option >200</option><option selected >${map.amount}</option>
							</select>
							<input style="margin-left: 20px width:300px" type="text" id="scontent" name ="scontent"placeholder="输入信息搜索" value="${map.scontent}">
							<input type="submit"value="查询条件">
							
							<label style="margin-left: 10px">设置库存量</label>
							<input style="width:50px" name="shezhiamount" id="shezhi" type="text"> 
							<!-- <select name="shezhiamount" id="shezhi">
									<option selected>100</option><option>150</option><option>200</option><option>250</option><option>300</option><option>400</option>
							</select> -->
							<a href ="javascript:void(0)" onclick="shezhi()">设置</a>
					</form>
					
					<div style="margin-top: 30px;margin-left: 40px">
					
						<table width="900px" border="4px" style="text-align: center">
								<tr>
									<td>全选<input id="all" name="ack"type="checkbox"><br>取消<input id="cancelall" name="cck" type="checkbox"></td>
									<td>水果编号</td>
									<td>水果名</td>
									<td>库存数量(件)</td>
								</tr>
								<c:forEach items="${list}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr>
											<td><input name ="ck"type="checkbox" value="${obejct.fruit_id}"></td>
											<td>${obejct.fruit_id}</td>
											<td>${obejct.fruit_name}</td>
											<td>${obejct.fruit_amount}</td>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="batchManager?currentpage=${x}&type=${map.type}&scontent=${map.scontent}&size=${map.size}&amount=${map.amount}&of=1">${x}</a></li>
													</c:forEach>
												</ul> &nbsp; &nbsp; &nbsp;<em>共有数据<b>${obejct.totalCount}</b>条
											</em>; <em>共<b>${obejct.totalPage}</b>页
											</em>; <em>当前第<b>${obejct.currentPage}</b>页
											</em>;
											</td>
										</tr>
									</c:if>

								</c:forEach>
							</table>
					
					</div>
				</c:if>
				<!--上下架管理'  -->
				<c:if test="${map.type=='18'}">
					<form action="batchManagerofshangxiajia" method="post">
						<input type="hidden"name="currentpage" value="1">
						<input type="hidden"name="type" id="type"value="${map.type}">
							<label style="margin-left: -70px">每页数量</label>
								<select name="size">
										<option>10</option><option>20</option><option>30</option><option>40</option><option>50</option>
									<option>80</option><option>100</option><option selected>${map.size}</option>
						    	</select>
						<c:if test="${map.values=='00' }">
							<label style="margin-left: 20px">已上架</label>
							<input type="radio" value="00" name="values" checked="checked">
							<label style="margin-left: 10px">已下架</label>
							<input type="radio" value="11" name="values">
						</c:if>
						<c:if test="${map.values=='11'}">
							<label style="margin-left: 20px">已上架</label>
							<input type="radio" name="values" value="00">
							<label style="margin-left: 10px">已下架</label>
							<input type="radio" value="11" name="values" checked="checked">
						</c:if>

						<label style="margin-left: 20px;margin-top: 10px">上架日期</label>
							<input name="startdata" value="${map.startdata}"style="margin-left: 5px;margin-top: 10px ;width:100px " type="text">&nbsp;&nbsp;至&nbsp;&nbsp;
							<input   name="enddata" value="${map.enddata}"style="margin-top: 10px;width:100px"type="text">
							
							<input style="margin-left: 10px; width:160px;padding-left:10px" type="text" id="scontent" name ="scontent"placeholder="输入信息搜索" value="${map.scontent}">
							<input type="submit"value="查询条件">
							&nbsp;&nbsp;<c:if test="${map.values=='00' }"><a style="width:150px;padding:3px;background-color:gray;"href ="javascript:void(0)" onclick="shangjia(${map.values})">批量下架</a></c:if>
							&nbsp;&nbsp;<c:if test="${map.values=='11' }"><a style="width:150px;padding:3px;background-color:gray;" href ="javascript:void(0)" onclick="shangjia(${map.values})">批量上架</a></c:if><br>
					</form>
					<div style="margin-top: 30px;margin-left: 40px">
					
						<table width="900px" border="4px" style="text-align: center;margin-left: -80px;">
								<tr>
									<td>全选<input id="all" name="ack"type="checkbox"><br>取消<input id="cancelall" name="cck" type="checkbox"></td>
									<td>水果编号</td>
									<td>水果名</td>
									<td>上架状况</td>
									<td>上架日期</td>
									<td>保鲜期</td>
								</tr>
								<c:forEach items="${list}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr>
											<td><input name ="ck"type="checkbox" value="${obejct.fruit_id}"></td>
											<td>${obejct.fruit_id}</td>
											<td>${obejct.fruit_name}</td>
											<c:if test="${map.values=='00' }"><td style="color:green">已上架</td></c:if>
											<c:if test="${map.values=='11' }"><td style="color:red">已下架</td></c:if>
											<td>${obejct.fruit_time}</td>
											<td>${obejct.fruit_date}</td>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="batchManagerofshangxiajia?currentpage=${x}&type=${map.type}&scontent=${map.scontent}&size=${map.size}&values=${map.values}&enddata=${map.enddata}&startdata=${map.startdata}&of=1">${x}</a></li>
													</c:forEach>
												</ul> &nbsp; &nbsp; &nbsp;<em>共有数据<b>${obejct.totalCount}</b>条
											</em>; <em>共<b>${obejct.totalPage}</b>页
											</em>; <em>当前第<b>${obejct.currentPage}</b>页
											</em>;
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
					 </div>
				</c:if>
				
				<!--订单管理'  -->
				<c:if test="${map.type=='17'}">
						<form action="batchManagerOrder" method="post">
						<input type="hidden"name="currentpage" value="1">
						<input type="hidden"name="type" id="type"value="${map.type}">
							<label style="margin-left: -20px">每页数量</label>
								<select name="size">
									<option>10</option><option>20</option><option>30</option><option>40</option><option>50</option>
									<option>80</option><option>100</option><option selected>${map.size}</option>
						    	</select>
						    <input type="hidden" id="vas"value="${map.vals}">
							<label style="margin-left: 20px">已支付</label><input type="radio" value="10" name="vals">
							<label style="margin-left: 10px">未支付</label><input type="radio" value="11" name="vals">
							<label style="margin-left: 20px">已发货</label><input type="radio" name="vals" value="12">
							<label style="margin-left: 10px">未发货</label><input type="radio" value="13" name="vals" >
							<label style="margin-left: 20px">已收货</label><input type="radio" name="vals" value="14">
							<label style="margin-left: 10px">未收货</label><input type="radio" value="15" name="vals">
							<label style="margin-left: 10px">退货申请</label><input type="radio" value="16" name="vals">
							<br>
						
						<label style="margin-left: -20px;margin-top: 10px">订单日期</label>
							<input name="startdata" value="${map.startdata}"style="margin-left: 5px;margin-top: 10px ;width:100px " type="text">&nbsp;&nbsp;至&nbsp;&nbsp;
							<input   name="enddata" value="${map.enddata}"style="margin-top: 10px;width:100px"type="text">
							
							<input style="margin-left: 10px; width:200px;padding-left:10px" type="text" id="scontent" name ="scontent"placeholder="输入信息搜索（订单号/账户名）" value="${map.scontent}">
							<input type="submit"value="查询条件">
						<%-- 	&nbsp;&nbsp;<c:if test="${map.values=='00' }"><a style="width:150px;padding:3px;background-color:red;"href ="javascript:void(0)" onclick="shangjia(${map.values})">批量下架</a></c:if>
							&nbsp;&nbsp;<c:if test="${map.values=='11' }"><a style="width:150px;padding:3px;background-color:red;" href ="javascript:void(0)" onclick="shangjia(${map.values})">批量上架</a></c:if><br>
					 --%></form>
					<div style="margin-top: 30px;margin-left: 40px">
					
						<table width="900px" border="4px" style="text-align: center;margin-left: -80px;">
								<tr>
									<td>全选<input id="all" name="ack"type="checkbox"><br>取消<input id="cancelall" name="cck" type="checkbox"></td>
									<td>订单编号</td>
									<td>用户</td>
									<td>购买时间</td>
									<td>客户支付状况</td>
									<td>发货状况</td>
									<td>客户收货状况</td>
									<td>操作</td>
								</tr>
								
								 <c:forEach items="${list}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr id="${obejct.orders_id}">
											<td><input name ="ck"type="checkbox" value="${obejct.fruit_id}"></td>
											<td>${obejct.orders_id}</td>
											<td>${obejct.user_name}</td>
											<td>${obejct.order_time}</td>
											
											<c:if test="${obejct.pay_states=='1' }"><td style="color:green">已支付</td>
													<c:if test="${obejct.out_states=='1' }"><td style="color:green">已发货</td>
														<c:if test="${obejct.get_states=='1' }"><td style="color:green">已收货</td></c:if>
													    <c:if test="${obejct.get_states=='0' }"><td style="color:red">未收货</td></c:if>
													</c:if>
													<c:if test="${obejct.out_states=='0' }"><td style="color:red">未发货
																	</td><td style="color:red">———</td>
													</c:if>
											</c:if>
											
											<c:if test="${obejct.pay_states=='0' }"><td style="color:red">未支付</td>
												<td style="color:red">———</td>
												<td style="color:red">———</td>
											</c:if>
											
											
										
											
											<td>
												<c:if test="${map.vals!='11'}">
													<input type="button" value="展开详情" onclick="opendetail('${obejct.orders_id}')">
												</c:if> 
												<c:if test="${map.vals=='13'}">
													<input type="button" value="发货" onclick="sendgoods('${obejct.orders_id}')">
												</c:if>
												<c:if test="${map.vals=='16'}">
													<input type="button" value="审核通过" onclick="cancle_order(14,'${obejct.orders_id}')">
												</c:if>
											</td>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="batchManagerOrder?currentpage=${x}&type=${map.type}&scontent=${map.scontent}&size=${map.size}&vals=${map.vals}&enddata=${map.enddata}&startdata=${map.startdata}&of=1">${x}</a></li>
													</c:forEach>
												</ul> &nbsp; &nbsp; &nbsp;<em>共有数据<b>${obejct.totalCount}</b>条
											</em>; <em>共<b>${obejct.totalPage}</b>页
											</em>; <em>当前第<b>${obejct.currentPage}</b>页
											</em>;
											</td>
										</tr>
									</c:if>
								</c:forEach> 
							</table>
					 </div>
				</c:if>
				
				<!--审核批量管理  -->
					<c:if test="${map.type=='24'}">
					<form action="batchManagerDiscuss" method="post">
						<input type="hidden"name="currentpage" value="1">
						<input type="hidden"name="type" id="type"value="${map.type}">
							<label style="margin-left: 0px">每页数量</label>
								<select name="size" >
								<option selected>10</option><option selected>20</option><option >30</option><option >40</option><option >50</option><option >80</option><option >100</option><option selected >${map.size}</option>
						    	</select>&nbsp;&nbsp;&nbsp;
						    	<!-- 暂时只用下拉框表示 ，第一次为空-->
						    		星级数&nbsp;&nbsp;<select name="xing">
									<option></option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
									<option>6</option><option selected>${map.xing}</option>
						    	</select>
							 <input type="hidden" id="state"value="${map.state}">
							<label style="margin-left: 20px">已审核</label><input type="radio" value="10" name="state">
							<label style="margin-left: 10px">未审核</label><input type="radio" value="11" name="state">
							<label style="margin-left: 20px">已发布</label><input type="radio" value="12" name="state">
							<label style="margin-left: 10px">未发布</label><input type="radio" value="13" name="state">
							<br>
							<div style="margin-top: 15px"></div>
							<label style="margin-left: -20px;margin-top: 10px">评论日期</label>
							<input name="startdata" value="${map.startdata}"style="margin-left: 5px;margin-top: 10px ;width:100px " type="text">&nbsp;&nbsp;至&nbsp;&nbsp;
							<input   name="enddata" value="${map.enddata}"style="margin-top: 10px;width:100px"type="text">
							<input style="margin-left: 20px width:300px" type="text" id="scontent" name ="scontent"placeholder="只能输入准确账号才能查询" value="${map.scontent}">
							<input type="submit"value="查询条件">
							<c:if test="${map.state=='11'}">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="javascript:void(0)" onclick="batchOparetion(11)">批量发布</a>
									&nbsp;&nbsp;&nbsp;<a href ="javascript:void(0)" onclick="batchOparetion(12)">批量审核</a>
							</c:if>
							
							<c:if test="${map.state=='12'||map.state=='10'}">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="javascript:void(0)" onclick="batchOparetion(13)">批量不发布</a>
							</c:if>
							<c:if test="${map.state=='13'||map.state=='10'}">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="javascript:void(0)" onclick="batchOparetion(11)">批量发布</a>
							</c:if>
							
					</form>
					
					<div style="margin-top: 30px;margin-left: 40px">
					
						 <table width="900px" border="4px" style="text-align: center">
								<tr>
									<td>全选<input id="all" name="ack"type="checkbox"><br>取消<input id="cancelall" name="cck" type="checkbox"></td>
									<td>编号</td>
									<td>用户账号</td>
									<td>星级数</td>
									<td>日期</td>
									<td>评论内容</td>
									<td>图片</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${list}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr id="${obejct.item_id}">
											<td><input name ="ck"type="checkbox" value="${obejct.item_id}"></td>
											<td>${obejct.item_id}</td>
											<td>${obejct.users_id}</td>
											<td>${obejct.c_rank}</td>
											<td>${obejct.c_date}</td>
											<td>${obejct.content}</td>
											<td>${obejct.c_images}</td>
											<%-- <td>${obejct.c_states}+${obejct.p_states}</td> --%>
											 <td>
												<c:if test="${obejct.c_states==1}">
														<c:if test="${obejct.p_states==1}">
																<input type="button" value="不发布" onclick="Oparetion(${obejct.item_id},13)">
														</c:if>
														<c:if test="${obejct.p_states==0}">
															<input type="button" value="发布" onclick="Oparetion(${obejct.item_id},11)">
														</c:if>
												</c:if>
												<c:if test="${obejct.c_states=='0'}">
													<input type="button" value="审核" onclick="Oparetion(${obejct.item_id},12)" style="">
													<input type="button" value="发布" onclick="Oparetion(${obejct.item_id},11)">
												</c:if>
												
											</td> 
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="batchManagerDiscuss?currentpage=${x}&type=${map.type}&scontent=${map.scontent}&size=${map.size}&state=${map.state}&xing=${map.xing}&enddata=${map.enddata}&startdata=${map.startdata}&of=1">${x}</a></li>
													</c:forEach>
												</ul> &nbsp; &nbsp; &nbsp;<em>共有数据<b>${obejct.totalCount}</b>条
											</em>; <em>共<b>${obejct.totalPage}</b>页
											</em>; <em>当前第<b>${obejct.currentPage}</b>页
											</em>;
											</td>
										</tr>
									</c:if>

								</c:forEach>
							</table> 
					
					</div>
				</c:if>
				
				<!--***************催单记录管理********  -->
				
				<c:if test="${map.type=='20'}">
							<form action="batchManagercuidan" method="post">
						<input type="hidden"name="currentpage" value="1">
						<input type="hidden"name="type" id="type"value="${map.type}">
							<label style="margin-left: -20px">每页数量</label>
								<select name="size" >
								<option selected>10</option><option selected>20</option><option >30</option><option >40</option><option >50</option><option >80</option><option >100</option><option selected >${map.size}</option>
						    	</select>
							<label style="margin-left: 10px">催单次数范围</label>
							<select name="amounts" id="amounts" >
								<option selected value=""></option><option selected value="1">0~3</option><option value="2">4~6</option><option value="3">7~10</option>
								<c:if test="${map.amounts==0||map.amounts==null||map.amounts==''}"><option selected value=""></c:if>
								<c:if test="${map.amounts==1}"><option selected value="1">0~3</option></c:if>
								<c:if test="${map.amounts==2}"><option selected value="1">4~6</option></c:if>
								<c:if test="${map.amounts==3}"><option selected value="1">7~10</option></c:if>
							</select>
							<label style="margin-left: 10px;margin-top: 10px">评论日期</label>
							<input name="startdata" value="${map.startdata}"style="margin-left: 5px;margin-top: 10px ;width:100px " type="text">&nbsp;&nbsp;至&nbsp;&nbsp;
							<input   name="enddata" value="${map.enddata}"style="margin-top: 10px;width:100px"type="text">
							<input style="margin-left: 10px width:300px" type="text" id="scontent" name ="scontent"placeholder="输入订单账号模糊查询" value="${map.scontent}">
							<input type="submit"value="查询条件">
					</form>
					
					<div style="margin-top: 30px;margin-left: 40px">
					
						<table width="900px" border="4px" style="text-align: center">
								<tr>
									<td>全选<input id="all" name="ack"type="checkbox"><br>取消<input id="cancelall" name="cck" type="checkbox"></td>
									<td>订单编号</td>
									<td>购买账号</td>
									<td>催单次数</td>
									<td>操作</td>
								</tr>
								 <c:forEach items="${list}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr id="${obejct.orders_id}">
											<td><input name ="ck"type="checkbox" value="${obejct.orders_id}"></td>
											<td>${obejct.orders_id}</td>
											<td>${obejct.users_id}</td>
											<td>${obejct.callnumber}</td>
											<td>
													<input type="button" value="展开详情" onclick="opendetail('${obejct.orders_id}')">
													<input type="button" value="发货" onclick="sendgoods('${obejct.orders_id}')">
											</td>
											
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="batchManagercuidan?currentpage=${x}&type=${map.type}&scontent=${map.scontent}&size=${map.size}&amounts=${map.amounts}&enddata=${map.enddata}&startdata=${map.startdata}&of=1">${x}</a></li>
													</c:forEach>
												</ul> &nbsp; &nbsp; &nbsp;<em>共有数据<b>${obejct.totalCount}</b>条
											</em>; <em>共<b>${obejct.totalPage}</b>页
											</em>; <em>当前第<b>${obejct.currentPage}</b>页
											</em>;
											</td>
										</tr>
									</c:if>

								</c:forEach>
							</table>
					
					</div>
					
					
					
					
				</c:if>
			</div>
		</div>
		
		<!-- 详情展示 -->
		<div class="open" id="wind" > 
		
		</div>
	</div>
</body>
</html>