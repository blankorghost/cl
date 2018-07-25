package users;

import java.sql.Date;

public class userEntity {
	int u_id;
	String u_name;
	String u_password;
	Date u_registertime;
	Date u_lasttime;
	
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
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public Date getU_registertime() {
		return u_registertime;
	}
	public void setU_registertime(Date u_registertime) {
		this.u_registertime = u_registertime;
	}
	public Date getU_lasttime() {
		return u_lasttime;
	}
	public void setU_lasttime(Date u_lasttime) {
		this.u_lasttime = u_lasttime;
	}
	
	
}
