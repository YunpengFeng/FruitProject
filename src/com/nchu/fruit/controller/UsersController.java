package com.nchu.fruit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nchu.fruit.pojo.Admins;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.AdminsService;
import com.nchu.fruit.serviceImp.AdminsServiceImp;
import com.nchu.fruit.utils.DateUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 *   @author James feng
 *   @date 2017年12月17日 下午3:43:38 
 *
 *   @version V1.0  
 *   @Description: 普通用户和管理员用户登入注册
 */
@Controller
public class UsersController {
	
	@Autowired
	private AdminsService adminservice;
		// 跳入登入界面
		@RequestMapping("/toLogin")
		private String Login() {
			return "/frontJsp/login";
		}
		
		// 跳入注册界面
		@RequestMapping("/toRegister")
		private String toRegister() {
			return "/frontJsp/register";
		}
		// 登入判断
		@SuppressWarnings("unused")
		@RequestMapping("/login")
		@ResponseBody
			private String login(String userid,String password,HttpServletRequest request,Model model) {
				Users user = adminservice.queryUser(userid,password);
				System.out.println("ban_state......"+user.getBan_states());
				JSONObject  O =new JSONObject();
				if(user!=null){
					if(user.getBan_states() ==1){
						O.put("meg", "ban");
					}else{
						request.getSession().setAttribute("user", user);
						O.put("meg", "ok");
					}
				}else{
					O.put("meg", "error");
				}
				return O.toString();
			}
		
		//验证账号和账户名
		@ResponseBody
		@RequestMapping(value="/yanzhen", produces="text/html;charset=UTF-8")
		private String yanzhen(String param ,String type){

			int a = adminservice.getCheck(param,type);
			JSONObject O =new JSONObject();
			if(a==1){
				O.put("meg", "ok");
			}else{
				O.put("meg", "error");
			}
			return O.toString();
		}
		
		//注册用户
		@RequestMapping("/DoRegister")
		private String DoRegister(String userid,String password,String tel ,String address,String username,
				HttpServletRequest request,Model model) {
			Users ruser =new Users();
			ruser.setUser_address(address);
			ruser.setUser_name(username);
			ruser.setUser_pass(password);
			ruser.setUser_phone(tel);
			ruser.setUsers_id(userid);
			ruser.setBan_states(0);
			ruser.setUser_time(DateUtil.getTime());
			int a  = adminservice.addUsers(ruser);
			request.getSession().setAttribute("user", ruser);
			return "/frontJsp/index";
			
			
		}
		
		//注销
		@RequestMapping("/remove")
		private String remove(HttpServletRequest request) {
			
			
			request.getSession().setAttribute("user", null);
	
			return "/frontJsp/index";
		}
		
		
		//修改用户信息
		@ResponseBody
		@RequestMapping(value="/updateInfoUser", produces="text/html;charset=UTF-8")
		private String updateInfoUser(HttpServletRequest request, String pass,String phone,String address){
			Users   user =(Users) request.getSession().getAttribute("user");
			Users   ruser = new Users();
			ruser.setUsers_id(user.getUsers_id());
			ruser.setUser_address(address);
			ruser.setUser_pass(pass);
			ruser.setUser_phone(phone);
			
			request.getSession().setAttribute("user", null);
			int a = adminservice.updateInfoUser(ruser);
			
			return "ssss";
		}
		
		
		
		
		//测试返回的是对象
		@ResponseBody
		@RequestMapping(value="/demo1", produces="text/html;charset=UTF-8")
			public Users demo1(HttpServletRequest request){	
				return (Users) request.getSession().getAttribute("user");
		}
		//测试返回的是map
		@ResponseBody
		@RequestMapping(value="/demo2", produces="text/html;charset=UTF-8")
			public HashMap<String,String> demo2(HttpServletRequest request){	
				Users users = (Users) request.getSession().getAttribute("user");
				HashMap<String,String> hashMap= new HashMap<>();
				hashMap.put("name", users.getUser_name());
				hashMap.put("tele", users.getUser_phone());
				return hashMap;
		}
		
		//测试返回的是list
		@ResponseBody
		@RequestMapping(value="/demo3", produces="text/html;charset=UTF-8")
			public List<Integer> demo3(HttpServletRequest request){
				List<Integer> list =new ArrayList<>();
				for(int  i = 900; i<910;i++)
					list.add(i);
				return list;
		}
		
		//测试返回的是string 
		@ResponseBody
		@RequestMapping(value="/demo4", produces="text/html;charset=UTF-8")
			public String demo4(HttpServletRequest request){
			Users users = (Users) request.getSession().getAttribute("user");
			JSONObject o =JSONObject.fromObject(users);
				return o.toString();
		}
	
}
