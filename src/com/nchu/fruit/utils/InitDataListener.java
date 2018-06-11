package com.nchu.fruit.utils;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.nchu.fruit.service.FruitService;

	@Service
public class InitDataListener implements InitializingBean, ServletContextAware {

	@Autowired
	private FruitService fruitservice;
	
	/*
	 * 将水果的种类type进行缓存
	 */
	@Override
	public void setServletContext(ServletContext request) {
		// TODO Auto-generated method stub
		
		List<String> list=fruitservice.getType();
		 request.setAttribute("fruitType" ,list);
		 System.out.println("开启水果种类缓存到服务器中！");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub

	}

}
