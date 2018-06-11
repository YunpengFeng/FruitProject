package com.nchu.fruit.mapper;

import java.util.List;
import java.util.Map;

public interface CommentMapper {

	int addDiscuss(String num, String content, String userid, String time,String itemid ,int count);
	
	List<Map<String,String>> getDicussByFruit(String fruitid);

	//审核评论查询
	int getTotalByMap(Map<String, Object> map);
	List<Map<String, String>> getInfoByMap(Map<String, Object> map);
	
	//审核评修改相关状态
	int updatecomment_states(Map<String, Object> map);

	int addDiscuss1(String num, String content, String userid, String time, String itemid, int count, int string,
			int string2);
}