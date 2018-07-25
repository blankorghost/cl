package announcement;

import java.sql.Date;

public class announceEntity {
	private int a_id;
	private String a_title;
	private String a_content;
	private Date a_time;
	private int a_settop;
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	/**
	 * @return the a_title
	 */
	public String getA_title() {
		return a_title;
	}
	/**
	 * @param a_title the a_title to set
	 */
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	/**
	 * @return the a_content
	 */
	public String getA_content() {
		return a_content;
	}
	/**
	 * @param a_content the a_content to set
	 */
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	/**
	 * @return the a_time
	 */
	public Date getA_time() {
		return a_time;
	}
	/**
	 * @param date the a_time to set
	 */
	public void setA_time(Date date) {
		this.a_time = date;
	}
	public int getA_settop() {
		return a_settop;
	}
	public void setA_settop(int a_settop) {
		this.a_settop = a_settop;
	}
	
}
