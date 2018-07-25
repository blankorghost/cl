package bean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.daleyzou.entity.UserInfo;

import bean.*;
import users.userEntity;


public class shopcarDB {
	private Connection con = null;
	/* ��ȡ���ж�����Ϣ */
//    public ArrayList<BuyList> getAllShops() {
//        ResultSet rs=null;
//        Statement sql=null;
//        ArrayList<BuyList> orderList=new ArrayList<BuyList>();
//        try {
//        	con=DBConnection.getConnection();
//            sql=con.createStatement();
//	    	rs=sql.executeQuery("SELECT * from t_order");
//	    	while(rs.next()){
//	    		BuyList order=new BuyList();
//	    		order.setOrderID(rs.getString("o_id"));
//	    		order.setNum(rs.getInt("o_nums"));
//	    		order.setPrice(rs.getFloat("o_shopprice"));
//	    		//order.setUserName(rs.getString("o_"));
//	    		order.setRealname(rs.getString("o_name"));
//	    		order.setShopname(rs.getString("o_shopname"));
//	    		order.setUserAddress(rs.getString("o_adress"));
//	    		order.setOrderTel(rs.getString("o_phone"));
//	    		order.setPostCode(rs.getString("o_youbian"));
//	    		order.setDetail(rs.getString("o_memo"));
//	    		orderList.add(order);	    		
//	    	}  
//			rs.close();
//			sql.close();
//
//        } catch (Exception e) {
//           	e.printStackTrace();
//            System.out.println("��ȡ���ж�����Ϣʧ�ܣ�");
//        } finally{
//        	DBConnection.closeConnection();
//		}		
//        return orderList;
//    }
	//���붩����Ϣ
	public int insertShop(BuyList info, HttpServletRequest request) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	Date date = new Date(System.currentTimeMillis());
        	HttpSession session = request.getSession(false);
        	userEntity user = (userEntity)session.getAttribute("user");
        	int u_id = user.getU_id();
        	int o_shopid = (int)session.getAttribute("shop_id");
        	double o_shopprice = (double)session.getAttribute("shop_price");
        	
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("insert into t_order (o_name,o_adress,o_phone,o_youbian,o_memo,o_time,o_userid,o_shopid,o_shopprice) values (?,?,?,?,?,?,?,?,?)");
    		//pStmt.setString(3,info.getNum());
    		//pStmt.setString(4,info.getShopname());
    		//pStmt.setFloat(5,info.getPrice());
    		System.out.println();
    		
    		  System.out.println("getRealname"+info.getRealname());
    		System.out.println("getUserAddress"+info.getUserAddress());	
    		System.out.println("getOrderTel"+info.getOrderTel());
    		System.out.println("getOrderTel"+info.getOrderTel());
    		System.out.println("getPostCode"+info.getPostCode());	
    		System.out.println("getDetail"+info.getDetail());
    		System.out.println("date"+date);	
    		System.out.println("u_id"+u_id);
    		System.out.println("o_shopid"+o_shopid);
    		System.out.println("o_shopprice"+o_shopprice);
    	
