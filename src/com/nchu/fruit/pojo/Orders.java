package com.nchu.fruit.pojo;

public class Orders {
    private String orders_id;

    private String users_id;

    private String order_time;

    private String phone;

    private String address;

    private String man;

    private Integer out_states;

    private String express;
    
    private Integer get_states;

    private Integer pay_states;
    
    private String tempinfo;
    
    private Float total;
    
   private int callnumber; //催单次数
   
   private int cancal_order; //取消订单 0为 不取消 1 为取消
   
   private int check_cancal_order;//管理员 审核状态 1 通过  0 不通过
    
   
    public int getCancal_order() {
	return cancal_order;
}

public void setCancal_order(int cancal_order) {
	this.cancal_order = cancal_order;
}

public int getCheck_cancal_order() {
	return check_cancal_order;
}

public void setCheck_cancal_order(int check_cancal_order) {
	this.check_cancal_order = check_cancal_order;
}

	public int getCallnumber() {
	return callnumber;
    }

public void setCallnumber(int callnumber) {
	this.callnumber = callnumber;
}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	public void setTempinfo(String tempinfo) {
		this.tempinfo = tempinfo;
	}

	public String getTempinfo() {
		return tempinfo;
	}

    public String getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(String orders_id) {
        this.orders_id = orders_id;
    }

    public String getUsers_id() {
        return users_id;
    }

    public void setUsers_id(String users_id) {
        this.users_id = users_id;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMan() {
        return man;
    }

    public void setMan(String man) {
        this.man = man;
    }

    public Integer getOut_states() {
        return out_states;
    }

    public void setOut_states(Integer out_states) {
        this.out_states = out_states;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public Integer getPay_states() {
        return pay_states;
    }

    public void setPay_states(Integer pay_states) {
        this.pay_states = pay_states;
    }

	public Integer getGet_states() {
		return get_states;
	}

	public void setGet_states(Integer get_states) {
		this.get_states = get_states;
	}
}