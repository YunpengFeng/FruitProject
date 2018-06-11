package com.nchu.fruit.serviceImp;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.nchu.fruit.mapper.FruitImfoMapper;
import com.nchu.fruit.mapper.FruitsMapper;
import com.nchu.fruit.mapper.ItemsMapper;
import com.nchu.fruit.mapper.RecodementMapper;
import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Recodement;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.FruitService;
import com.nchu.fruit.utils.JsonUtil;
import com.nchu.fruit.utils.Pagination;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class FruitServiceImp implements FruitService {

	@Autowired
	private FruitsMapper mapper;
	
	@Autowired
	private FruitImfoMapper imfoMapper;
	
	@Autowired
	private ItemsMapper itemsMapper;
	
	@Autowired
	private RecodementMapper recodementMapper;
	
	@Override
	public List<Fruits> getFruitList() {
		// TODO Auto-generated method stub
		return  mapper.getList();
	}
	
	public List<String> getType(){
		return mapper.getType();
	}

	public List<Fruits> jinKou() {
		// TODO Auto-generated method stub
		return mapper.getJinKou();
	}
	
	@Override
	public List<HashMap<String, String>> zhekou() {
		// TODO Auto-generated method stub
		return mapper.getZheKou();
	}
		
	public List<Fruits> getMoreList(String type, int page) {
		// TODO Auto-generated method stub
		Map<String ,Integer> map =new HashMap<>();
		map.put("type", Integer.parseInt(type));
		if(type.equals("1")){
			map.put("page", 14+(page-1)*10);
		}
		if(type.equals("2")){
			map.put("page", 6+(page-1)*8);
		}
		if(type.equals("3")){
			map.put("page", 6+(page-1)*5);
		}
		return mapper.getMoreList(map);

	}

	public List<String> getSearchContent(String content) {
		// TODO Auto-generated method stub
		return mapper.getSearchContent(content);
	}

	public Pagination getPages(String content) {
		// TODO Auto-generated method stub
		int total= mapper.getTotal(content);
		Pagination p =new Pagination();
		p.setPageSize(14);
		p.setCurrentPage(1);
		p.setTotalCount(total);
		if(total%(p.getPageSize())==0)
			p.setTotalPage(total/(p.getPageSize()));
		else
			p.setTotalPage(total/(p.getPageSize())+1);
		return p;
	}

	public List<Fruits> getSearchList(Pagination pagination, String content) {
		// TODO Auto-generated method stub
		//每页数量*(传输当前页-1),和搜索内容
		return mapper.getSearchList((pagination.getPageSize())*(pagination.getCurrentPage()-1),content);
	}

	//水果大全类型
	public Pagination getPage(int id) {
		// TODO Auto-generated method stub
				String type="";
				type=transType(id);
				int total= mapper.getTypeTotal(type);
				Pagination p =new Pagination();
				p.setCurrentPage(1);
				System.err.println("****************"+total);
				p.setTotalCount(total);
				p.setPageSize(14);
				if(total%(p.getPageSize())==0)
					p.setTotalPage(total/(p.getPageSize()));
				else
					p.setTotalPage(total/(p.getPageSize())+1);
				return p;
			}

	public List<Fruits> getTypeList(Pagination pagination, int id) {
		// TODO Auto-generated method stub
		return mapper.getTypeList((pagination.getPageSize())*(pagination.getCurrentPage()-1), transType(id));
	}
	
	private String transType(int id) {
		// TODO Auto-generated method stub
		String type="";
	/*	String JsonContext = new JsonUtil().ReadFile();
		JSONArray jsonArray = JSONArray.fromObject(JsonContext);
		for(int  i = 0; i <  jsonArray.size(); i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			if(Integer.parseInt((String) jsonObject.get("number"))==id){
				 return (String)jsonObject.get("type");
			}
		}
		return "";*/

		
		switch(id){
		case 1  : type="山竹";break;case 2 : type="提子";break;case 3  : type="木瓜";break;
		case 4 : type="李子";break;case 5  : type="杨桃";break;case  6 : type="枇杷";break;
		case 7 : type="百香果";break;case 8 : type="柚子";break;case 9 : type="柠檬";break;
		case 10 : type="桃";break;case 11 : type="梨";break;case 12 : type="椰青";break;
		case  13: type="橙子";break;case 14 : type="牛油果";break;case 15 : type="番荔枝/释迦";break;
		case  16: type="石榴";break;case  17: type="红毛丹/毛荔枝";break;case 18 : type="芭乐";break;
		case  19: type="";break;case  20: type="草莓";break;case  21: type="荔枝";break;
		case  22: type="莲雾";break;case  23: type="菠萝";break;case  24: type="西柚";break;
		case  25: type="西瓜";break;case  26: type="车厘子/樱桃";break;case  27: type="香蕉";break;
		case  28: type="龙眼";break;case  29: type="苹果";break;case  30: type="哈密瓜";break;
		case  31: type="榴莲";break;case  32: type="火龙果";break;case  33: type="猕猴桃";break;
		case  34: type="甘蔗";break;case  35: type="百香果";break;case  36: type="芒果";break;
		case  37: type="菠萝蜜";break;case  38: type="芒果";break;case  39: type="蓝莓";break;
		}
		return type ;
	}

	public Fruits getById(int parseInt) {
		// TODO Auto-generated method stub
		return mapper.getById(parseInt);
	}
	
	/*
	 * 有用户推荐喜欢，个人喜好浏览 历史推荐 2条
	 * 没有登录用户则是评价和当前月份水果各加一条。
	 * 根据当前月份  2 条 和下个月水果2条
	 *  销售 量最高的水果前2
	 *  评价最多的水果1
	 */
	@Override
	public List<Map<String, Object>> getFruitImfo(Users user) {
		// TODO Auto-generated method stub
		Calendar calendar=Calendar.getInstance();
		//获得当前时间的月份，月份从0开始所以结果要加1
		int month=calendar.get(Calendar.MONTH)+1;
		/*if(user != null){
			HashMap<String,Object> map = new HashMap<>(); 
			map.put("userid",user.getUsers_id());
			map.put("month", month);
			return imfoMapper._getSlideImfo(map);
		}
		else*/
			return imfoMapper.getSlideImfo(month);
		
	}

	@Override
	public FruitImfo getByType(int type) {
		// TODO Auto-generated method stub
		return imfoMapper.getByType(type);
	}

	@Override
	public int getMonthSell(int fruit_id) {
		
		return itemsMapper.getMonthSell(fruit_id);
	}

	@Override
	public int addRemeber(String id, String users_id) {
		Recodement recode = recodementMapper.queryByUserId(id , users_id);
		if(recode == null){
			int  a = recodementMapper.addOneRecodement(id,users_id);
		}else{
			int  a = recodementMapper.updateLookNumRecodement(recode.getId());
		}
		return 0;
	}

	
	
	@Override
	public List<Map<String ,Object>> recommendToIndex(int page,HttpServletRequest request ) {
		HashMap<String ,Object> map  = new  HashMap<>();
		Calendar calendar=Calendar.getInstance();
		Users user =(Users) request.getSession().getAttribute("user");
		int month=calendar.get(Calendar.MONTH)+1;
		map.put("month", month);
		map.put("start", (page-1)*10);
		if(user == null){
			map.put("type", "11");
			
			return itemsMapper._recodementList(map);
		}else{
			map.put("type", "12");
			map.put("userid", user.getUsers_id());
			return recodementMapper.recodementList(map);
		}
		
		
	}

	@Override
	public int updatefruitByid(Fruits fruit) {
		// TODO Auto-generated method stub
		return mapper.updatefruitByid(fruit);
	}

	@Override
	public int updatefruitByid(String timeStamp, String fruit_id) {
		// TODO Auto-generated method stub
		return mapper.SetFruitTop(timeStamp, fruit_id);
	}

}
