package com.nchu.fruit.serviceImp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.fruit.mapper.CarsMapper;
import com.nchu.fruit.mapper.CollectionsMapper;
import com.nchu.fruit.mapper.CommentMapper;
import com.nchu.fruit.mapper.DictionMapper;
import com.nchu.fruit.mapper.DirtyPoolMapper;
import com.nchu.fruit.mapper.FruitsMapper;
import com.nchu.fruit.mapper.OrdersMapper;
import com.nchu.fruit.mapper.UsersMapper;
import com.nchu.fruit.mapper.ItemsMapper;
import com.nchu.fruit.pojo.Cars;
import com.nchu.fruit.pojo.Collections;
import com.nchu.fruit.pojo.Diction;
import com.nchu.fruit.pojo.DirtyPool;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Items;
import com.nchu.fruit.pojo.Orders;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.OrderAndCarService;
import com.nchu.fruit.utils.DateUtil;
import com.nchu.fruit.utils.copyPicture;

import net.sf.json.JSONArray;

/**
 *   @author James feng
 *   @date 2017年12月17日 下午2:01:50 
 *
 *   @version V1.0  
 *   @Description: TODO 
 */
@Service
public class OrderAndCarServiceImp implements OrderAndCarService {
	@Autowired
	private  CarsMapper mapper;
	
	@Autowired
	private  OrdersMapper ordermapper;
	
	@Autowired
	private  FruitsMapper fruitmapper;
	
	@Autowired
	private ItemsMapper itemsMapper;
	
	@Autowired
	private  CommentMapper commentmapper;
	
	@Autowired
	private  UsersMapper userMapper;
	
	@Autowired
	private CollectionsMapper collectionsMapper;
	
	@Autowired
	private DictionMapper  dictionMapper;
	
	@Autowired
	private DirtyPoolMapper dirtyPoolMapper;
	
	private copyPicture cp=new copyPicture() ;
	
	
	
