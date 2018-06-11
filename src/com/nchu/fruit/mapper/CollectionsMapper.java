package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;

import com.nchu.fruit.pojo.Collections;

public interface CollectionsMapper {

	List<HashMap<String,String>> getAllCollections(String users_id);

	
	Collections getRepate(String id, String userid);
	int insertCollections(String id, String userid, String time);
	int delCollections(String id, String userid);
  
}