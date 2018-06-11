package com.nchu.fruit.pojo;

public class Admins {
    private String admin_id;

    private String admin_name;

    private String admin_pass;

    private Integer admin_role;

    private Integer admin_register;
    
    private String admin_list;

    public String getAdmin_id() {
        return admin_id;
    }
    
    
    public String getAdmin_list() {
		return admin_list;
	}


	public void setAdmin_list(String admin_list) {
		this.admin_list = admin_list;
	}


	public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_pass() {
        return admin_pass;
    }

    public void setAdmin_pass(String admin_pass) {
        this.admin_pass = admin_pass;
    }

    public Integer getAdmin_role() {
        return admin_role;
    }

    public void setAdmin_role(Integer admin_role) {
        this.admin_role = admin_role;
    }

    public Integer getAdmin_register() {
        return admin_register;
    }

    public void setAdmin_register(Integer admin_register) {
        this.admin_register = admin_register;
    }
}