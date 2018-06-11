package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;

import com.nchu.fruit.pojo.DirtyPool;
import com.nchu.fruit.utils.PaginationOther;

public interface DirtyPoolMapper {
	
	List<DirtyPool> getAllPool();
	
	int InsertPool(String content);
	
	int deletePool(int id);
	
	int updatePool(String content ,int id);
	
	DirtyPool getLastDrity();


	List<DirtyPool> getAllPoolBySearch(HashMap<String, Object> map);
	int getAllPoolBySearchTotol(HashMap<String, Object> map);
	
	
}
