package com.nchu.fruit.pojo;

public class Recodement {
	private Integer id;
	private String userid;
	private String  fruitid;
	private Integer looknum;
	
	public Recodement() {}
	
	@Override
	public String toString() {
		return "recodement [id=" + id + ", userid=" + userid + ", fruitid=" + fruitid + ", looknum=" + looknum + "]";
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFruitid() {
		return fruitid;
	}
	public void setFruitid(String fruitid) {
		this.fruitid = fruitid;
	}
	public Integer getLooknum() {
		return looknum;
	}
	public void setLooknum(Integer looknum) {
		this.looknum = looknum;
	}
	

}
