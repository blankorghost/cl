package com.daleyzou.entity;


/**
 * 1.用户信息实体类设计
 * @author 11543
 *
 */
public class UserInfo {
	private int u_id;			//用户id
	private String u_name;		//用户名
	private String ui_email;	//用户email
	private String ui_address;	//用户收货地址
	private String ui_phone;	//用户电话号码
	private String u_password;  //用户密码
	
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getUi_email() {
		return ui_email;
	}
	public void setUi_email(String ui_email) {
		this.ui_email = ui_email;
	}
	public String getUi_address() {
		return ui_address;
	}
	public void setUi_address(String ui_address) {
		this.ui_address = ui_address;
	}
	public String getUi_phone() {
		return ui_phone;
	}
	public void setUi_phone(String ui_phone) {
		this.ui_phone = ui_phone;
	}
	
	
	
	
}
