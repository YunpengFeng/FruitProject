package com.nchu.fruit.service;

import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Cars;
import com.nchu.fruit.pojo.Items;
import com.nchu.fruit.pojo.Orders;

import net.sf.json.JSONArray;

public interface OrderAndCarService {
	//添加到购物车
	 int addcar(int amount, int id, String users_id);

	//小购物车
	public List<Map<String, String>> queryCarTen(String users_id) ;
	
	//加载购物车所有物品
	List<Map<String, String>>  getMapListCarAll(String users_id);
	//异步修改购物车的数据
	int updateCar(Cars car);
	
	//产生订单
	 int addOrder(String orderid, String users_id, String time,String info);
	 
	//根据前端购物车拼接的字符串查询买的东西
	 List<Map<String, String>> getcarItem(String info);
	 
	 //修改订单表
	 String updateOrderById(String orderid, String info, String address, String phone,String userid,String man);
	
	 //订单管理页面
	 JSONArray doManager(String users_id, String type) ;
	 
	 //根据编号查询订单
	 Orders queryOrdersById(String orders_id);
	 
	 //订单详情
	 List<Items> getOrdersItems(String orderid);
	 
	 //修改订单状态
	 int updatStates(String orderid, String type);
	 
	 //增加评论和修改详情评论状态
	 int addDiscuss(String num, String content, String itemid,String userid,String picname);
	 
	 //返回水果的评论
	 List<Map<String,String>> getDicussByFruit(String fruitid);

	 	//移到收藏夹,购物车删除
	int oparetionMove(String type, String id,String userid);

	//催单
	int outOrders(Map<String, Object> map);

	String getManagerOfAmount(Map<String, String> map);

	int cancle_order(Map<String, Object> map);
	 
}
