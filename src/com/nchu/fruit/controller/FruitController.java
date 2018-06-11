package com.nchu.fruit.controller;

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

import com.nchu.fruit.pojo.FruitImfo;
import com.nchu.fruit.pojo.Fruits;
import com.nchu.fruit.pojo.Users;
import com.nchu.fruit.service.FruitService;
import com.nchu.fruit.serviceImp.FruitServiceImp;
import com.nchu.fruit.utils.DateUtil;
import com.nchu.fruit.utils.Pagination;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *   @author James feng
 *   @date 2017年12月13日 下午7:29:55 
 *
 *   @version V1.0  
 *   @Description: TODO 
 */

@Controller
public class FruitController {
	
	@Autowired
	private FruitService fruitservice;
	//跳到首页
	@RequestMapping(value="/index")
	private String index(HttpServletRequest request){
		return "frontJsp/index";
		
	}
	
	//新水果上市
	@ResponseBody
	@RequestMapping(value="/news", produces="text/html;charset=UTF-8")
	private String getNews(){
		List<Fruits> list=fruitservice.getFruitList();
		JSONArray array=new JSONArray();
		for(Fruits f : list){
			JSONObject o = new JSONObject();
			o.put("id", f.getFruit_id());
			o.put("name", f.getFruit_name());
			o.put("pic" ,f.getFruit_images());
			o.put("sprice", f.getFruit_sellprice());
			o.put("price",f.getFruit_price());
			array.add(o);
		}
		//System.out.println("json字符串是"+array.toString());
		return array.toString();
	}
	
	//水果种类
	@ResponseBody
	@RequestMapping(value="/fruittype", produces="text/html;charset=UTF-8")
	private String fruitType(){
		List<String> list=fruitservice.getType();
		JSONArray array=new JSONArray();
		for(String s : list){
			JSONObject o = new JSONObject();
			o.put("type", s);
			array.add(o);
		}
		System.out.println("json字符串是"+array.toString());
		return array.toString();
	}
	//进口水果
		@ResponseBody
		@RequestMapping(value="/jinkou", produces="text/html;charset=UTF-8")
		private String fruitJinKou(){
			List<Fruits> list=fruitservice.jinKou();
			JSONArray array=new JSONArray();
			for(Fruits f : list){
				JSONObject o = new JSONObject();
				o.put("id", f.getFruit_id());
				o.put("name", f.getFruit_name());
				o.put("pic" ,f.getFruit_images());
				o.put("sprice", f.getFruit_sellprice());
				o.put("price",f.getFruit_price());
				o.put("place", f.getFruit_place().substring(1, f.getFruit_place().length()));
				array.add(o);
			}
			System.out.println("json字符串是"+array.toString());
			return array.toString();
		}
		
		//折扣水果
		@ResponseBody
		@RequestMapping(value="/zhekou", produces="text/html;charset=UTF-8")
		private String zhekou(){
			List<HashMap<String,String>> list=fruitservice.zhekou();
			JSONArray array=new JSONArray();
			for(HashMap<String,String> map : list){
				array.add(map);
			}
			System.out.println("json字符串是"+array.toString());
			return array.toString();
		}
		
		
		//更多水果
		@RequestMapping(value="/more") 
		public String more(@RequestParam("type") String type ,Model model){
			//新品
			if("1".equals(type)){
				model.addAttribute("list", fruitservice.getFruitList());
			}
			//折扣
			if("2".equals(type)){
				model.addAttribute("list",fruitservice.zhekou());
			}
			//进口水果
			if("3".equals(type)){
				model.addAttribute("list",fruitservice.jinKou());
			}
			
			model.addAttribute("type", type);
			return "frontJsp/list";
			
		}
		//点击加载更多水果
		@ResponseBody
		@RequestMapping(value="/loadmore",produces="text/html;charset=UTF-8") 
		public String loadmore(@RequestParam("type") String type ,String page){
			
			List<Fruits> list=fruitservice.getMoreList(type ,Integer.parseInt(page));
			if(list !=null &&list.size()>0){
				JSONArray array=new JSONArray();
				for(Fruits f : list){
					JSONObject o = new JSONObject();
					o.put("id", f.getFruit_id());
					o.put("name", f.getFruit_name());
					o.put("pic" ,f.getFruit_images());
					o.put("sprice", f.getFruit_sellprice());
					o.put("price",f.getFruit_price());
					o.put("place", f.getFruit_place());
					array.add(o);
				}
				System.out.println("json字符串是"+array.toString());
				return array.toString();
			}
			else{
				JSONObject o = new JSONObject();
				o.put("meg", "none");
				System.out.println("json字符串是none"+o.toString());
				return o.toString();
			}
		}
		
		/*搜索框异步加载内容*/
		@ResponseBody
		@RequestMapping(value="/ajaxSearch", produces="text/html;charset=UTF-8")
		private String ajaxSearch(String content){
			JSONArray array=new JSONArray();
			List<String> list  =fruitservice.getSearchContent(content);
			for(String s : list){
			JSONObject o = new JSONObject();
				o.put("name", s);
				array.add(o);
			}
			System.out.println("ssssssssssssssss"+array.toString());
			return array.toString();
		}
		
		/*
		 * 一.搜索内容显示
		 * 二.水果大全显示
		 * 三.前端要传输的参数：1 是哪个要显示  2 ，当前页   3 .查找的内容
		 * 
		 */
			
