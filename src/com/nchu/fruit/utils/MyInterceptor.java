package com.nchu.fruit.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyInterceptor extends HandlerInterceptorAdapter {
	private List<String> whitePath;
	
	
	//拦截器拦截前处理
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取当前url
		String path = request.getServletPath();
		if(this.whitePath.contains(path)){
			//查看session是否存在值
			HttpSession session =request.getSession(false); 
			if(session == null){
				 request.getRequestDispatcher("toLogin").forward(request, response);
				 System.err.println("还未登录....." + request.getRemoteAddr() + "...." + path);
                 response.setStatus(401);
                 response.setHeader("message", "out of login");
                 return false;
			}
			//查看session中是否有用户信息
			Object  loginUserInfo = session.getAttribute("user");
					if(loginUserInfo == null) {
						 System.err.println("还未登录....." + request.getRemoteAddr() + "...." + path);
						 request.getRequestDispatcher("toLogin").forward(request, response);
                        response.setStatus(401);
                        response.setHeader("message", "out of login");
                        return false;
                    }
		}
		return true;
	}
	
	//拦截器拦截后处理
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
				
		}

	public List<String> getWhitePath() {
		return whitePath;
	}

	public void setWhitePath(List<String> whitePath) {
		this.whitePath = whitePath;
	}

	
}
