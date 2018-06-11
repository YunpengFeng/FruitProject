package com.nchu.fruit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Admins;
import com.nchu.fruit.pojo.DirtyPool;
import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.utils.PaginationOther;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface AdminsService {
	
	//通过账号得到用户信息
	Admins getAdmins(String admin_id,String password);
	
	
	//修改商户信息
	int updateInfo(Admins admin);
	
	//修改登入用户权限
	int updateRole(String admin_id  );
	
	//添加注册商户的信息
	int addAdmins(Admins admin);
		
	//买家登入
	Users queryUser(String userid, String password);
	
	
	
	//用户和管理员的账户管理
	JSONArray getAccount(String type, String currentpage,String scontent);

	//批量管理之库存
	JSONArray batchManager(String type,String currentpage,String size , String amount, String scontent);

	
	int updateAmount(String string, String shezhiamount);

	//批量管理之上下架
	JSONArray batchManagerofshangxiajia(Map<String, Object> map);


	int updateFruit_states(String string, String obj);


	JSONArray batchManagerofOrders(Map<String, Object> map);

	//消息服务
	JSONArray serviceInfo(Map<String, Object> map);

	//批量管理之审核评论
	JSONArray batchManagerofDiscuss(Map<String, Object> map);
	
	//评论审核，发布状态
	int updatecomment_states(String string, String obj);

	//发货产生订单
	int produce_yundao(String danhao, String orderid);

	//催单处理
	JSONArray batchManagerofCuidan(Map<String, Object> map);

	 //统计月销售量(根据年限查询)
	List<Map<String, Object>> getMonthByYear(String year);

	//年销售量前十
	JSONArray countTopTenByYear(String year);

	//订单成交量
	JSONArray ordersSuccess(String year);


	int queryLastId();

	//添加水果
	int addFruit(Fruits fruit, String picname);

	 //权限修改
	int updateRole(String type, String role, String id);

	//验证重名
	int getCheck(String param, String type);

	//注册用户
	int addUsers(Users ruser);

	//管理员验证重名，账号
	int getCheckAadmin(String param, String type);


	String getIndexInfoList();

	//修改信息
	int updateInfoUser(Users ruser);


	int setMenuList(String userid, String liststr);


	int addImfo(String content,String valueOf,int num, int valueOf2, int valueOf3,String addman,String optype);


	FruitImfo querybyName(int parseInt);


	JSONObject getAllPool(HashMap<String, Object> map, PaginationOther pagination);


	int updatePool(String content, String id);


	int dirtyPoolOpration(String type, String content, String id);


	String updateMoney(String users_id, String totalmoney);

}
