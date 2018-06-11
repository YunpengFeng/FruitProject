package com.nchu.fruit.serviceImp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.fruit.mapper.AdminsMapper;
import com.nchu.fruit.mapper.CommentMapper;
import com.nchu.fruit.mapper.ConversationMapper;
import com.nchu.fruit.mapper.DictionMapper;
import com.nchu.fruit.mapper.DirtyPoolMapper;
import com.nchu.fruit.mapper.FruitImfoMapper;
import com.nchu.fruit.mapper.FruitsMapper;
import com.nchu.fruit.mapper.ItemsMapper;
import com.nchu.fruit.mapper.OrdersMapper;
import com.nchu.fruit.mapper.UsersMapper;
import com.nchu.fruit.pojo.Admins;
import com.nchu.fruit.pojo.DirtyPool;
import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.AdminsService;
import com.nchu.fruit.utils.Pagination;
import com.nchu.fruit.utils.PaginationOther;
import com.nchu.fruit.utils.ToGridJson;
import com.nchu.fruit.utils.copyPicture;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class AdminsServiceImp  implements AdminsService{
 
	@Autowired
	private AdminsMapper adminmapper;
	
	@Autowired
	private UsersMapper usermapper;
	
	@Autowired
	private FruitsMapper  fruitsMapper;
	
	@Autowired
	private OrdersMapper ordersMapper;
	
	@Autowired
	private CommentMapper commMapper;
	
	@Autowired
	private ConversationMapper conMapper;
	
	@Autowired
	private ItemsMapper itemsMapper;
	
	@Autowired
	private FruitImfoMapper fruitImfoMapper;
	
	@Autowired
	private DirtyPoolMapper dirtyPoolMapper;
	
	private copyPicture cp=new copyPicture() ;
	
	@Autowired
	private DictionMapper dictionMapper;
	
	ToGridJson dataGridJson  = new ToGridJson();
	//管理员页面
	@Override
	public Admins getAdmins(String admin_id ,String password) {
		// TODO Auto-generated method stub
		Admins admin= adminmapper.getAdmins(admin_id);
		if(admin!=null){
			if(password.equals(admin.getAdmin_pass())){
				return admin;
			}
		}
	
		return null;
	}

	/*@Override
	public List<Admins> getAdminsInfo() {
		// TODO Auto-generated method stub
		return adminmapper.getAdminsInfo();
	}
*/
	@Override
	public int updateInfo(Admins admin) {
		// TODO Auto-generated method stub
		return adminmapper.updateInfo(admin);
	}

	@Override
	public int updateRole(String admin_id) {
		// TODO Auto-generated method stub
		return adminmapper.updateRole(admin_id);
	}

	@Override
	public int addAdmins(Admins admin) {
		// TODO Auto-generated method stub
		return adminmapper.addAdmins(admin);
	}

	
	
	
	
	
	//普通用户开始
	public Users queryUser(String userid, String password) {
		// TODO Auto-generated method stub
		return usermapper.query(userid,password);
	}
	
	@Override
	public JSONArray getAccount(String type, String currentpage,String scontent) {
		// TODO Auto-generated method stub
		JSONArray array =new JSONArray();
		int current = Integer.parseInt(currentpage);
		Pagination pagination =new Pagination();
		pagination.setCurrentPage(current);
	
		//所有的管理员
		if(type.equals("11")){
			int total=adminmapper.getAdminsInfoTatol(scontent);
			pagination.setPageSize(10);
			pagination.setTotalCount(total);
			pagination.setTotalPage(pagination.getTotalPage());
			List<Admins> list =  adminmapper.getAdminsInfo((current-1)*10 ,scontent);
			for(Admins a :list){
				array.add(a);
			}
			array.add(pagination);
		}
		if(type.equals("12")){
			int total=usermapper.getUsersInfoTatol(scontent);
			pagination.setTotalCount(total);
			pagination.setPageSize(20);
			pagination.setTotalPage(pagination.getTotalPage());
			List<Users> list =  usermapper.getUsersInfo((current-1)*20,scontent);
			for(Users a :list){
				array.add(a);
			}
			array.add(pagination);
		}
		//	水果列表
		if(type.equals("14")){
			int total=fruitsMapper.getTotal(scontent);
			pagination.setTotalCount(total);
			pagination.setPageSize(10);
			pagination.setTotalPage(pagination.getTotalPage());
			List<Fruits> list =  fruitsMapper.getSearchList((current-1)*10, scontent);
			for(Fruits a :list){
				array.add(a);
			}
			array.add(pagination);
		}
		return array;
	}
	
	
	//批量管理之库存管理
	public JSONArray batchManager(String type,String currentpage,String size , String amount, String scontent){
		JSONArray array =new JSONArray();
		Pagination pagination =new Pagination();
		Map<String,Object> map =new HashMap<>();
		int start =(Integer.parseInt(currentpage)-1)*Integer.parseInt(size);
		map.put("type", type);
		map.put("start",start );
		map.put("size",Integer.parseInt(size));
		map.put("amount",Integer.parseInt(amount));
		map.put("scontent",scontent);
		
		//库存管理
		if(("16").equals(type)){
			int total=fruitsMapper.getTotalByMap(map);
			pagination.setCurrentPage(Integer.parseInt(currentpage));
			pagination.setTotalCount(total);
			pagination.setPageSize(Integer.parseInt(size));
			pagination.setTotalPage(pagination.getTotalPage());
			
			List<Map<String, String>> list =  fruitsMapper.getInfoByMap(map);
			for(Map<String, String> a :list){
				array.add(a);
			}
			array.add(pagination);
		}
		
		return array;
	}

	@Override
	public int updateAmount(String string, String shezhiamount) {
		// TODO Auto-generated method stub
		int amount=Integer.parseInt(shezhiamount);
		String a[] =string.split("#");
		for (int i = 0; i < a.length; i++) {
			int c =fruitsMapper.subAmount(Integer.parseInt(a[i]), amount);
		}
			return 1;
	}

	// 批量管理之上下架管理
	@Override
	public JSONArray batchManagerofshangxiajia(Map<String, Object> map) {
		// TODO Auto-generated method stub
		JSONArray array = new JSONArray();
		Pagination pagination = new Pagination();
		int total=fruitsMapper.getTotalByMap(map);
		System.err.println("*******上下架数量为**********"+total);
		//obeject转换为integer类型
		pagination.setCurrentPage( new Integer(map.get("currentpage").toString()));
		pagination.setTotalCount(total);
		pagination.setPageSize(new Integer(map.get("size").toString()));
		pagination.setTotalPage(pagination.getTotalPage());
		System.err.println("*******页码**********"+pagination.getPageSize()+"当前页"+pagination.getCurrentPage());
		int start = (pagination.getCurrentPage()-1)*pagination.getPageSize();
		map.put("start",start );
		List<Map<String, String>> list = fruitsMapper.getInfoByMap(map);
		for (Map<String, String> a : list) {
			array.add(a);
		}
		array.add(pagination);

		return array;
	}

	@Override
	public int updateFruit_states(String string, String obj) {
		// TODO Auto-generated method stub
		int type=Integer.parseInt(obj);
		String a[] =string.split("#");
		for (int i = 0; i < a.length; i++) {
			Map<String, Object> map =new HashMap<>();
			map.put("a", Integer.parseInt(a[i]));
			map.put("type", obj);
			int c =fruitsMapper.updateFruit_states(map);
		}
			return 1;
	}
	// 批量管理之订单管理
	@Override
	public JSONArray batchManagerofOrders(Map<String, Object> map) {
		// TODO Auto-generated method stub
		JSONArray array = new JSONArray();
		Pagination pagination = new Pagination();
		int total=ordersMapper.getTotalByMap(map);
		System.err.println("*******上下架数量为**********"+total);
		//obeject转换为integer类型
		pagination.setCurrentPage( new Integer(map.get("currentpage").toString()));
		pagination.setTotalCount(total);
		pagination.setPageSize(new Integer(map.get("size").toString()));
		pagination.setTotalPage(pagination.getTotalPage());
		System.err.println("*******页码**********"+pagination.getPageSize()+"当前页"+pagination.getCurrentPage());
		int start = (pagination.getCurrentPage()-1)*pagination.getPageSize();
		map.put("start",start );
		List<Map<String, String>> list = ordersMapper.getInfoByMap(map);
		for (Map<String, String> a : list) {
			array.add(a);
		}
		array.add(pagination);

		return array;
	}
	
	//消息服务列表，计数统计
	@Override
	public JSONArray serviceInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		JSONArray array = new JSONArray();
		List<Map<String,String>> list =conMapper.queryNoread(map);
		for(Map<String,String> map2:list){
			array.add(map2);
		}
		return array;
	}
	
	//批量管理之审核评论
	@Override
	public JSONArray batchManagerofDiscuss(Map<String, Object> map) {
		// TODO Auto-generated method stub
		JSONArray array = new JSONArray();
		Pagination pagination = new Pagination();
		int total=commMapper.getTotalByMap(map);
		System.err.println("*******评论数量**********"+total);
		//obeject转换为integer类型
		pagination.setCurrentPage( new Integer(map.get("currentpage").toString()));
		pagination.setTotalCount(total);
		pagination.setPageSize(new Integer(map.get("size").toString()));
		pagination.setTotalPage(pagination.getTotalPage());
		System.err.println("*******页码**********"+pagination.getPageSize()+"当前页"+pagination.getCurrentPage());
		int start = (pagination.getCurrentPage()-1)*pagination.getPageSize();
		map.put("start",start );
		List<Map<String, String>> list = commMapper.getInfoByMap(map);
		for (Map<String, String> a : list) {
			array.add(a);
		}
		array.add(pagination);
		
		return array;
	}
		//催单处理
		@Override
		public JSONArray batchManagerofCuidan(Map<String, Object> map) {
			JSONArray array = new JSONArray();
			Pagination pagination = new Pagination();
			int total=ordersMapper.getTotalByMapOfCuidan(map);
			System.err.println("*******催单数量**********"+total);
			//obeject转换为integer类型
			pagination.setCurrentPage( new Integer(map.get("currentpage").toString()));
			pagination.setTotalCount(total);
			pagination.setPageSize(new Integer(map.get("size").toString()));
			pagination.setTotalPage(pagination.getTotalPage());
			System.err.println("*******页码**********"+pagination.getPageSize()+"当前页"+pagination.getCurrentPage());
			int start = (pagination.getCurrentPage()-1)*pagination.getPageSize();
			map.put("start",start );
			List<Map<String, String>> list = ordersMapper.getInfoByMapOfCuidan(map);
			for (Map<String, String> a : list) {
				array.add(a);
			}
			array.add(pagination);
			
			return array;
		}
	
	
	//评论审核，发布状态 11.发布; 13 不发布(只要是发布了，审核状态一定为1，通过了审核)  12审核
	@Override
	public int updatecomment_states(String string, String obj) {
		// TODO Auto-generated method stub
		String a[] =string.split("#");
		for (int i = 0; i < a.length; i++) {
			Map<String, Object> map =new HashMap<>();
			map.put("a", Integer.parseInt(a[i]));
			map.put("type", obj);
			int c =commMapper.updatecomment_states(map);
			System.out.println("c>>>>>>>>>"+c);
		}
		return 1;
	}

	//运单产生 修改状态，发货状态为1
	@Override
	public int produce_yundao(String danhao, String orderid) {
		// TODO Auto-generated method stub
		return ordersMapper.produce_yundao(danhao,orderid);
	}
	
	 //统计月销售量(根据年限查询)
	@Override
	public List<Map<String, Object>> getMonthByYear(String year) {
		// TODO Auto-generated method stub
		return ordersMapper.getAmountSellByYear(year);
	}
	
		//年销售量前十
		@Override
		public JSONArray countTopTenByYear(String year){
			List <Map<String, Object>>list = itemsMapper.countTopTenByYear(year);
			JSONArray array= new JSONArray();
			//如果多余十种取前9，后面的命名为其他总和相加
			//处理数据
				int sum=0;
				for(int i=0;i<list.size();i++){
					Map<String, Object> map =list.get(i);
					Map<String, Object> map1  = new HashMap<>();
					//第一个默认,插件自动会帮忙转
					if(i<=9){
							map1.put("name",map.get("fruit_name"));
							map1.put("y", map.get("y"));
							if(i==0){
								map1.put("sliced", true);
								map1.put("selected", true);
							}
							array.add(map1);
					}else{
						sum += new Integer(map.get("y").toString());
					}
					if(list.size()>10){
						if(i==list.size()-1){
						//	System.err.println("************sum*********"+sum);
							map1.put("name","其他");
							map1.put("y", sum);
							array.add(map1);
						}
					}
				}
			 return array;
		}

	
	@Override
	public JSONArray ordersSuccess(String year) {
		// TODO Auto-generated method stub
		List <Map<String, Object>>list = ordersMapper.getOrdersSuccess(year);
		JSONArray array= new JSONArray();
		for(int i=1;i<=12;i++){
			int flag=0;
			for(Map<String ,Object> map2:list){
				//匹配月份
				int month  = new Integer(map2.get("months").toString());
				//System.out.println("month********"+month);
				if(month==i){
					array.add(map2);
					flag=1;
					break;
				}
			}
			if(flag==0){
				Map<String ,Object> map1 =new  HashMap<>();
				map1.put("months",i);
				map1.put("count", 0);
				array.add(map1);
			}
		}
		return array;
	}
	//查询水果最后的id
	@Override
	public int queryLastId() {
		// TODO Auto-generated method stub
		return fruitsMapper.queryLastId();
	}

	
	@Override
	public int addFruit(Fruits fruit, String picname) {
		// TODO Auto-generated method stub
		//处理图片数据
		 String pic[] =picname.split("/");
		 for(int i = 1  ; i<=pic.length; i++){
			 //会产生空格
			 String ss=pic[i-1].trim();
			 String rname =fruit.getFruit_images()+"_ ("+i+").png";
			 System.err.println("重命名的名字："+rname+"原名字"+ss);
			 cp.copy(1,ss,rname );
			//删除temp文件里的图片，一张一张删除
			 cp.del(ss);
		 }
		return fruitsMapper.addFruit(fruit);
		
	}
	
	 //权限修改
	@Override
	
	public int updateRole(String type, String role, String id) {
		// TODO Auto-generated method stub
		//修改管理员权限
		Map<String ,Object> map =new  HashMap<>();
		map.put("role", role);
		map.put("id", id);
		int a =0;
		System.err.println("type"+type+"******"+role+"*********id"+id);
		if(type.equals("11")){
			
			 if(role.equals("13")){
				 a =adminmapper.deleteAdmin(id);
			 }else{
				 a =adminmapper.updateAdminRole(map);
			 }
		}
		//修改用户权限权限
		if(type.equals("10")){
			a = usermapper.updateUserRole(map);
		}
		return a ;
	}
	
	//账号用户名验证
	@Override
	public int getCheck(String param, String type) {
		// TODO Auto-generated method stub
		HashMap<String ,String> map =new  HashMap<>();
		map.put("type", type);
		if(type.equals("13")){
			System.out.println("ss"+param.substring(0,param.indexOf("#"))+"************"+param.substring(param.indexOf("#")+1,param.length()));
			map.put("userid", param.substring(0,param.indexOf("#")));
			map.put("pass" ,param.substring(param.indexOf("#")+1,param.length()));
		}else{
			map.put("param", param);
		}
		Users user =usermapper.getUserCheck(map);
		if(user !=null)
			return 1;
		else
			return 0;
	}

	@Override
	public int addUsers(Users ruser) {
		// TODO Auto-generated method stub
		return usermapper.addUsers(ruser);
	}

	@Override
	public int getCheckAadmin(String param, String type) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				HashMap<String ,String> map =new  HashMap<>();
				map.put("type", type);
				map.put("param", param);
				Admins admin =adminmapper.getUserCheck(map);
				if(admin !=null)
					return 1;
				else
					return 0;
	}
	 /*
	  * 管理员首页消息动态加载
	  *   1聊天消息    （加载的聊天信息只是未读的） 
	  *   2 订单消息   （订单是当天的订单信息）
	  *  3 .催单记录   （催单是催单记录）
	  *   4 入驻商家   （注册的管理员）
	  */
	@Override
	public String getIndexInfoList() {
		// TODO Auto-generated method stub
		JSONObject O =new  JSONObject();
		JSONArray totalInfo =new JSONArray();
	/*	
		JSONArray conArray = conMapper.getConversation();
		O.put("conArray", conArray);
		int conTotal = conMapper.getConversationTotal();
		O.put("conTotal", conTotal);
		totalInfo.add(conArray);
		
		JSONArray orderArray = ordersMapper.getOrderByCurrentDay();
		O.put("orderArray", orderArray);
		int orderTotal = ordersMapper.getOrderByCurrentDayTotal();
		O.put("orderTotal",orderTotal );
		totalInfo.add(orderArray);
		
		JSONArray callnumberArray = ordersMapper.getCallNumber();
		O.put("callnumberArray", callnumberArray);
		int callnumberTotal = ordersMapper.getCallNumberTotal();
		O.put("callnumberTotal",callnumberTotal );
		totalInfo.add(callnumberArray);
		
		JSONArray adminArray =   adminmapper.getSellManRegister();
		O.put("adminArray", adminArray);
		int adminTotal = ordersMapper.getSellManRegisterTotal();
		O.put("adminTotal",adminTotal );
		totalInfo.add(adminArray);*/
						
		System.err.println("***************totalInfo********"+totalInfo.toString());
		return totalInfo.toString();
	}

	@Override
	public int updateInfoUser(Users ruser) {
		// TODO Auto-generated method stub
		return usermapper.updateInfoUser(ruser);
	}

	@Override
	public int setMenuList(String userid, String liststr) {
		return adminmapper.setMenuList(userid,liststr);
	}

	
	@Override
	public int addImfo(String content, String valueOf,int num, int valueOf2, int valueOf3,String addman ,String optype) {
		HashMap<String ,Object> map = new HashMap<>();
		System.out.println("。。。。。。。。。。。。。。。。。。"+content);
		map.put("content", content);
		map.put("num", num);
		map.put("fruittype", valueOf);
		map.put("isshow", valueOf2);
		map.put("season", valueOf3);
		map.put("addman", addman);
		map.put("optype", optype);
		//增加操作
		if(optype == null || optype ==""){
			fruitImfoMapper.addImfo(map) ;
			return fruitImfoMapper.queryLastOne();
		}
		//修改操作
		if(optype != "")
			return fruitImfoMapper.UpdateImfo(map) ;
		return 1;
	}

	@Override
	public FruitImfo querybyName(int parseInt) {
		// TODO Auto-generated method stub
		return fruitImfoMapper.queryByName(parseInt);
	}

	@Override
	public JSONObject getAllPool(HashMap<String, Object> map, PaginationOther pagination) {
				map.put("pageSize",pagination.getRows());
				map.put("start",pagination.getRows()*(pagination.getPage()-1));
				List<DirtyPool> list= dirtyPoolMapper.getAllPoolBySearch(map);
				int totalCount = dirtyPoolMapper.getAllPoolBySearchTotol(map);
				JSONObject result = dataGridJson.toGridJson(totalCount, list);
				return result;
	}

	@Override
	public int updatePool(String content, String id) {
		// TODO Auto-generated method stub
		return dirtyPoolMapper.updatePool(content, Integer.parseInt(id));
	}

	@Override
	public int dirtyPoolOpration(String type, String content, String id) {
		// TODO Auto-generated method stub
		//删除
		if("11".equals(type)){
			return dirtyPoolMapper.deletePool(Integer.parseInt(id));
		}
		//增加
		if("12".equals(type)){
			return  dirtyPoolMapper.InsertPool(content);
		}
		//修改
		if("13".equals(type)){
			return  dirtyPoolMapper.updatePool(content, Integer.parseInt(id));
		}
		//评价手动 ，自动的配置修改
		Map<String ,Object> map = new HashMap<>();
		if("14".equals(type)){
			 if("1".equals(id)){
				 map.put("meg", "ss");
				 return  dictionMapper.updateconfig(map);
			 }else{
				 map.put("meg", "aa");
				 return  dictionMapper.updateconfig(map);
			 }
		}
			
		return 0;
	}

	@Override
	public String updateMoney(String users_id, String totalmoney) {
		// TODO Auto-generated method stub
		Map<String ,Object> map = new HashMap<>();
		map.put("money", totalmoney);
		map.put("userid", users_id);
		int a = usermapper.cutMoney(map);
		return  "ss";
	}
	

}