	public int addcar(int amount, int id, String users_id) {
		// TODO Auto-generated method stub
		/*
		 * 判断是够原来购物车是否有此账号和此物品
		 * 有改数量
		 * 没有增加到购物车
		 */
		Cars pcar =new Cars();
		pcar.setusers_id(users_id);
		pcar.setFruit_id(id);
		
		Cars car=new Cars();
		try {
			car = mapper.getCarById(String.valueOf(id),users_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("我空");
			e.printStackTrace();
		}
		if(car ==null){
			pcar.setAmount(amount);
			return mapper.insertCar(pcar);
		}else{
			pcar.setAmount(car.getAmount()+amount);
			return mapper.updateAmout(pcar);
		}
		
	}
	public List<Map<String, String>> queryCarTen(String users_id) {
		// TODO Auto-generated method stub
		return mapper.getMapList(users_id);
	}
	@Override
	public List<Map<String, String>> getMapListCarAll(String users_id) {
		// TODO Auto-generated method stub
		return mapper.getMapListCarAll(users_id);
	}
	public int updateCar(Cars car) {
		// TODO Auto-generated method stub
		return mapper.updateAmout(car);
	}
	
	
	public int addOrder(String orderid, String users_id, String time, String info) {
		// TODO Auto-generated method stub
		return ordermapper.addOrder(orderid,users_id,time,info);
	}
	
	//拆分信息并查询
	public List<Map<String, String>> getcarItem(String info) {
		// TODO Auto-generated method stub
		String item[] =info.split("a");
		List<Map<String, String>> list =new ArrayList<Map<String, String>>();
		for(String s: item){
			Map<String, String> map =new HashMap<>();
			String id=s.substring(0,s.indexOf(","));
			String  amount=s.substring(s.indexOf(",")+1,s.length());
			Fruits f =fruitmapper.getById(Integer.parseInt(id)); 
			map.put("id",id);
			map.put("name", f.getFruit_name());
			map.put("amount" ,amount);
			map.put("price", String.valueOf(f.getFruit_sellprice()));
			list.add(map);
			System.out.println("id="+id +"$***************amount"+amount+"splitString"+s);
		}
		return list;
	}
	/*修改订单表
	 * 1.原订单表信息修改
	 * 2.增加订单详情
	 * 3.减少每件物品的库存（不足则不加入详情）
	 * 4.从购物车删除
	 * 
	 */
	public  synchronized String updateOrderById(String orderid, String info, String address, String phone,String userid,String man) {
		// TODO Auto-generated method stub
		//继续用上面的方法
		StringBuffer infomation=new StringBuffer();
		StringBuffer infomation1=new StringBuffer();
		infomation.append("");
		List<Map<String,String>> list=getcarItem(info);
		List<Map<String,String>> list1=new ArrayList<Map<String,String>>();
		//控制两位小数
		java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00");
		float total =0;
		for(Map<String ,String> map:list){
			//判断库存足否
			Fruits f =fruitmapper.getById(Integer.parseInt(map.get("id")));
			if(f.getFruit_amount()>=Integer.parseInt(map.get("amount"))){
				Map<String ,String> map1 =new HashMap<String ,String>();
				//有些是数字不知道会不会出错
				map1.put("orderid",orderid);
				map1.put("id", map.get("id"));
				map1.put("name", map.get("name"));
				map1.put("amount" ,map.get("amount"));
				map1.put("price", map.get("price"));
				float sum=(Float.parseFloat(map.get("price")))*(Integer.parseInt(map.get("amount")));
				System.err.println("sum****************"+sum);
				System.err.println(df.format(sum)+"**************************"); 
				map1.put("sum",df.format(sum));
				
				total +=sum;
				//减少库存
				int crruent=f.getFruit_amount()-Integer.parseInt(map.get("amount"));
				int sub =fruitmapper.subAmount(Integer.parseInt(map1.get("id")),crruent);
				//插入详情表
				int item= itemsMapper.addItems(map1);
				//购物车删除
				int del = mapper.deleteCar(userid,Integer.parseInt(map1.get("id")));
				infomation1.append(map.get("id")+","+map.get("amount")+"a");
				System.out.println("插入成功"+"************减少成功**************"+(del+item+sub) +"infomation1"+infomation1.toString()); 
			}else{
					infomation.append(map.get("id")+","+map.get("amount")+"a");
			}
		}
		//修改订单表
		int aa =ordermapper.upadateOrders(orderid,address,phone,man,total,infomation1.toString());
 		return infomation.toString() ;
	}
	
	/*
	 * 管理页面---->再新增 字段（在sql语句中可以少写内容）
	 * 1 ，我的订单
	 * 2. 待付款
	 * 3. 待收货
	 * 4.  待评价
	 * 5 .
	 */
	public JSONArray doManager(String users_id, String type) {
		Map<String,String> map =new HashMap<String,String>();
		map.put("userid",users_id);
		map.put("type" ,type);
		// TODO Auto-generated method stub
		int num =Integer.parseInt(type);
		JSONArray array=new JSONArray();
		if(num==1||num==2||num==3||num==5){
			List<Orders> list = ordermapper.getOrdersList(map);
			for(Orders orders:list){
				array.add(orders);
			}
		}
		//当前用户,做评价
		if(num==4){
				List<Items> list =itemsMapper.getItemsList(users_id);
				for(Items Items:list){
					array.add(Items);
				}
		}
		if(num==6){
			List<Users> list =userMapper.queryById(users_id);
			for(Users users:list){
				array.add(users);
			}
		}
		
		if(num==8){
			List<HashMap<String,String>> list =collectionsMapper.getAllCollections(users_id);
			
			for(HashMap<String,String> coll:list){
				array.add(coll);
			}
		}
		
		
		return array;
	}
	
	public Orders queryOrdersById(String orders_id) {
		// TODO Auto-generated method stub
		return ordermapper.getOrderById(orders_id);
	}
	
	public List<Items> getOrdersItems(String orderid) {
		// TODO Auto-generated method stub
		return itemsMapper.getOrdersItems(orderid);
	}
	//修改状态
	public int updatStates(String orderid, String type) {
		// TODO Auto-generated method stub
		Map<String,String> map =new HashMap<String,String>();
		map.put("userid",orderid);
		map.put("type" ,type);
		int  a =ordermapper.updatStates(map);
		return a;
	}
	
	public int addDiscuss(String num, String content, String itemid,String userid ,String picname) {
		// TODO Auto-generated method stub
		int a = itemsMapper.updateComStates(itemid);
		int count = 0;
		//此处修改
		System.out.println("图片名字:"+picname+"?");
		if (!("flag").equals(picname)){
			String pic[] = picname.split("/");
			count = pic.length;
			// 存储图片
			for (int i = 1; i <= pic.length; i++) {
				// 会产生空格
				String ss = pic[i - 1].trim();
				String rname = itemid + "_(" + i + ").png";
				System.err.println("重命名的名字：" + rname + "原名字" + ss);
				cp.copy(2, ss, rname);
				// 删除temp文件里的图片，一张一张删除
				cp.del(ss);
			}
		}
		//自动过滤脏词 ,2 是手动 1 是自动
		Diction  diction = dictionMapper.getByConfigId(1);
		int b  = 0;
		if(diction.getFlag() ==1){
			//脏词池匹配
			List<DirtyPool> dirtyPool = dirtyPoolMapper.getAllPool();
			String _content=content;
			for(DirtyPool pool :dirtyPool){
				
				if(_content.indexOf(pool.getContent())>=0){
					_content = _content.replaceAll(pool.getContent(), "***");
				}
				
			}
			b = commentmapper.addDiscuss1(num,_content,userid,DateUtil.getTime(),itemid,count,1,1); 
			
		}
		if(diction.getFlag() ==2)
			b = commentmapper.addDiscuss(num,content,userid,DateUtil.getTime(),itemid,count);
		if(a ==1){
			if(b ==1){
				return 1;
			}
		}
		return 0;
	}
	
	
	public List<Map<String,String>> getDicussByFruit(String fruitid){
		return commentmapper.getDicussByFruit(fruitid);
	}
	
	//购物车删除12 、移到收藏夹11 ,从收藏夹删除13
	public int oparetionMove(String type, String id,String userid) {
		// TODO Auto-generated method stub
		int a =0;
		if(type.equals("11")){
			//首先查询有没有重复的 
			Collections c = collectionsMapper.getRepate(id,userid);
			if(c==null){
				collectionsMapper.insertCollections(id,userid,DateUtil.getTime());
				a=11;
			}else{
				a=21;
			}
			
		}
		
		if(type.equals("13")){
			collectionsMapper.delCollections(id,userid);
			a=31;
					
		}
		
		if(type.equals("12")){
			mapper.deleteCar(userid, Integer.parseInt(id));
			a=41;
		}
		return a;
	}
	
	
	@Override
	public int outOrders(Map<String, Object> map) {
		// TODO Auto-generated method stub 
		//先判断次数
		int a = ordermapper.getOutOrders((String)map.get("orderid"));
		if(a < 10){
			map.put("callnumber", a+1);
		return ordermapper.insertIntoOutOrder(map);
		}
		return 0;
	}
	
	//管理页面数量获取
	@Override
	public String getManagerOfAmount(Map<String, String> map) {
		// TODO Auto-generated method stub
		JSONObject o =new JSONObject();
	/*	if(num==1||num==2||num==3||num==5){
			List<Orders> list = ordermapper.getOrdersList(map);*/
		map.put("type","1" );
		o.put("all",  ordermapper.getOrdersList(map).size());
		
		map.put("type","2" );
		o.put("pay", ordermapper.getOrdersList(map).size());
		
		map.put("type","3" );
		o.put("get", ordermapper.getOrdersList(map).size());
		
		map.put("type","5" );
		o.put("send",ordermapper.getOrdersList(map).size());
		
		o.put("discuss", itemsMapper.getItemsList(map.get("userid")).size());
		
		o.put("con", collectionsMapper.getAllCollections(map.get("userid")).size());
		return o.toString();
	}
	@Override
	public  synchronized int cancle_order(Map<String, Object> map) {
		// TODO Auto-generated method stub
		if("14".equals(map.get("type"))){
			//将库存量增加至 各种水果中 ，余额退换
			
			Orders orders = ordermapper.getOrderById(String.valueOf(map.get("orderid")));
			map.put("money", orders.getTotal());
			map.put("userid",orders.getUsers_id());
			int c =userMapper.updateMoney(map);
			String temp[]  = orders.getTempinfo().split("a");
			for(String  s : temp){
				 String single[] = s.split(",") ;
				int a   = fruitmapper.cancelsubAmount(Integer.parseInt(single[0]),Integer.parseInt(single[1]));
			}
			
		}
		int a =  ordermapper.cancle_order(map) ;
		return 1;
	}

}
