package com.nchu.fruit.pojo;


/**
 *   @author James feng
 *   @date 2017年12月17日 下午3:15:04 
 *
 *   @version V1.0  
 *   @Description: ******注意cars对应的数据的表中的fruit__id字段的下划线有俩根，实体类中的fruit_id只有一根
 */
public class Cars  {
    private Integer amount;
    private String users_id;
    private int fruit_id;
    
    public String getusers_id() {
		return users_id;
	}

	public void setusers_id(String users_id) {
		this.users_id = users_id;
	}

	public int getFruit_id() {
		return fruit_id;
	}

	public void setFruit_id(int fruit_id) {
		this.fruit_id = fruit_id;
	}

	public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }
}