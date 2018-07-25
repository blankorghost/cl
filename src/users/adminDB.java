package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;

public class adminDB {
private Connection con=null;
	
	public int checkUserExist(String name){
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
		String sql="select count(1) from t_admin where name=?";
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			if(rs.next()){
				flag=rs.getInt(1);
			}
			return flag;
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return flag;
	}
	
	public adminEntity getAdminInfo(String name){
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from t_admin where name=?";
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			adminEntity ae=new adminEntity();
			while(rs.next()){
				ae.setId(rs.getInt(1));
				ae.setName(rs.getString(2));
				ae.setPassword(rs.getString(3));
			}	
			return ae;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return null;
	}
	
	public int checkUserLogin(String name,String password){
		int flag=0;
		adminEntity ae=getAdminInfo(name);
		if(name.equals(ae.getName())&&password.equals(ae.getPassword())){
			flag=1;
		}
		
		return flag;
	}
}
