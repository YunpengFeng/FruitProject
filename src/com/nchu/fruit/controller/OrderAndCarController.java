package com.nchu.fruit.controller;

import java.io.File;
import java.io.IOException;
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

import com.nchu.fruit.pojo.Cars;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Items;
import com.nchu.fruit.pojo.Orders;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.AdminsService;
import com.nchu.fruit.service.OrderAndCarService;
import com.nchu.fruit.utils.DateUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class OrderAndCarController {
	
	@Autowired
	private OrderAndCarService car_order;
	
	@Autowired
	private AdminsService adminservice;
	//添加到购物车,重定向到商品详情页
	@RequestMapping("/addcar")
	public String addCar(@RequestParam("amount") String amount ,
								@RequestParam("id") String id ,
							Model model,HttpServletRequest requst){
		
		Users user=(Users) requst.getSession().getAttribute("user");
		int a = car_order.addcar( Integer.parseInt(amount) ,Integer.parseInt(id),user.getUsers_id());
		return "redirect:product?id="+id;
		
	}
	
	//点击商品的加号添加一件到购物车
	@ResponseBody
	@RequestMapping(value="/addcarone",produces="text/html;charset=UTF-8")
	public String addcarone(HttpServletRequest requst,@RequestParam("id") String id){
		Users user=(Users) requst.getSession().getAttribute("user");
		int a = car_order.addcar( 1 ,Integer.parseInt(id),user.getUsers_id());
			JSONObject o = new JSONObject();
			o.put("meg", "ok");
			return o.toString();
	}
	
	//显示小购物车
	@ResponseBody
	@RequestMapping(value="/smallcar",produces="text/html;charset=UTF-8")
	public String samllcar(HttpServletRequest requst){
		Users user=(Users) requst.getSession().getAttribute("user");
		List<Map<String,String>> list = car_order.queryCarTen(user.getUsers_id());
		JSONArray array=new JSONArray();
		for(Map<String ,String> map : list){
			JSONObject o = new JSONObject();
			array.add(map);
		}
		System.out.println("json字符sssssssss串是"+array.toString());
		return array.toString();

	}
	//加载全部的购物车
	@RequestMapping("/shopping")
	public String shopping(Model model,HttpServletRequest requst){
		Users user=(Users) requst.getSession().getAttribute("user");
		model.addAttribute("map", car_order.getMapListCarAll(user.getUsers_id()));
		return "frontJsp/shopping";
	
	}
	
	//异步发送数据 购物商品数量
	@ResponseBody
	@RequestMapping(value="/changeAmount",produces="text/html;charset=UTF-8")
	public String changeAmount(HttpServletRequest requst, String amount,String id){
		Users user=(Users) requst.getSession().getAttribute("user");
		Cars car =new Cars();
		car.setAmount(Integer.parseInt(amount));
		car.setusers_id(user.getUsers_id());
		car.setFruit_id(Integer.parseInt(id));
		
		int a = car_order.updateCar(car);
		JSONObject o = new JSONObject();
		o.put("meg", a);
		
		System.out.println("json字符sssssssss串是"+o.toString());
		return o.toString();
	}
	
	
	/*  	  结算页面
	 * 要插入的数据 1.订单编号：时间+用户编号(String 类型)
	 *                     2.订单时间 3.订单人（用户编号）
	 */
	@RequestMapping("/topay")
	public String topay( String info,Model model,HttpServletRequest requst){
		Users user=(Users) requst.getSession().getAttribute("user");
		String orderid=DateUtil.gettime()+user.getUsers_id();
		String  time=DateUtil.getTime();
		//产生订单表但是不插入订单详情中
		System.out.println("info*********************"+info);
		int a =car_order.addOrder(orderid,user.getUsers_id(),time ,info);
		List<Map<String ,String>> list=car_order.getcarItem(info);
		
		model.addAttribute("list", list);
		model.addAttribute("time",time);
		model.addAttribute("orderid",orderid);
		model.addAttribute("info", info);
		return "frontJsp/pay";
	
	}
	
	//*********付款，还未完成当库存不足时
	@RequestMapping("/info")
	public String info( String orderid,String info,String address,String totalmoney,
			String phone,String man,String radios,
			Model model,HttpServletRequest requst){
		Users user=(Users) requst.getSession().getAttribute("user");
		//string返回的是没有库存不足的的商品的信息id 和数量amount ,暂时先
		Orders order = car_order.queryOrdersById(orderid);
		if(order.getPay_states() ==0){
			String string=car_order.updateOrderById(orderid,info,address,phone,user.getUsers_id(),man);
		}
		//使用余额，足更改余额，不足使用其他支付方式不作处理 ????? Float.parseFloat()?失败
		if("2".equals(radios)){
			float  l = Float.parseFloat(totalmoney);
			System.out.println("llllllllllll"+l);
			String updateMoney = adminservice.updateMoney(user.getUsers_id(),String.valueOf((user.getMoney()-Double.parseDouble(totalmoney))));
			
			user.setMoney(user.getMoney()-Float.parseFloat(totalmoney));
			requst.getSession().setAttribute("user","");
			requst.getSession().setAttribute("user",user);
		}
		return "frontJsp/temp";
	}
	
	
	@RequestMapping("/fromManagerTopay")
	public String fromManagerTopay( String orders_id ,
			Model model,HttpServletRequest requst){
		//Users user=(Users) requst.getSession().getAttribute("user");
		
		Orders orders = car_order.queryOrdersById(orders_id);
		List<Map<String ,String>> list=car_order.getcarItem(orders.getTempinfo());
		model.addAttribute("list", list);
		model.addAttribute("time",orders.getOrder_time());
		model.addAttribute("orderid",orders_id);
		model.addAttribute("info", orders.getTempinfo());
		return "frontJsp/pay";
	}
	
	/*
	 * 管理页面
	 * 1 ，我的订单
	 * 2. 待付款
	 * 3. 待收货
	 * 4.  待评价
	 * 5 .待发货
	 * 6信息设置
	 * 8我的收藏
	 */
	@RequestMapping("/manager")
	public String manager( String type ,
			Model model,HttpServletRequest requst){
		Users user=(Users) requst.getSession().getAttribute("user");
		if(type.equals("9")){
			return "redirect:shopping";
		}
		JSONArray array=	car_order.doManager(user.getUsers_id(),type);
		
		model.addAttribute("array",array);
		System.err.println("arrayString"+array.toString()+"***********");
		model.addAttribute("type",type);
		return "frontJsp/managerhead";
	}
	
	//订单详情加载
	@ResponseBody
	@RequestMapping(value="/getOrdersItems",produces="text/html;charset=UTF-8")
	public String getOrdersItems(HttpServletRequest requst, String orderid){
		JSONArray array=new JSONArray();
		List<Items> list  =car_order.getOrdersItems(orderid);
		Orders orders=car_order.queryOrdersById(orderid);
		array.add(orders);
		
		for(Items item : list){
			array.add(item);
		}
	
		System.out.println("json字符sssssssss串是"+array.toString());
		return array.toString();
	}
	
	//修改订单的相关的状态
	@ResponseBody
	@RequestMapping(value="/updatStates",produces="text/html;charset=UTF-8")
	public String updatStates(HttpServletRequest requst, String orderid,String type){
		
		int a = car_order.updatStates(orderid,type);
		JSONObject O =new JSONObject();
		System.err.println("a******************8"+a);
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString();
	}
	
	
	//评论,上传图片
		@ResponseBody
		@RequestMapping(value="/discussItem",produces="text/html;charset=UTF-8")
		public String discussItem(HttpServletRequest requst, String num,String content,String itemid,
				String picname){
			Users user=(Users) requst.getSession().getAttribute("user");
			int a = car_order.addDiscuss(num,content,itemid,user.getUsers_id(),picname);
			JSONObject O =new JSONObject();
			if(a==1){
				O.put("meg", "ok");
			}else{
				O.put("meg", "error");
			}
			return O.toString(); 
			
		}
	/*//评论,上传图片success Ohyeah!
	@ResponseBody
	@RequestMapping(value="/discussItem",produces="text/html;charset=UTF-8")
	public String discussItem(HttpServletRequest requst, String num,String content,String itemid,
			@RequestParam("file[]")  MultipartFile[] multipartFiles){
		Users user=(Users) requst.getSession().getAttribute("user");
		int a = car_order.addDiscuss(num,content,itemid,user.getUsers_id(),multipartFiles.length);
		//保存图片操作
			int counts=1;
			String path="D:/ImprotantPictures/commentPictures";
			System.err.println("多少个**************************"+multipartFiles.length);
		   for (MultipartFile multipartFile : multipartFiles){
			   System.out.println("图片位置"+path+(itemid+"_("+counts+").png"));
			   File file = new File(path,itemid+"_("+counts+").png");
			   try {
				   使用getSize()方法获得文件长度，以此决定允许上传的文件大小。

				   l  使用isEmpty()方法判断上传文件是否为空文件，以此决定是否拒绝空文件。

				   l  使用getInputStream()方法将文件读取为java.io.InputStream流对象。

				   l  使用getContentType()方法获得文件类型，以此决定允许上传的文件类型。

				   l  使用transferTo（dest）方法将上传文件写到服务器上指定的文件。
				multipartFile.transferTo(file);
				
				System.err.println("上传成功");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.err.println("上传失败");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.err.println("鬼知道怎么失败！");
			}
               counts++;
		   }
		
		JSONObject O =new JSONObject();
		System.err.println("a*******************"+a);
		if(a==1){
			O.put("meg", "ok");
		}else{
			O.put("meg", "error");
		}
		return O.toString(); 
		
	}*/
	
	
	//水果详情加载水果评论
	@ResponseBody
	@RequestMapping(value="/getDicussByFruit",produces="text/html;charset=UTF-8")
	public String getDicussByFruit(HttpServletRequest requst, String fruitid){
		List<Map<String, String>> list = car_order.getDicussByFruit(fruitid);
		JSONArray array=new JSONArray();
		for(Map<String, String> map : list){
			array.add(map);
		}
		return array.toString();
	}
	
		//删除购物车 、移到,删除收藏夹
		@ResponseBody
		@RequestMapping(value="/oparetion",produces="text/html;charset=UTF-8")
		public String oparetion(String type,String id ,HttpServletRequest requst, String fruitid){
			Users user=(Users) requst.getSession().getAttribute("user");
			
			int a  =car_order.oparetionMove(type,id,user.getUsers_id());
			JSONObject O =new JSONObject();
			
			O.put("meg",a );
			return O.toString(); 
		}
	
		//催单 上限十次
		@ResponseBody
		@RequestMapping(value="/outOrders",produces="text/html;charset=UTF-8")
		public String outOrders(String type,String orderid ,HttpServletRequest requst){
			Users user=(Users) requst.getSession().getAttribute("user");
			
			Map<String, Object> map =new HashMap<>();
			map.put("type", type);
			map.put("orderid", orderid);
			
			int a  =car_order.outOrders(map);
			JSONObject O =new JSONObject();
			//达到上限
			if(a ==0){
				O.put("meg","error" );
				
			}else{
				//未达到上限
				O.put("meg","ok" );
			}
			return O.toString(); 
		}
		
		
		
		//管理页面数量获取
		@RequestMapping(value="/ManagerOfAmount", produces="text/html;charset=UTF-8")
		@ResponseBody
		private String managerOfAmount(HttpServletRequest requst ){
			
			Users user=(Users) requst.getSession().getAttribute("user");
			Map<String, String> map =new HashMap<>();
			map.put("userid",user.getUsers_id());
			
		return car_order.getManagerOfAmount(map);
		}
	
		//取消订单 分为两种类型 ，未支付 直接取消 默认审核通过， 已支付取消需要审核
		@ResponseBody
		@RequestMapping(value="/cancle_order",produces="text/html;charset=UTF-8")
		public JSONObject cancle_order(String type,String orderid ,HttpServletRequest requst){
			Map<String, Object> map =new HashMap<>();
			map.put("type", type);
			map.put("orderid", orderid);
			int a  =car_order.cancle_order(map);
			JSONObject O =new JSONObject();
			O.put("meg", "ok");
			O.put("type", type);
			return O;
		}
		
		

}

