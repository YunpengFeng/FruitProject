package com.nchu.fruit.serviceImp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.fruit.mapper.ConversationMapper;
import com.nchu.fruit.pojo.Conversation;
import com.nchu.fruit.service.ConversationService;

@Service
public class ConversationServiceImp implements ConversationService {

	@Autowired
		private ConversationMapper conmapper;
	@Override
	public int addOneConversation(Conversation conversation) {
		// TODO Auto-generated method stub
		return conmapper.addOneConversation(conversation);
	}

	@Override
	public List<Conversation> getConversationList(Map<String, String> map) {
		// TODO Auto-generated method stub
		List<Conversation> list = conmapper.getListConversation(map);
		//更改读状态，为1
		if(map.get("type").equals("three")){
			for(Conversation c: list){
				int a =conmapper.updateReadState(c.getId());
			}
		}else{
			if(list.size()>0){
				int a =conmapper.updateReadState(list.get(0).getId());
			}
		}
		return list;
	}

	
		
}
