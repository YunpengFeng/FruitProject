package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Admins;
import com.nchu.fruit.pojo.Users;


public interface AdminsMapper {
		//通过账号得到用户信息
		Admins getAdmins(String admin_id);
		
		//得到所有的管理员
		List<Admins> getAdminsInfo(int curr,String scontent);
		int getAdminsInfoTatol(String scontent);
		
		//修改商户信息
		int updateInfo(Admins admin);
		
		//修改登入用户权限
		int updateRole(String admin_id  );
		
		//添加注册商户的信息
		int addAdmins(Admins admin);

		
		
		//修改管理员权限
		int updateAdminRole(Map<String, Object> map);
		
		//删除管理员
		int deleteAdmin(String id);

		Admins getUserCheck(HashMap<String, String> map);

		int setMenuList(String userid, String liststr);

	
  
}