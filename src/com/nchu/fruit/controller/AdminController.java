package com.nchu.fruit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nchu.fruit.pojo.Admins;
import com.nchu.fruit.pojo.DirtyPool;
import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.service.AdminsService;
import com.nchu.fruit.service.FruitService;
import com.nchu.fruit.serviceImp.FruitServiceImp;
import com.nchu.fruit.utils.PaginationOther;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *   @author James feng
 *   @date 2018年1月1日 下午2:32:07 
 *
 *   @version V1.0  
 *   @Description: TODO 
 */
@Controller
public class AdminController {

	@Autowired
	private AdminsService adminservice;
	
	@Autowired
	private FruitService fruitservice;
	
	//跳到管理员登入界面
	@RequestMapping("adminmanager")
	public String enterManagerment (){
		return "behindJsp/login";
	}
	
	//跳到管理员注册界面
		@RequestMapping("adminRegister")
		public String adminRegister (){
			return "behindJsp/register";
		}
		
	
	//登入跳入管理员首页
	@RequestMapping("adminlogin")
	@ResponseBody
	public String adminlogin (String userid,String password ,HttpServletRequest request,Model model){
		System.out.println("******************************管理员界面*********"+userid+"mima "+password);
		Admins   admins=adminservice.getAdmins(userid, password);
		
		JSONObject o  = new JSONObject();
		if(admins!=null){
			if(admins.getAdmin_role()==0){
				request.getSession().setAttribute("admin", admins);
				//超级管理员
				o.put("admin", "11");
			}else{
				if(admins.getAdmin_register()==1){
					o.put("admin", "11");
					request.getSession().setAttribute("admin", admins);
				}else{
					o.put("admin", "12");
				}
			}
		}else{
			o.put("admin", "13");
		}
		return o.toString();
	}
	
	//商户注册
	@ResponseBody
	@RequestMapping("adminDoRegister")
	public String adminDoRegister (String userid,String pass,String name,HttpServletRequest request){
		Admins admin = new Admins();
		admin.setAdmin_id(userid);
		admin.setAdmin_pass(pass);
		admin.setAdmin_name(name);
		int a = adminservice.addAdmins(admin);
		JSONObject O  = new JSONObject();
			O.put("success", "ok");
		return O.toString();
		
	}
	//获取用户的菜单列表
	@ResponseBody
	@RequestMapping("adminlist")
	public String adminlist (HttpServletRequest request){
		Admins admin = (Admins) request.getSession().getAttribute("admin");
		JSONObject O = new JSONObject();
		if(admin != null){
			O.put("meg", admin.getAdmin_list());
		}
		else{
			O.put("meg", "ok");
		}
		return O.toString();
		
	}
	@ResponseBody
	@RequestMapping("setMenuList")
	public String setMenuList (String userid, String liststr,HttpServletRequest request){
		int a = adminservice.setMenuList(userid,liststr);
		JSONObject O = new JSONObject();
		if(a  !=1 ){
			O.put("meg", "err");
		}
		else{
			O.put("meg", "ok");
		}
		return O.toString();
		
	}
	
