package com.nchu.fruit.pojo;

public class Comment {

	
	private String users_id;

	private String item_id;

	private String content;

	private String c_date;

	private Integer c_rank;

	private Integer c_states;

	private String c_images;

	private Integer c_imgcounts;

	private Integer p_states;//审核通过状态
	
	public Integer getP_states() {
		return p_states;
	}

	public void setP_states(Integer p_states) {
		this.p_states = p_states;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public Integer getC_rank() {
		return c_rank;
	}

	public void setC_rank(Integer c_rank) {
		this.c_rank = c_rank;
	}

	public Integer getC_states() {
		return c_states;
	}

	public void setC_states(Integer c_states) {
		this.c_states = c_states;
	}

	public String getC_images() {
		return c_images;
	}

	public void setC_images(String c_images) {
		this.c_images = c_images;
	}

	public Integer getC_imgcounts() {
		return c_imgcounts;
	}

	public void setC_imgcounts(Integer c_imgcounts) {
		this.c_imgcounts = c_imgcounts;
	}
}