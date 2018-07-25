package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;

public class adminreplyDB {
	private Connection con=null;
	
	public adminreplyEntity getAdminReplyByReplyId(int r_id){
		PreparedStatement ps=null;
		String sql="select * from t_amdinreply where ar_rid=?";
		ResultSet rs=null;
		
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, r_id);
			rs=ps.executeQuery();
			adminreplyEntity ae=new adminreplyEntity();
			while(rs.next()){
				ae.setAr_id(rs.getInt(1));
				ae.setAr_adminid(rs.getInt(2));
				ae.setAr_adminname(rs.getString(3));
				ae.setAr_rid(rs.getInt(4));
				ae.setAr_content(rs.getString(5));
				ae.setAr_time(rs.getDate(6));
			}
			
			return ae;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("获取管理员回复失败！");// TODO: handle exception
		}
		return null;
	}
}