	//得到一个管理员信息
	@RequestMapping(value="getAdmin",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getAdmin (String userid,String pass){
		
		return  JSONObject.fromObject(adminservice.getAdmins(userid, pass)).toString();
	}
	
	
	//管理员注册验证 yanzhenadmin
	@ResponseBody
	@RequestMapping(value="/yanzhenadmin", produces="text/html;charset=UTF-8")
	private String yanzhenadmin(String param ,String type){
		System.out.println(param+"(*************");
		int a = adminservice.getCheckAadmin(param,type);
		JSONObject O =new JSONObject();
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString();
	}
	
	//修改密码
	@ResponseBody
	@RequestMapping("updateadminpass")
	public String updateadminpass (String account,String pass,String name,HttpServletRequest request){
		System.err.println("ac"+account+"pass"+pass);
		Admins admin =(Admins) request.getSession().getAttribute("admin");
		admin.setAdmin_pass(pass);
		admin.setAdmin_name(name);
		request.getSession().setAttribute("admin", admin);
		int a = adminservice.updateInfo(admin);
		return "a";
		
	}
	
	
	
	//注销
	@RequestMapping("adminremove")
	public String adminremove (HttpServletRequest request){
		
		request.getSession().setAttribute("admin", "");
		return "behindJsp/login";
		
	}
	
	//跳到增加商品页面
	@RequestMapping("addProduct")
	public String addproject (HttpServletRequest request,String type,Model model){
		model.addAttribute("type", type);
		return "behindJsp/addProduct";
	}
	
	//跳回登入首页
	@RequestMapping("adminindex")
	public String adminindex (){
		return "behindJsp/index";
	}
	
	/*	分页，搜索
	 * 1 权限管理
	 * 2用户管理
	 * 3密码管理
	 * 4修改信息
	 */
	@RequestMapping("accountManager")
	public String accountManager (String type,String currentpage,String scontent,String of,HttpServletRequest request,Model model){
		JSONArray list=new JSONArray();
		String content="";
		if(type.equals("13")){
			model.addAttribute("type",type);
			return "behindJsp/accountManager";
		}
		//scontent为空则为链接来的，不为空为搜索框提交来的
		
		if(scontent == null){
			System.err.println("scontent+***********"+scontent);
			list=adminservice.getAccount(type,currentpage,"");		
		}
		else{
			if(of==null){
				content = scontent;
			}else{
				try {
					content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			list=adminservice.getAccount(type,currentpage,content);
		}
			
			model.addAttribute("scontent",content);
			model.addAttribute("currentpage",currentpage);
			model.addAttribute("type",type);
			model.addAttribute("info", list);
			return "behindJsp/accountManager";
		
	}
	
	//修改水果信息
	@ResponseBody
	@RequestMapping(value="updatefruitByid", produces="text/html;charset=UTF-8")
	public String updatefruitByid (String fruitid,HttpServletRequest request){
		Fruits f=fruitservice.getById(Integer.parseInt(fruitid));
		
        JSONObject json = JSONObject.fromObject(f);
        System.err.println("json^^^^^^^^^^^"+json.toString());
        return json.toString();
	}
	
	
	/*
	 * 库存管理
	 */
	
	@RequestMapping(value="batchManager"/*, produces="text/html;charset=UTF-8"*/)
	public String batchManager (String type,String currentpage,String size , String amount, String scontent, String of,HttpServletRequest request,Model model){
		JSONArray list=new JSONArray();
		System.err.println("************"+type+"c+"+currentpage+"ll"+size+"ss"+amount+"sco"+scontent+"of"+of);
		String content="";
		//scontent为空则为链接来的，不为空为搜索框提交来的
		if(scontent == null){
			list=adminservice.batchManager(type,currentpage,size,amount,"");	
		}else{
			//of的作用是搜索分页点第几页的时候为了传的scontent如果是中文而乱码。
			if(of==null){
				content = scontent;
			}else{
				try {
					content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			list=adminservice.batchManager(type,currentpage,size,amount,content);	
		}
		
		Map<String,String> map=new HashMap<String,String>();
		System.err.println("jsjsj"+list.toString());
		map.put("type",type);
		map.put("currentpage",currentpage );
		map.put("size",size);
		map.put("amount",amount);
		map.put("scontent",content);
		
		model.addAttribute("map",map);
		model.addAttribute("list", list);
		return "behindJsp/batchManager";
	}
	
	
	@ResponseBody
	@RequestMapping("updateAmount")
	public String updateAmount (String string,String shezhiamount){
		int a = adminservice.updateAmount(string ,shezhiamount);
		JSONObject O =new JSONObject();
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString();
	}
	//设置上下架状态
	@ResponseBody
	@RequestMapping("updateFruit_states")
	public String updateFruit_states (String string,String obj){
		int a = adminservice.updateFruit_states(string ,obj);
		JSONObject O =new JSONObject();
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString();
	}
	
	 /* 上下架管理
	 *  type ：上下架管理 ;currentpage 当前页：1; size:每页数量；scontent：搜索内容； values：代表上下架状态 ;
	 *  of:是否来自分页数字的链接，startdata：起始日期，enddata:结束日期
	 *  
	 */
	
	@RequestMapping(value="batchManagerofshangxiajia")
	public String batchManagerofshangxiajia (String type,String currentpage,String size, String scontent,
			String values,String of,String startdata,String enddata,HttpServletRequest request,Model model){
		System.err.println("*********type**"+type+"currentpage:"+currentpage+"size"+size+"scontent"+scontent+"values"+values+"of"+of+"enddata"+enddata);
		JSONArray list=new JSONArray();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("type",type);
		map.put("currentpage",Integer.parseInt(currentpage));
		map.put("size",Integer.parseInt(size));
		map.put("values",values);
		map.put("startdata",startdata);
		map.put("enddata",enddata);
		String content="";
		//scontent为空则为链接来的，不为空为搜索框提交来的
		if(scontent == null){
			map.put("scontent","");
			list=adminservice.batchManagerofshangxiajia(map);	
		}else{
			//of的作用是搜索分页点第几页的时候为了传的scontent如果是中文而乱码。
			if(of==null){
				content = scontent;
			}else{
				try {
					content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			map.put("scontent",content);
			list=adminservice.batchManagerofshangxiajia(map);	
		}
		System.out.println("输出的只为********"+list.toString());
		model.addAttribute("map",map);
		model.addAttribute("list", list);
		return "behindJsp/batchManager";
	}
	
		//订单批量管理
	@RequestMapping("batchManagerOrder")
	public String searchcontent (String type,String currentpage,String size,
			String startdata,String enddata,String vals,String scontent,String of ,
			HttpServletRequest request,Model model){
		
		JSONArray list=new JSONArray();
		Map<String,Object> map=new HashMap<String,Object>();
		System.out.println("ss"+type);
		map.put("type",type);
		map.put("currentpage",Integer.parseInt(currentpage));
		map.put("size",Integer.parseInt(size));
		map.put("vals",vals);
		map.put("startdata",startdata);
		map.put("enddata",enddata);
		String content="";
		if(scontent == null){
			map.put("scontent","");
			list=adminservice.batchManagerofOrders(map);	
		}else{
			//of的作用是搜索分页点第几页的时候为了传的scontent如果是中文而乱码。
			if(of==null){
				content = scontent;
			}else{
				try {
					content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			map.put("scontent",content);
			list=adminservice.batchManagerofOrders(map);	
		}
		System.out.println("输出的为********"+list.toString());
		model.addAttribute("map",map);
		model.addAttribute("list", list);
		return "behindJsp/batchManager";
	}
		/*
		 * 评论批量管理（24）
		 *  xing是等级的意思默认为全部等级
		 *   scontent是完整的人的账号，不是模糊查询
		 *   state 是默认 查询审核状态为0 （未审核）
		 */
		@RequestMapping("batchManagerDiscuss")
		public String batchManagerDiscuss (String type,String currentpage,String size,String state,
				String startdata,String enddata,String xing,String scontent,String of ,
				HttpServletRequest request,Model model){
			
			JSONArray list=new JSONArray();
			Map<String,Object> map=new HashMap<String,Object>();
			System.out.println("ss"+type+"等级vals"+xing+"状态"+state);
			map.put("type",type);
			map.put("currentpage",Integer.parseInt(currentpage));
			map.put("size",Integer.parseInt(size));
			if(xing==null||xing=="")
				map.put("xing",xing);
			else{
				map.put("xing",Integer.parseInt(xing));
			}
			map.put("state",state);
			map.put("startdata",startdata);
			map.put("enddata",enddata);
			//按人的id编号搜索吧
			String content="";
			if(scontent == null){
				map.put("scontent","");
				list=adminservice.batchManagerofDiscuss(map);	
			}else{
				//of的作用是搜索分页点第几页的时候为了传的scontent如果是中文而乱码。
				if(of==null){
					content = scontent;
				}else{
					try {
						content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				map.put("scontent",content);
				list=adminservice.batchManagerofDiscuss(map);	
			}
			System.out.println("输出的为********"+list.toString());
			model.addAttribute("map",map);
			model.addAttribute("list", list);
			return "behindJsp/batchManager";
		}
		
		//评论审核，发布状态
		@ResponseBody
		@RequestMapping("updatecomment_states")
		public String updatecomment_states (String string,String obj){
			int a = adminservice.updatecomment_states(string ,obj);
			JSONObject O =new JSONObject();
			if(a==1){
				O.put("meg", "ok");
			}else{
				O.put("meg", "error");
			}
			return O.toString();
		}
		//运单产生情况
		@ResponseBody
		@RequestMapping("produce_yundao")
			public String produce_yundao (String danhao,String orderid){
				int a = adminservice.produce_yundao(danhao ,orderid);
				JSONObject O =new JSONObject();
				if(a==1){
					O.put("meg", "ok");
				}else{
					O.put("meg", "error");
				}
				return O.toString();
			}
		
		
		/*
		 *  催单列表(20) 查询的是未发货，客户催单的记录，已发货不做处理
		 *  amounts --：评论次数的范围，测试返回的是什么
		 *  scontent --：只能查询模糊匹配的订单
		 */
		@RequestMapping("batchManagercuidan")
		public String batchManagercuidan (String type,String currentpage,String size,
				String amounts,String scontent,String of ,	String startdata,String enddata,
				HttpServletRequest request,Model model){
			
			JSONArray list=new JSONArray();
			Map<String,Object> map=new HashMap<String,Object>();
			System.out.println("ss"+type+"等级vals"+amounts+"状态"+scontent);
			map.put("type",type);
			map.put("currentpage",Integer.parseInt(currentpage));
			map.put("size",Integer.parseInt(size));
			if(amounts==null||amounts=="")
				map.put("amounts",amounts);
			else{
				map.put("amounts",Integer.parseInt(amounts));
			}
			map.put("startdata",startdata);
			map.put("enddata",enddata);
			//按订单编号搜索吧
			String content="";
			if(scontent == null){
				map.put("scontent","");
				list=adminservice.batchManagerofCuidan(map);	
			}else{
				//of的作用是搜索分页点第几页的时候为了传的scontent如果是中文而乱码。
				if(of==null){
					content = scontent;
				}else{
					try {
						content=new String(scontent.getBytes("iso-8859-1"),"utf-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				map.put("scontent",content);
				list=adminservice.batchManagerofCuidan(map);	
			}
			System.out.println("输出的为********"+list.toString());
			model.addAttribute("map",map);
			model.addAttribute("list", list);
			return "behindJsp/batchManager";
		}
	
	/*
	 * 消息服务列表	(type)
	 * (1) 、 聊天列表(19)
	 */
	 @RequestMapping("serviceInfo")
		public String serviceInfo (String type,String isread,HttpServletRequest request,Model model){
			JSONArray list=new JSONArray();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("type", type);
			map.put("isread", isread);
			System.out.println("ss"+type+"...........isread"+isread);
			
			list = adminservice.serviceInfo(map);
			System.out.println("list"+list.toString()+"...........");
			model.addAttribute("map",map);
			model.addAttribute("list", list);
			return "behindJsp/info";
		}
	 
	 	//动态加载管理员聊天信息
	 	@ResponseBody
	 	@RequestMapping(value="serviceInfoLsit",produces="text/html;charset=UTF-8")
		public String serviceInfoLsit (String type,String isread,HttpServletRequest request,Model model){
			JSONArray array=new JSONArray();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("type", type);
			map.put("isread", isread);
			array = adminservice.serviceInfo(map);
			
			return array.toString();
		}
	 
	 @RequestMapping("dalog")
		public String dalog (String sendid,String fruit_id,HttpServletRequest request,Model model){
			JSONArray list=new JSONArray();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("sendid", sendid);
			map.put("fruit_id", fruit_id);
			System.out.println("sendid"+sendid+"...........fruit_id"+fruit_id);
			
		/*	list = adminservice.serviceInfo(map);*/
			System.out.println("list"+list.toString()+"...........");
			model.addAttribute("map",map);
			model.addAttribute("list", list);
			return "behindJsp/dalogIframe";
		}
	//销售统计页面
	 @RequestMapping("CountSell")
		public String searchcontent (String type,HttpServletRequest request,Model model){
			JSONArray array= new JSONArray();
			HashMap<String ,Object> map = new HashMap<>();
			map.put("type", type);
			
			model.addAttribute("map",map);
			model.addAttribute("info", array);
		return "behindJsp/CountSell";
	 }
	 
	 
	 //统计月销售量(根据年限查询)
	 @ResponseBody
	 @RequestMapping(value="CountOfMonthSell" )
		public String CountOfMonthSell (String year ,HttpServletRequest request,Model model){
			JSONArray array= new JSONArray();
			HashMap<String ,Object> map = new HashMap<>();
			
			List<Map<String ,Object>> list =adminservice.getMonthByYear(year);
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
					map1.put("sum", 0);
					array.add(map1);
				}
			}
			
			//System.out.print("arraySyring"+array.toString());
			return array.toString();
	 	}
	 
	 //订单成交量
	 @ResponseBody
	 @RequestMapping(value="ordersSuccess",produces="text/html;charset=UTF-8")
		public String ordersSuccess (String year ,HttpServletRequest request,Model model){
			JSONArray array= adminservice.ordersSuccess(year);
			//HashMap<String ,Object> map = new HashMap<>();
			System.err.print("************array*******"+array.toString());
		
			return array.toString();
	 	}
	 
	 //年销售量前十
	 @ResponseBody
	 @RequestMapping(value="countTopTenByYear",produces="text/html;charset=UTF-8")
		public String countTopTenByYear (String year ,HttpServletRequest request,Model model){
			JSONArray array= adminservice.countTopTenByYear(year);
			//HashMap<String ,Object> map = new HashMap<>();
			System.err.print("************"+array.toString());
		
			return array.toString();
	 	}
	 
	 
	 //上传到一个临时储存文件，再返回到原来的图片放置页面
	 @ResponseBody
	 @RequestMapping(value="tempFiles",produces="text/html;charset=UTF-8")
		public String tempFiles (	@RequestParam("file[]")  MultipartFile[] multipartFiles,
				HttpServletRequest request,Model model){
		 String path="D:/ImprotantPictures/temp";
		 JSONArray array = new JSONArray();
		 for (MultipartFile multipartFile : multipartFiles){
			 JSONObject O =new JSONObject();
				O.put("name", multipartFile.getOriginalFilename());
				array.add(O);
			   File file = new File(path,multipartFile.getOriginalFilename());
			   
			   try {
				   //复制文件
				multipartFile.transferTo(file);
				System.out.println("*****************上传成功*****************");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				System.out.println("上传失败");
				e.printStackTrace();
			}
		 }
		System.out.println("aaa*************"+array.toString());
			return array.toString(); 
	 	}
	//查询水果最后的id
	 @ResponseBody
	 @RequestMapping(value="lastid",produces="text/html;charset=UTF-8")
		public String queryLastId (){
		 JSONObject O =new JSONObject();
		int lastid =adminservice.queryLastId();
		O.put("id", lastid+1);
		 return O.toString();
	 	}
	 	//增加水果
		 @ResponseBody
		 @RequestMapping(value="addFruit",produces="text/html;charset=UTF-8")
			public String addFruit (String fruit_place_f,String fruit_id,String fruit_type ,String fruit_name ,String fruit_amount ,
					String fruit_price ,String fruit_sellprice  ,String fruit_place,String  fruit_states,String fruit_enterprice,
					String fruit_time,String fruit_date ,String fruit_info,String picname,HttpServletRequest request){
			 Fruits fruit=new Fruits();
			Admins admin =  (Admins) request.getSession().getAttribute("admin");
			 fruit.setAddman(admin.getAdmin_name());
			 fruit.setFruit_enterprice(Float.parseFloat(fruit_enterprice));
			 fruit.setFruit_date(Integer.parseInt(fruit_date));
			 fruit.setFruit_amount(Integer.parseInt(fruit_amount));
			 //防止多个人录入数据引起id冲突
			 fruit.setFruit_images(String.valueOf(adminservice.queryLastId()+1));
			 fruit.setFruit_info(fruit_info);
			 fruit.setFruit_name(fruit_name);
			 if(fruit_place_f.equals("11")){
				 fruit.setFruit_place("f"+fruit_place);
			 }else{
				 fruit.setFruit_place(fruit_place);
			 }
			 fruit.setFruit_price(Float.parseFloat(fruit_price));
			 fruit.setFruit_sellprice(Float.parseFloat(fruit_sellprice));
			 fruit.setFruit_states(Integer.parseInt(fruit_states));
			 fruit.setFruit_time(fruit_time);
			 fruit.setFruit_type(fruit_type);
			 String pic[] =picname.split("/");
			 fruit.setFruit_imgcount(pic.length);
			 System.err.println(picname+"*******+水果的信息"+fruit.toString());
			 int a =adminservice.addFruit(fruit,picname);
			 JSONObject O =new JSONObject();
			O.put("meg", "ok");
			 return O.toString();
		 	}
		 
		 
		 //权限修改
		 @ResponseBody
		@RequestMapping("updateRole")
			public String updateRole (String type,String role,String id,HttpServletRequest request){
			 
				int a = adminservice.updateRole(type,role,id);
				 JSONObject O =new JSONObject();
				O.put("meg", "ok");
				 return O.toString();
				
			}
		 
		 //管理员首页消息动态加载
		 @RequestMapping(value = "indexInfoList",produces="text/html;charset=UTF-8")
		 @ResponseBody
			public String indexInfoList (HttpServletRequest request,Model model){

			return  adminservice.getIndexInfoList();
		 }
		 
		 //跳到知识增加页面
		 @RequestMapping("addFruitImfo")
			public String addFruitImfo (Model model,String type){
			 	
			 	model.addAttribute("type",type);
				return "behindJsp/addFruitImfo";
			}
		//增加
		 @ResponseBody
		 @RequestMapping("addfruitImfo")
			public JSONObject addImfo (String content,String  num,String  fruittype,
					String isshow,String season,HttpServletRequest request, String optype){
			 	JSONObject O = new JSONObject();
			 	Admins  admin = (Admins) request.getSession().getAttribute("admin");
		 		int result = adminservice.addImfo(content,fruittype,Integer.parseInt(num),Integer.parseInt(isshow),Integer.parseInt(season),admin.getAdmin_name(),optype);
		 		O.put("data",result);
		 		O.put("meg", "success");
			 	return  O;
			}
		 @ResponseBody
		 @RequestMapping("querybyName")
			public FruitImfo querybyName (String  num){
			 	FruitImfo fruitImfo = adminservice.querybyName(Integer.parseInt(num));
			 	if(fruitImfo == null){
			 		FruitImfo temp =new  FruitImfo() ;
			 		temp.setId(0);
			 		return temp;
			 	}else
			 		return fruitImfo;
			}
		 
		 
	@RequestMapping("discussConfig")
	public String discussConfig(String type, HttpServletRequest request, Model model) {
		model.addAttribute("type", type);
		return "behindJsp/discussConfig";
	}
	
	@ResponseBody
	@RequestMapping(value ="dirtyPool",produces="text/html;charset=UTF-8" )
	public JSONObject dirtyPool(PaginationOther pagination,@RequestParam( value="scontent",required =false) String scontent ) {
		HashMap<String, Object> map =new HashMap<>();
		map.put("scontent", scontent);
			
		return adminservice.getAllPool(map , pagination);
	}
	

	@ResponseBody
	@RequestMapping("updatePool")
	public JSONObject updatePool( String content ,String id) {
		JSONObject o = new JSONObject();
		int a = adminservice.updatePool(content,id);
		o.put("meg", "success");
		return o;
	}
	
	//脏词库操作
	@ResponseBody
	@RequestMapping("dirtyPoolOpration")
	public JSONObject dirtyPoolOpration( @RequestParam(value="content" ,required=false) String content ,
			@RequestParam(value="id" ,required=false)	String id,@RequestParam(value="type" ,required=false) String type) {
		JSONObject o = new JSONObject();
		
		int a = adminservice.dirtyPoolOpration(type,content,id);
		o.put("meg", "success");
		return o;
	}
	
	
	

}
