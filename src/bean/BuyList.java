package bean;

import java.util.Date;

public class BuyList {
	String orderID;
	int shopID;
	
	int num;
	Double price;
	String userName;
	Date orderTime;
	String realname;
	String shopname;
	String tupian;
	
	String userAddress;
	String orderTel;
	String postCode;
	
	String detail;
	
	
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public String getTupian() {
		return tupian;
	}
	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getShopID() {
		return shopID;
	}
	public void setShopID(int shopID) {
		this.shopID = shopID;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getOrderTel() {
		return orderTel;
	}
	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	@Override
	public String toString() {
		return "BuyList [orderID=" + orderID + ", shopID=" + shopID + ", num=" + num + ", price=" + price
				+ ", userName=" + userName + ", orderTime=" + orderTime + ", realname=" + realname + ", shopname="
				+ shopname + ", tupian=" + tupian + ", userAddress=" + userAddress + ", orderTel=" + orderTel
				+ ", postCode=" + postCode + ", detail=" + detail + "]";
	}
	
	

}
