package com.nchu.fruit.mapper;

import java.util.Map;

import com.nchu.fruit.pojo.Diction;

public interface DictionMapper {
	Diction getByConfigId(int configid);

	int updateconfig(Map<String, Object> map);
	
	
}
