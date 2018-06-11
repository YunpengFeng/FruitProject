package com.nchu.fruit.utils;

import java.util.Collection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ToGridJson{
	
	
	public JSONObject toGridJson(int totalCount, Object obj) {  
        // 如果数据集对象为null做个特殊处理  
        if(null == obj) {  
            JSONObject jsonResult = new JSONObject();  
            jsonResult.put("total", totalCount);  
            jsonResult.put("rows", new JSONArray());  
            return jsonResult;  
        }  
  
        if(!Collection.class.isAssignableFrom(obj.getClass())) {  
            JSONObject jsonResult = new JSONObject();  
            jsonResult.put("total", totalCount);  
            jsonResult.put("rows", new JSONArray());  
            return jsonResult;  
        }  
  
        JSONArray jsonArray = JSONArray.fromObject(obj);  
        JSONObject jsonResult = new JSONObject();  
        jsonResult.put("total", totalCount);  
        jsonResult.put("rows", jsonArray);  
        return jsonResult;  
    }  
}
