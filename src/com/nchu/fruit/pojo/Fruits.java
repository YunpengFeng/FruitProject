package com.nchu.fruit.pojo;

public class Fruits {
	private Integer fruit_id;

	private String fruit_name;

	private Float fruit_sellprice;

	private Float fruit_price;

	private String fruit_images;

	private Integer fruit_imgcount;

	private Integer fruit_amount;

	private String fruit_place; //产地

	private Integer fruit_states;

	private String fruit_info;

	private Integer fruit_date;

	private String fruit_time;
	//置顶 使用时间戳
	private String istop;
	
	//进价
	private Float fruit_enterprice;
	
	//水果类型
	private String fruit_type;
	
	//添加信息的人
	private String addman;
	
	
	public String getAddman() {
		return addman;
	}

	public void setAddman(String addman) {
		this.addman = addman;
	}

	public Float getFruit_enterprice() {
		return fruit_enterprice;
	}

	public void setFruit_enterprice(Float fruit_enterprice) {
		this.fruit_enterprice = fruit_enterprice;
	}

	public String getFruit_type() {
		return fruit_type;
	}

	public void setFruit_type(String fruit_type) {
		this.fruit_type = fruit_type;
	}

	public String getIstop() {
		return istop;
	}

	public void setIstop(String istop) {
		this.istop = istop;
	}

	public String getFruit_place() {
		return fruit_place;
	}

	public void setFruit_place(String fruit_place) {
		this.fruit_place = fruit_place;
	}	
	
	public Integer getFruit_id() {
		return fruit_id;
	}

	public void setFruit_id(Integer fruit_id) {
		this.fruit_id = fruit_id;
	}

	public String getFruit_name() {
		return fruit_name;
	}

	public void setFruit_name(String fruit_name) {
		this.fruit_name = fruit_name;
	}

	public Float getFruit_sellprice() {
		return fruit_sellprice;
	}

	public void setFruit_sellprice(Float fruit_sellprice) {
		this.fruit_sellprice = fruit_sellprice;
	}

	public Float getFruit_price() {
		return fruit_price;
	}

	public void setFruit_price(Float fruit_price) {
		this.fruit_price = fruit_price;
	}

	public String getFruit_images() {
		return fruit_images;
	}

	public void setFruit_images(String fruit_images) {
		this.fruit_images = fruit_images;
	}

	public Integer getFruit_imgcount() {
		return fruit_imgcount;
	}

	public void setFruit_imgcount(Integer fruit_imgcount) {
		this.fruit_imgcount = fruit_imgcount;
	}

	public Integer getFruit_amount() {
		return fruit_amount;
	}

	public void setFruit_amount(Integer fruit_amount) {
		this.fruit_amount = fruit_amount;
	}

	public Integer getFruit_states() {
		return fruit_states;
	}

	public void setFruit_states(Integer fruit_states) {
		this.fruit_states = fruit_states;
	}

	public String getFruit_info() {
		return fruit_info;
	}

	public void setFruit_info(String fruit_info) {
		this.fruit_info = fruit_info;
	}

	public Integer getFruit_date() {
		return fruit_date;
	}

	public void setFruit_date(Integer fruit_date) {
		this.fruit_date = fruit_date;
	}

	public String getFruit_time() {
		return fruit_time;
	}

	public void setFruit_time(String fruit_time) {
		this.fruit_time = fruit_time;
	}

	@Override
	public String toString() {
		return "Fruits [fruit_id=" + fruit_id + ", fruit_name=" + fruit_name + ", fruit_sellprice=" + fruit_sellprice
				+ ", fruit_price=" + fruit_price + ", fruit_images=" + fruit_images + ", fruit_imgcount="
				+ fruit_imgcount + ", fruit_amount=" + fruit_amount + ", fruit_place=" + fruit_place + ", fruit_states="
				+ fruit_states + ", fruit_info=" + fruit_info + ", fruit_date=" + fruit_date + ", fruit_time="
				+ fruit_time + ", istop=" + istop + ", fruit_enterprice=" + fruit_enterprice + ", fruit_type="
				+ fruit_type + "]";
	}
	
}