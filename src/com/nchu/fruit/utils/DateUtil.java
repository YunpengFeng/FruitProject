package com.nchu.fruit.utils;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	
	/*public static  void main(String[] args){
		System.out.println("当前时间戳"+getTimeStamp());
		
	}*/
	
	

	public static String gettime(){
		Date date =new Date();
		SimpleDateFormat format =new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(date);
	}
	public static String getTimeStamp() {
		 return String.valueOf(System.currentTimeMillis());
		}
	
	public static String getTime(){
		Date date =new Date();
		SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	
	
	 //ǰһ��
	public static String yesTime(Date currentTime){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		long mills=currentTime.getTime()-1000*60*60*24;
		Date result = new Date(mills);
		String yesterdayTime=format.format(result);
		return yesterdayTime;
	}
	 //��һ��
		public static String afterTime(Date currentTime){
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			long mills=currentTime.getTime()+1000*60*60*24;
			Date result = new Date(mills);
			String yesterdayTime=format.format(result);
			return yesterdayTime;
		}
	/**
	   * ����ʱ���ʽ�ַ���ת��Ϊʱ�� yyyy-MM-dd HH:mm:ss
	   * 
	   * @param strDate
	   * @return
	   */
	public static Date strToDateLong(String strDate) {
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   ParsePosition pos = new ParsePosition(0);
	   Date strtodate = formatter.parse(strDate, pos);
	   return strtodate;
	}
	
}
