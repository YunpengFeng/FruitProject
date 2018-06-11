package com.nchu.fruit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.utils.Pagination;

/**
 *   @author James feng
 *   @date 2017年12月13日 下午7:23:24 
 *
 *   @version V1.0  
 *   @Description: TODO 
 */
public interface FruitService {
	
	//首页展示后十中的新品上市
	List<Fruits> getFruitList();
	
	//首页水果种类大全
	List<String>  getType();
	
	//进口水果前 6
	 List<Fruits> jinKou();
	 
	 //折扣水果
	 List<HashMap<String, String>> zhekou();
	 
	 //加载更多的水果
	 List<Fruits> getMoreList(String type, int parseInt);
	 
	 //搜索框异步加载
	 List<String> getSearchContent(String content);
	 
	 //统计页数
	  Pagination getPages(String content) ;
	
	  //查找分页
	  List<Fruits> getSearchList(Pagination pagination, String content);
	
	  	//水果大全类型统计
	  Pagination getPage(int id) ;
	
	  //水果类型分页
	  List<Fruits> getTypeList(Pagination pagination, int parseInt) ;
	  
	//商品详情
	  Fruits getById(int parseInt);

	List<Map<String, Object>> getFruitImfo(Users user);

	FruitImfo getByType(int parseInt);

	int getMonthSell(int parseInt);
	
	//增加浏览记录
	int addRemeber(String id, String users_id);
	//推荐
	public List<Map<String ,Object>> recommendToIndex(int page,HttpServletRequest request);

	int updatefruitByid(Fruits fruit);

	int updatefruitByid(String timeStamp, String fruit_id);

	  
	  
}
