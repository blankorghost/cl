package reply;

import java.sql.Date;

public class userreplyEntity {
	int r_id;
	int r_userid;
	String r_username;
	int r_shopid;
	String r_content;
	Date r_time;
	
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getR_userid() {
		return r_userid;
	}
	public void setR_userid(int r_userid) {
		this.r_userid = r_userid;
	}
	public String getR_username() {
		return r_username;
	}
	public void setR_username(String r_username) {
		this.r_username = r_username;
	}
	public int getR_shopid() {
		return r_shopid;
	}
	public void setR_shopid(int r_shopid) {
		this.r_shopid = r_shopid;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_time() {
		return r_time;
	}
	public void setR_time(Date r_time) {
		this.r_time = r_time;
	}
	
	
}
