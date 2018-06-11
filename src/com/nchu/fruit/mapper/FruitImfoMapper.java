package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.FruitImfo;

public interface FruitImfoMapper {

	int addImfo(HashMap<String ,Object> map);

	int UpdateImfo(HashMap<String, Object> map);

	int queryLastOne();

	FruitImfo queryByName(int num);

	List<Map<String, Object>> getSlideImfo(int month);
	List<Map<String, Object>> _getSlideImfo(HashMap<String, Object> map);

	FruitImfo getByType(int type);
	
}
