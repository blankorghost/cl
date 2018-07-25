package reply;

import java.sql.Date;

public class adminreplyEntity {
	int ar_id;
	int ar_adminid;
	String ar_adminname;
	int ar_rid;
	String ar_content;
	Date ar_time;
	
	public int getAr_id() {
		return ar_id;
	}
	public void setAr_id(int ar_id) {
		this.ar_id = ar_id;
	}
	public int getAr_adminid() {
		return ar_adminid;
	}
	public void setAr_adminid(int ar_adminid) {
		this.ar_adminid = ar_adminid;
	}
	public String getAr_adminname() {
		return ar_adminname;
	}
	public void setAr_adminname(String ar_adminname) {
		this.ar_adminname = ar_adminname;
	}
	public int getAr_rid() {
		return ar_rid;
	}
	public void setAr_rid(int ar_rid) {
		this.ar_rid = ar_rid;
	}
	public String getAr_content() {
		return ar_content;
	}
	public void setAr_content(String ar_content) {
		this.ar_content = ar_content;
	}
	public Date getAr_time() {
		return ar_time;
	}
	public void setAr_time(Date ar_time) {
		this.ar_time = ar_time;
	}
	
	
}
