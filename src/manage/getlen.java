package manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;

public class getlen {
	public static int len = 0;
	public  static int get(){
		Connection con=null;
		Statement stm=null;
		ResultSet rs;
		con=DBConnection.getConnection();
		try {
			stm=con.createStatement();
			rs=stm.executeQuery("select * from t_picture");
			while(rs.next()){
				len=len+1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return len;
	}
	/*
	 * 给注册用户的id
	 */
	public  static int getu_id(){
		Connection con=null;
		Statement stm=null;
		ResultSet rs;
		con=DBConnection.getConnection();
		try {
			len=0;
			stm=con.createStatement();
			rs=stm.executeQuery("select * from t_users");
			while(rs.next()){
				if(rs.getInt("u_id")>=len){
					len=rs.getInt("u_id");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return len+1;
	}
}
