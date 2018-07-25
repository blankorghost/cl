package com.daleyzou.entity;

import java.util.Date;

/**
 * 1.订单实体类设计
 * @author 11543
 *
 */

public class Order {
	private int o_id;				//订单编号
	private String u_name;			//下单的用户名
	private int o_shopid;			//商品id，然后在根据商品id查询商品的名称和图片路径
	private double o_shopprice;		//价格
	private int o_nums;				//商品数量
	private Date o_time;			//下单时间
	private String o_name;			//收货人姓名
	private String o_adress;		//收货地址
	private String o_phone;			//联系电话
	private int o_youbian;			//邮编
	private String o_memo;			//备注
	private int o_status;			//订单状态
	private String si_name;			//商品名称
	private String si_photo;		//商品图片
	
	
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getO_shopid() {
		return o_shopid;
	}
	public void setO_shopid(int o_shopid) {
		this.o_shopid = o_shopid;
	}
	public double getO_shopprice() {
		return o_shopprice;
	}
	public void setO_shopprice(double o_shopprice) {
		this.o_shopprice = o_shopprice;
	}
	public int getO_nums() {
		return o_nums;
	}
	public void setO_nums(int o_nums) {
		this.o_nums = o_nums;
	}
	public Date getO_time() {
		return o_time;
	}
	public void setO_time(Date o_time) {
		this.o_time = o_time;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_adress() {
		return o_adress;
	}
	public void setO_adress(String o_adress) {
		this.o_adress = o_adress;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public int getO_youbian() {
		return o_youbian;
	}
	public void setO_youbian(int o_youbian) {
		this.o_youbian = o_youbian;
	}
	public String getO_memo() {
		return o_memo;
	}
	public void setO_memo(String o_memo) {
		this.o_memo = o_memo;
	}
	public int getO_status() {
		return o_status;
	}
	public void setO_status(int o_status) {
		this.o_status = o_status;
	}
	public String getSi_name() {
		return si_name;
	}
	public void setSi_name(String si_name) {
		this.si_name = si_name;
	}
	public String getSi_photo() {
		return si_photo;
	}
	public void setSi_photo(String si_photo) {
		this.si_photo = si_photo;
	}
	
	
	
	
	
}
