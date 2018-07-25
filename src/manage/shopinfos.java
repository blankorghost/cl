package manage;

import java.sql.Date;

/*
 * 商品信息
 */
public class shopinfos {
	int si_id;
	String si_name;
	int si_typeid;
	String si_typename;
	Date si_time;
	String si_photo;
	String si_bigphoto;
	double si_price;
	int si_allnum;
	int si_salenum;
	String si_content;
	String si_remark;
	Double si_count;
	
	public shopinfos(){
		
	}
	public int getSi_id() {
		return si_id;
	}
	public void setSi_id(int si_id) {
		this.si_id = si_id;
	}
	public String getSi_name() {
		return si_name;
	}
	public void setSi_name(String si_name) {
		this.si_name = si_name;
	}
	public int getSi_typeid() {
		return si_typeid;
	}
	public void setSi_typeid(int si_typeid) {
		this.si_typeid = si_typeid;
	}
	public String getSi_typename() {
		return si_typename;
	}
	public void setSi_typename(String si_typename) {
		this.si_typename = si_typename;
	}
	public Date getSi_time() {
		return si_time;
	}
	public void setSi_time(Date si_time) {
		this.si_time = si_time;
	}
	public String getSi_photo() {
		return si_photo;
	}
	public void setSi_photo(String si_photo) {
		this.si_photo = si_photo;
	}
	public String getSi_bigphoto() {
		return si_bigphoto;
	}
	public void setSi_bigphoto(String si_bigphoto) {
		this.si_bigphoto = si_bigphoto;
	}
	public double getSi_price() {
		return si_price;
	}
	public void setSi_price(double si_price) {
		this.si_price = si_price;
	}
	public int getSi_allnum() {
		return si_allnum;
	}
	public void setSi_allnum(int si_allnum) {
		this.si_allnum = si_allnum;
	}
	public int getSi_salenum() {
		return si_salenum;
	}
	public void setSi_salenum(int si_salenum) {
		this.si_salenum = si_salenum;
	}
	public String getSi_content() {
		return si_content;
	}
	public void setSi_content(String si_content) {
		this.si_content = si_content;
	}
	public String getSi_remark() {
		return si_remark;
	}
	public void setSi_remark(String si_remark) {
		this.si_remark = si_remark;
	}
	public Double getSi_count() {
		return si_count;
	}
	public void setSi_count(Double si_count) {
		this.si_count = si_count;
	}
}
