package com.nchu.fruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Users;

public interface UsersMapper {

	Users query(String userid, String password);

	List<Users> queryById(String users_id);

	
	List<Users> getUsersInfo(int current ,String c);
	int getUsersInfoTatol(String c);
	
	//修改登入用户权限
	int updateUserRole(Map<String, Object> map);

	//账号用户名验证
	Users getUserCheck(HashMap<String, String> map);

	int addUsers(Users ruser);

	int updateInfoUser(Users ruser);

	int updateMoney(Map<String, Object> map);

	int cutMoney(Map<String, Object> map);
   
}