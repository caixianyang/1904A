package com.fh.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BaseAction {
	
	
	public void outJson(Object object){
		String jsonString = JSON.toJSONString(object);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		ServletWebRequest servletWebRequest = new ServletWebRequest(request);
		HttpServletResponse response = servletWebRequest.getResponse();
		response.setCharacterEncoding("utf-8");
		// 获取getWrite();
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if (writer != null) {
				writer.close();
			}
		}
	}
	
	
	
	public void outStr(String str){
		//获取reponse
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		ServletWebRequest servletWebRequest = new ServletWebRequest(request);
		HttpServletResponse response = servletWebRequest.getResponse();
				//设置字符集编码
				response.setCharacterEncoding("UTF-8");
				//设置响应内容格式
				response.setContentType("application/json");
				PrintWriter writer = null;
				try {
					 writer = response.getWriter();
					 writer.write(str);
					 //刷新
					 writer.flush();	
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					if(writer != null){
						writer.close();
						writer = null;
					}
					
				}
	}
	protected  String getIpAddress() {  
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String ip = request.getHeader("x-forwarded-for");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }
	public void writeCookie(String key, String value, int expire){
		try {
			String newValue = URLEncoder.encode(value, "UTF-8");
			Cookie cookie= new Cookie(key,newValue);
			//设置过期时间
			cookie.setMaxAge(expire);
			//设置路径
			cookie.setPath("/");
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			ServletWebRequest servletWebRequest = new ServletWebRequest(request);
			HttpServletResponse response = servletWebRequest.getResponse();
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void cleanCookie(String key){
			Cookie cookie= new Cookie(key,"");
			//设置过期时间
			cookie.setMaxAge(0);
			//设置路径
			cookie.setPath("/");
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			ServletWebRequest servletWebRequest = new ServletWebRequest(request);
			HttpServletResponse response = servletWebRequest.getResponse();
			response.addCookie(cookie);
		
	}
}
