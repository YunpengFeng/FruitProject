package com.nchu.fruit.mapper;

import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Conversation;

public interface ConversationMapper {

	int addOneConversation(Conversation conversation);

	List<Conversation> getListConversation(Map<String, String> map);

	int updateReadState(Integer id);

	List<Map<String, String>> queryNoread(Map<String, Object> map);

}
