package com.nchu.fruit.pojo;

public class FruitImfo {
	private Integer id ;
	private String num;
	private String type;
	private String information;
	private Integer isshow;
	private  String  season;
	private String addman ;
	
	public String getAddman() {
		return addman;
	}

	public void setAddman(String addman) {
		this.addman = addman;
	}

	@Override
	public String toString() {
		return "fruitImfo [id=" + id + ", num=" + num + ", type=" + type + ", information=" + information + ", isshow="
				+ isshow + ", season=" + season + "]";
	}

	public FruitImfo() {}

	public FruitImfo(Integer id, String num, String type, String information, Integer isshow, String season) {
		super();
		this.id = id;
		this.num = num;
		this.type = type;
		this.information = information;
		this.isshow = isshow;
		this.season = season;
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public Integer getIsshow() {
		return isshow;
	}
	public void setIsshow(Integer isshow) {
		this.isshow = isshow;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	

}
