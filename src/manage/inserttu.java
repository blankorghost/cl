package manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class inserttu {
	
	/*
	 * 在picture中加数据
	 */
	public static void insert(String p_path,int p_sid){
		Connection con=null;
		PreparedStatement stm=null;
		int id=getlen.get()+1;
		con=DBConnection.getConnection();
		try {
			stm = con.prepareStatement("insert into t_picture values(?,?,?,?)");
			stm.setInt(1, id);
			stm.setString(2, p_path);
			stm.setInt(3,p_sid);
			stm.setString(4, null);
			int rs=stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
	}
	
	/*
	 * 修改图片的si_photo
	 */
	public static void update_si_photo(String p_path,int p_sid){
		Connection con=null;
		PreparedStatement stm=null;
		con=DBConnection.getConnection();
		try {
			stm = con.prepareStatement("update t_shopinfos set si_photo=? where si_id=?");
			stm.setInt(2, p_sid);
			stm.setString(1, p_path);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
	}
}