		//查找分页
		@RequestMapping(value="/search") 
		public String search(
				@RequestParam("content")  String content,
				@RequestParam("crruentpage") String crruentpage ,
				String of,Model model){
			//*************由于<a href 中带有中文，传过来会乱码所以要转码>*************
				String  con="";
			if("aa".equals(of)){
				try {
					con=new String(content.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					System.out.println("转码失败");
					e.printStackTrace();
				}
			}
			if(of==null){
				con=content;
			}
			Pagination pagination =fruitservice.getPages(con);
			pagination.setCurrentPage(Integer.parseInt(crruentpage));
			List<Fruits> list =fruitservice.getSearchList(pagination , con);
			model.addAttribute("list", list);
			model.addAttribute("pagination", pagination);
			model.addAttribute("content", con);
			return "frontJsp/search";
		}
		
		
		//水果大全点击链接
		@RequestMapping(value="/type") 
		public String type(@RequestParam("id")  String id ,String crruentpage,Model model){
			int crruent = 0;
			if(crruentpage ==null){
				crruent =1;
			}else{
				crruent = Integer.parseInt(crruentpage);
			}
			Pagination pagination =fruitservice.getPage(Integer.parseInt(id));
			pagination.setCurrentPage(crruent);
			List<Fruits> list =fruitservice.getTypeList(pagination , Integer.parseInt(id));
			model.addAttribute("list", list);
			model.addAttribute("pagination", pagination);
			model.addAttribute("id", id);
			return "frontJsp/typeList";
		}
		
		//商品详情
		@RequestMapping(value="/product") 
		public String product(@RequestParam("id")  String id ,Model model, HttpServletRequest request){
			Users user = (Users)request.getSession().getAttribute("user");
			if(user != null){
				int a = fruitservice.addRemeber(id,user.getUsers_id());
			}
			model.addAttribute("monthsell",fruitservice.getMonthSell(Integer.parseInt(id)));
			model.addAttribute("fruit",fruitservice.getById(Integer.parseInt(id)) );
			return "frontJsp/products";
		}
		
		
		@ResponseBody
		@RequestMapping(value="/slideshow", produces="text/html;charset=UTF-8")
		private List<Map<String ,Object>> slideshow(HttpServletRequest request){
			Users user = (Users) request.getSession().getAttribute("user");
			 List<Map<String ,Object>> map = fruitservice.getFruitImfo(user);
			
			return map;
		}
		
		//水果类型知识介绍
		@RequestMapping(value="/fruitstypeimfomations") 
		public String fruitstypeimfomation(@RequestParam("type")  String type ,Model model){
			FruitImfo  fruitImfo = fruitservice.getByType(Integer.parseInt(type));
			model.addAttribute("fruitinfomation", fruitImfo);
			System.out.println(fruitImfo.getAddman()+"..................."+fruitImfo.getInformation());
			return "frontJsp/fruitstypeimfomation";
		}
		

		@ResponseBody
		@RequestMapping(value="/fruitstypeimfomation",produces="text/html;charset=UTF-8" ) 
		public FruitImfo fruitstypeimfo(@RequestParam("type")  String type ,Model model){
			FruitImfo imfo =  fruitservice.getByType(Integer.parseInt(type));
			if(imfo == null){
				FruitImfo imfo1 = new 	FruitImfo();
				imfo1.setId(0);
				return imfo1;
			}
			return imfo;
		}
		
		//推荐
		@ResponseBody
		@RequestMapping(value="/recommendToIndex",produces="text/html;charset=UTF-8" ) 
		public List<Map<String ,Object>> recommendToIndex(@RequestParam(value="page",required= false)  String page ,Model model,HttpServletRequest request){
			List<Map<String ,Object>> list = fruitservice.recommendToIndex(Integer.parseInt(page),request);
			Map<String ,Object> map  =new   HashMap<> ();
			map.put("page", Integer.parseInt(page));
			list.add(map);
			return list;
		}
		
		//修改商品信息
		@RequestMapping(value="/updatefruitByidsssssss",produces="text/html;charset=UTF-8" ) 
		public String updatefruitByid( String fruit_name ,String fruit_id, String fruit_time,
				String fruit_date ,String fruit_place ,String fruit_amount,
				String fruit_sellprice, String fruit_price,String fruit_info,
				Model model,HttpServletRequest request){
			Fruits fruit = new Fruits();
			fruit.setFruit_amount(Integer.parseInt(fruit_amount));
			fruit.setFruit_date(Integer.parseInt(fruit_date));
			fruit.setFruit_id(Integer.parseInt(fruit_id));
			fruit.setFruit_info(fruit_info);
			fruit.setFruit_name(fruit_name);
			fruit.setFruit_place(fruit_place);
			fruit.setFruit_price(Float.parseFloat(fruit_price));
			fruit.setFruit_sellprice(Float.parseFloat(fruit_sellprice));
			fruit.setFruit_time(fruit_time);
			
			
			int a = fruitservice.updatefruitByid(fruit);
			Map<String ,Object> map  =new   HashMap<> ();
			map.put("meg", "ok");
			 return "redirect:product?id="+fruit_id;
			
		}
		
		//置顶	
		@ResponseBody
		@RequestMapping(value="/SetFruitTop",produces="text/html;charset=UTF-8" ) 
		public Map<String ,Object> SetFruitTop(@RequestParam(value="fruit_id",required= false)  String fruit_id ,Model model,HttpServletRequest request){
			Map<String ,Object> map  =new   HashMap<> ();
			int a = fruitservice.updatefruitByid(DateUtil.getTimeStamp(),fruit_id);
			map.put("meg", "ok");
			return map;
		}
		
		
}
