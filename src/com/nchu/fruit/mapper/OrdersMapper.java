package com.nchu.fruit.mapper;

import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Orders;

public interface OrdersMapper {
	//产生订单
	int addOrder(String orderid, String users_id, String time, String info);

	int upadateOrders(String orderid,String address, String phone, String man, float total,String info);

	List<Orders> getOrdersList(Map<String ,String> map);

	Orders getOrderById(String orders_id);

	int updatStates(Map<String, String> map);
	
	//批量之订单管理
	int getTotalByMap(Map<String, Object> map);
	List<Map<String, String>> getInfoByMap(Map<String, Object> map);
	
	//产生运单号
	int produce_yundao(String danhao, String orderid);
	
	//催单记录查询
	int getTotalByMapOfCuidan(Map<String, Object> map);
	List<Map<String, String>> getInfoByMapOfCuidan(Map<String, Object> map);
	
	 //统计月销售量(根据年限查询)
	List<Map<String, Object>> getAmountSellByYear(String year);

	List<Map<String, Object>> countTopTenByYear(String year);

	List<Map<String, Object>> getOrdersSuccess(String year);

	//	催单次数查询
	int getOutOrders(String string);
	int insertIntoOutOrder(Map<String, Object> map);

	int cancle_order(Map<String, Object> map);
  
}