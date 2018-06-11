package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.utils.Pagination;

public interface FruitsMapper {

	List<Fruits> getList();
	
	List<String> getType();

	List<Fruits> getJinKou();
	
	List<HashMap<String, String>> getZheKou();

	List<Fruits> getMoreList(String type, int i);

	List<Fruits> getMoreList(Map<String, Integer> map);

	List<String> getSearchContent(String content);

	int getTotal(String content);

	List<Fruits> getSearchList(int start, String content);


	int getTypeTotal(String id);
	List<Fruits> getTypeList(int i, String fname);

	Fruits getById(int parseInt);

	int subAmount(int id, int parseInt);

	
	int getTotalByMap(Map<String, Object> map);
	List<Map<String, String>> getInfoByMap(Map<String, Object> map);

	int updateFruit_states(Map<String, Object> map);

	int queryLastId();

	int addFruit(Fruits fruit);

	List<HashMap<String, String>> getzhekou();

	int updatefruitByid(Fruits fruit);

	int  SetFruitTop(String timeStramp ,String fruit_id);

	int cancelsubAmount(int fruitid, int amount);
	
  
}