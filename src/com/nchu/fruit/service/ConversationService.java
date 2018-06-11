package com.nchu.fruit.service;

import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Conversation;

public interface ConversationService {
	
	//发送一条对话记录
	int addOneConversation(Conversation conversation);
	
	//查询历史记录
	List<Conversation> getConversationList(Map<String ,String> map);
	
}
