package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import common.DBConnection;

public class usersDB {
	private Connection con=null;
	
	public int checkUserExist(String username){
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
		String sql="select count(1) from t_users where u_name=?";
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
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
	
	public userEntity getUserInfo(String username){
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from t_users where u_name=?";
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			userEntity ue=new userEntity();
			while(rs.next()){
				ue.setU_id(rs.getInt(1));
				ue.setU_name(rs.getString(2));
				ue.setU_password(rs.getString(3));
				ue.setU_registertime(rs.getDate(4));
				ue.setU_lasttime(rs.getDate(5));
			}	
			return ue;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return null;
	}
	
	public int checkUserLogin(String username,String password){
		int flag=0;
		userEntity ue=getUserInfo(username);
		if(username.equals(ue.getU_name())&&password.equals(ue.getU_password())){
			flag=1;
		}
		
		return flag;
	}
}