    		pStmt.setString(1,info.getRealname());
    		pStmt.setString(2,info.getUserAddress());	
    		pStmt.setString(3,info.getOrderTel());
    		//System.out.println(info.getOrderTel());
    		pStmt.setString(4,info.getPostCode());	
    		pStmt.setString(5,info.getDetail());
    		pStmt.setDate(6,date);	
    		pStmt.setInt(7,u_id);
    		pStmt.setInt(8,o_shopid);
    		pStmt.setDouble(9,o_shopprice);
    		count=pStmt.executeUpdate();  
			pStmt.close();
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("���붩����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
	//���빺�ﳵ��Ϣ
		public int insertShopCar(HttpServletRequest request) {
	    	PreparedStatement pStmt=null; 
	    	int count=0;
	        try {
	        	Date date = new Date(System.currentTimeMillis());
	        	HttpSession session = request.getSession(false);
	        	userEntity user = (userEntity)session.getAttribute("user");
	        	int u_id = user.getU_id();
	        	getShopinfoById(u_id);
	        	int o_shopid = (int)session.getAttribute("shop_id");
	        	double o_shopprice = (double)session.getAttribute("shop_price");
	        	con=DBConnection.getConnection();
	    		pStmt = con.prepareStatement("insert into t_shopcart(c_shopid,c_userid,c_time) values (?,?,?)");
	    		pStmt.setInt(1,o_shopid);
	    		pStmt.setInt(2,u_id);
	    		pStmt.setDate(3,date);	
	    		count=pStmt.executeUpdate();  
				pStmt.close();
	        } catch (Exception e) {
	           	e.printStackTrace();
	            System.out.println("���빺�ﳵ��Ϣʧ�ܣ�");
	        } finally{
	        	DBConnection.closeConnection();
			}		
	        return count;
	    }
	//ɾ�����ﳵ
	public int deleteShopcar(int id) {
     	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("delete from  t_shopcart   where u_userid=?");
    		pStmt.setInt(1,id);		
    		count=pStmt.executeUpdate();
    		pStmt.close();    		
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("ɾ�����ﳵ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
	/* ��ȡָ���û���Ϣ */
    public BuyList getShopinfoById(int id) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	BuyList shopinfo=null;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_shopcart where c_id=?");
    		pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
	    	if(rs.next()){
	    		shopinfo=new BuyList();
	    		shopinfo.setOrderID(rs.getString("o_id"));
	    		shopinfo.setUserName(rs.getString("VC_STUDENT_CODE"));
	    		//shopinfo.setOrderTime(rs.getString("VC_STUDENT_NAME"));
	    		//shopinfo.setSex(rs.getInt("N_SEX"));
	    		//shopinfo.setGrade(rs.getInt("N_GRADE"));
	    		//shopinfo.setMajor(rs.getInt("N_MAJOR"));
	    		//shopinfo.setDetail(rs.getString("VC_DETAIL"));
	    	} 
			rs.close();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return shopinfo;
    }
    
    public ArrayList<shopcart> getShopCarByUserId(int userid) {
        ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	BuyList shopinfo=null;
    	ArrayList<shopcart> list=new ArrayList<shopcart>();
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("SELECT * FROM t_shopcart where c_userid=?");
    		pStmt.setInt(1,userid);		
    		rs = pStmt.executeQuery();
    		
	    	if(rs.next()){
	    		shopcart shopcar=new shopcart();
	    		shopcar.setC_id(rs.getInt(1));
	    		shopcar.setC_shopid(rs.getInt(2));
	    		shopcar.setC_userid(rs.getInt(3));
	    		shopcar.setC_num(rs.getInt(4));
	    		shopcar.setC_time(rs.getDate(5));
	    		//shopinfo.setOrderTime(rs.getString("VC_STUDENT_NAME"));
	    		//shopinfo.setSex(rs.getInt("N_SEX"));
	    		//shopinfo.setGrade(rs.getInt("N_GRADE"));
	    		//shopinfo.setMajor(rs.getInt("N_MAJOR"));
	    		//shopinfo.setDetail(rs.getString("VC_DETAIL"));
	    		
	    		list.add(shopcar);
	    	} 
	    	return list;

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("��ȡָ����Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}		
        return list;
    }
    /*//ͨ����Ʒid�õ�ͼƬ·��
    public String getshoptupianbyID(int id){
    	ResultSet rs=null;
    	PreparedStatement pStmt=null; 
    	BuyList tupian=null;
        try {
        	con=DBConnection.getConnection();
        	pStmt = con.prepareStatement("SELECT * FROM t_order where o_shopid=?");
        	pStmt.setInt(1,id);		
    		rs = pStmt.executeQuery();
    		if(rs.next()){
	    		tupian=new BuyList();
	    		
    		}
        }catch(Exception e){
        	e.printStackTrace();
        	System.out.println("��ȡͼƬ��Ϣʧ�ܣ�");
        } finally{
        	DBConnection.closeConnection();
		}	
       return tupian;
    }*/ 
}
