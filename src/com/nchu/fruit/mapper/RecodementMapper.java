package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Recodement;

public interface RecodementMapper {

	Recodement queryByUserId(String id, String users_id);

	int addOneRecodement(String id, String users_id);

	int updateLookNumRecodement(Integer id);

	List<Map<String, Object>> recodementList(HashMap<String, Object> map);

}
