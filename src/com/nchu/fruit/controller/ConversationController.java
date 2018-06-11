package com.nchu.fruit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nchu.fruit.pojo.Conversation;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.ConversationService;
import com.nchu.fruit.service.FruitService;
import com.nchu.fruit.utils.DateUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *   @author James feng
 *   @date 2017年12月27日 下午4:34:43 
 *
 *   @version V1.0  
 *   @Description: TODO 
 */
@Controller
public class ConversationController {
	
	@Autowired
	private ConversationService conService;
	
	@Autowired
	private FruitService fruitservice;
	
	//增加通话记录
	@ResponseBody
	@RequestMapping("/sendConversation")
	public String sendConversation(String fruitid ,String content , String receivied ,HttpServletRequest request){
		
		
		Conversation con=new Conversation();
		if(receivied != null &&receivied !=""){
			con.setReceiveid(receivied);
		}else{
			 Users user=(Users) request.getSession().getAttribute("user");
			 con.setSendid(user.getUsers_id());
		}
 		con.setFruit_id(fruitid);
		con.setSendtime(DateUtil.getTime());
		con.setContent(content);
		int a =conService.addOneConversation(con);
		JSONObject O =new JSONObject();
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString();
	}
	
	//对方发送的一条记录,管理员查询的也在
	@ResponseBody
	@RequestMapping(value="/queryOtheronversation" ,produces="text/html;charset=UTF-8")
	public String queryOtheronversation(String fruitid , String sendid, String type,HttpServletRequest request){
		 Users user=(Users) request.getSession().getAttribute("user");
		 HashMap<String,String>  map =new HashMap<String,String>();
		 if(user!=null)
			 map.put("userid",user.getUsers_id());
		 if(sendid != null){
			 map.put("sendid",sendid);
		 }
		 map.put("fruitid", fruitid);
		 map.put("type", type);
		 JSONArray array =new JSONArray();
		 
		 if("one".equals(type)||"five".equals(type)){
				 
				List<Conversation> con=conService.getConversationList(map);
				System.err.println("list的条数"+con.size());
				if(con.size()>0){
					array.add(con.get(0));
					return array.toString();
				}else{
					return null;
				}
		 }
		 if("two".equals(type)){
				List<Conversation> list=conService.getConversationList(map);
				if(list.size()>0){
					for(Conversation c:list){
						array.add(c);
					}
					return array.toString();
				}else{
					return null;
				}
		 }
		 
		 if("three".equals(type)||"four".equals(type)){
			 map.put("sendid",sendid);
				List<Conversation> list=conService.getConversationList(map);
				if(list.size()>0){
					for(Conversation c:list){
						array.add(c);
					}
					return array.toString();
				}else{
					return null;
				}
		 }
		 return null;
	}
	@ResponseBody
	@RequestMapping(value="/getFruitById",produces="text/html;charset=UTF-8")
	public String getFruitById(String fruitid  ,HttpServletRequest request){
		JSONObject o =new JSONObject();
		o=o.fromObject(fruitservice.getById(Integer.parseInt(fruitid)));
		return o.toString();
	}
	
}
