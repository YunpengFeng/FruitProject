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
<title>账号管理</title>

<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script src="js/toastr/toastr.js"></script>
<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="JSresources/bjs/accountManager.js"></script>

<link rel="stylesheet"
	href="js/bootstrap-3.3.7/dist/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<link href="css/bcss/accountManager.css" rel="stylesheet">
</head>
<body>
	<div class="inner">
		<jsp:include page="/WEB-INF/Jsp/behindJsp/common.jsp" flush="false" />
		
		<div class="r">
			<!-- 管理员权限设置 -->
			<div class="content">
			<input type="hidden" id="type" value="${type}">
				<c:if test="${type=='11'||type=='12'||type=='14'}">
					<form action="accountManager" method="post">
						<input type="text" id="scontent" name ="scontent"placeholder="输入信息搜索" value="${scontent}"
							style="width: 400px; height: 50px; border: 2px solid black; margin-bottom: 50px; letter-spacing: 2px; padding-left: 20px; margin-left: 30%">
						<input type="submit" style="margin-left: 20px; height: 40px"
							value="搜索"> <input type="hidden" id="type" name="type" value="${type}">
							<input type="hidden" id="currentpage" name="currentpage" value="1">
						<c:if test="${type=='11'}">

							<table width="800px" border="4px"
								style="text-align: center; margin-left: 100px">
								<tr
									style="font-size: 18px; font-weight: bold; font-family: cursive; padding: 5px">
									<td>商家账号</td>
									<td>商家名称</td>
									<td>审核状态</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${info}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr>
											<td>${obejct.admin_id}</td>
											<td>${obejct.admin_name}</td>
											<c:if test="${obejct.admin_register==0}">
												<td><b style="color: red">未通过</b></td>
											</c:if>
											<c:if test="${obejct.admin_register==1}">
												<td><b style="color: green">通过</b></td>
											</c:if>
											<td><c:if test="${obejct.admin_register==0}">
													<input type="button" value="批准"onclick="updateRole(11,12,${obejct.admin_id})">
												</c:if> <c:if test="${obejct.admin_register==1}">
													<input type="button" value="禁用"onclick="updateRole(11,11,${obejct.admin_id})">
												</c:if><input type="button" value="删除"onclick="updateRole(11,13,${obejct.admin_id})">
												<input type="button" value="菜单配置"onclick="MenuConfig(${obejct.admin_id},${obejct.admin_pass})">
											</td>
												
										</tr>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="4">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="accountManager?currentpage=${x}&type=${type}&scontent=${scontent}&of=1">${x}</a></li>
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
						</c:if>

						<!--管理员对用户的权限设置  -->
						<c:if test="${type=='12'}">

							<table width="800px" border="4px" style="text-align: center">
								<tr
									style="font-size: 18px; font-weight: bold; font-family: cursive; padding: 5px; margin-left: 200px">
									<td>顾客账号</td>
									<td>商家名称</td>
									<td>使用状态</td>
									<td>顾客操作</td>
								</tr>
								<c:forEach items="${info}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr>
											<td>${obejct.users_id}</td>
											<td>${obejct.user_name}</td>
											<c:if test="${obejct.ban_states==0}">
												<td><b style="color: green">可用</b></td>
											</c:if>
											<c:if test="${obejct.ban_states==1}">
												<td><b style="color: red">禁用</b></td>
											</c:if>
											<td><c:if test="${obejct.ban_states==0}">
													<input type="button" value="禁用"onclick="updateRole(10,11,${obejct.users_id})">
												</c:if> <c:if test="${obejct.ban_states==1}">
													<input type="button" value="解除"onclick="updateRole(10,12,${obejct.users_id})">
												</c:if></td>
										</tr>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="4">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="accountManager?currentpage=${x}&type=${type}&scontent=${scontent}&of=1">${x}</a></li>
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
						</c:if>
						
						<c:if test="${type=='14'}">
							<table width="900px" border="4px" style="text-align: center">
								<tr>
									<td>水果编号</td>
									<td>水果名</td>
									<td style="width:20px">库存数量(件)</td>
									<td>售价(元)</td>
									<td>产地</td>
									<td style="width:126px">上架日期</td>
									<td style="width:20px">保鲜期(天)</td>
									<td style="width:52px">上架</td>
									<td style="width:160px">操作</td>
								</tr>
								<c:forEach items="${info}" var="obejct" varStatus="status">
									<!--表格数据  -->
									<c:if test="${!status.last}">
										<tr>
											<td>${obejct.fruit_id}</td>
											<td>${obejct.fruit_name}</td>
											<td>${obejct.fruit_amount}</td>
											<td>${obejct.fruit_sellprice}</td>
											<td>${fn:replace(obejct.fruit_place, 'f','(外国)')}</td>
											<td>${fn:substring(obejct.fruit_time, 0, 10)}</td>
											<td>${obejct.fruit_date}</td>
											<c:if test="${obejct.fruit_states==1}">
												<td><b style="color: red">下架</b></td>
											</c:if>
											<c:if test="${obejct.fruit_states==0}">
												<td><b style="color: green">上架</b></td>
											</c:if>
											<td><c:if test="${obejct.fruit_states==0}">
													<input type="button" value="下架"onclick="shangjia(${obejct.fruit_id},00)">
												</c:if> <c:if test="${obejct.fruit_states==1}">
													<input type="button" value="上架" onclick="shangjia(${obejct.fruit_id},11)">
												</c:if> <input type="button" value="修改"
												onclick="tan(${obejct.fruit_id})">
												<input type="button" value="置顶" onclick="setTop(${obejct.fruit_id})"></td>
										</tr>
									</c:if>

									<c:if test="${status.last}">
										<!-- 分页 -->
										<tr>
											<td colspan="9">
												<ul>
													<c:forEach begin="1" end="${obejct.totalPage}" step="1"
														var="x">
														<li><a
															href="accountManager?currentpage=${x}&type=${type}&scontent=${scontent}&of=1">${x}</a></li>
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
						</c:if>
					</form>
				</c:if>
				
				<!--密码设置  -->
				<c:if test="${type=='13'}">
							<input  type="hidden" id="pass" value="${admin.admin_pass}">
							<table width="600px" border="2px" style="text-align: center">
								<tr>
									<td>账户</td>
									<td><input type="text"  id="admin_account"value="${admin.admin_id }" readonly="readonly"></td>
								</tr>
								<tr>
									<td>账户名</td>
									<td><input type="text"  id="admin_name"value="${admin.admin_name }" ></td>
								</tr>
								<tr>
									<td>原密码</td>
									<td><input type="password" id="admin_pass"><span style="color:red" id="tishi"></span></td>
								</tr>
								<tr>
									<td>新密码</td>
									<td><input type="password" id="admin_newpass"></td>
								</tr>
								<tr>
									<td>再次确认</td>
									<td><input type="password" id="admin_newagin"><span style="color:red" id="tishi2"></span></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="提交" onclick="submits()"></td>
								</tr>
							</table>
				</c:if>
				
			</div>
		</div>

	</div>
	<!--修改水果悬浮框  -->
	<div class="lightbox">
	</div>
	
	<div class="contran">
		<!--菜单配置悬浮框  -->
		<div  id="menu">
			<span>账号：</span><input type="text" readonly="readonly" id="userid" >
			<span>姓名：</span><input type="text" readonly="readonly" id="username" >
			<hr>
			<div class="menutable">
			</div>
		</div>
	</div>
</body>
</html>