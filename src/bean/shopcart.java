package bean;

import java.sql.Date;

public class shopcart {
	int c_id;
	int c_shopid;
	int c_userid;
	int c_num;
	Date c_time;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getC_shopid() {
		return c_shopid;
	}
	public void setC_shopid(int c_shopid) {
		this.c_shopid = c_shopid;
	}
	public int getC_userid() {
		return c_userid;
	}
	public void setC_userid(int c_userid) {
		this.c_userid = c_userid;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
}
