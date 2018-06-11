package com.nchu.fruit.pojo;

public class Items {
    private Integer item_id;

    private String orders_id;

    private Integer fruit_id;
    
    private Float  fruit_price;
    
	private String  fruit_name;

    private Integer amount;

    private Float count;
    
    private Integer  com_states;
    

    public Integer getCom_states() {
		return com_states;
	}

	public void setCom_states(Integer com_states) {
		this.com_states = com_states;
	}

	public Float getFruit_price() {
 		return fruit_price;
 	}

 	public void setFruit_price(Float fruit_price) {
 		this.fruit_price = fruit_price;
 	}

 	public String getFruit_name() {
 		return fruit_name;
 	}

 	public void setFruit_name(String fruit_name) {
 		this.fruit_name = fruit_name;
 	}

    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }

    public String getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(String orders_id) {
        this.orders_id = orders_id;
    }

    public Integer getFruit_id() {
        return fruit_id;
    }

    public void setFruit_id(Integer fruit_id) {
        this.fruit_id = fruit_id;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Float getCount() {
        return count;
    }

    public void setCount(Float count) {
        this.count = count;
    }
}