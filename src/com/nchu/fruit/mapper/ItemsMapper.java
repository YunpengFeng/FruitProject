package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Items;

public interface ItemsMapper {

	int addItems(Map<String, String> map);

	List<Items> getOrdersItems(String orderid);

	List<Items> getItemsList(String users_id);

	int updateComStates(String itemid);
	
	//年销售量前十
	List<Map<String, Object>> countTopTenByYear(String year);

	int getMonthSell(int fruit_id);
	//推荐
	List<Map<String, Object>> _recodementList(HashMap<String, Object> map);
   
}