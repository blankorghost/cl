package manage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * 增加商品
 */
public class insert {
	public static void insert(shopinfos sinfo){
		Connection con=null;
		PreparedStatement stm=null;
		
		con=DBConnection.getConnection();
		try {
			stm = con.prepareStatement("insert into t_shopinfos values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			stm.setInt(1, sinfo.getSi_id());
			stm.setString(2, sinfo.getSi_name());
			stm.setInt(3, sinfo.getSi_typeid());
			stm.setString(4, sinfo.getSi_typename());
			stm.setDate(5, sinfo.getSi_time());
			stm.setString(6, sinfo.getSi_photo());
			stm.setString(7, sinfo.getSi_bigphoto());
			stm.setDouble(8, sinfo.getSi_price());
			stm.setInt(9, sinfo.getSi_allnum());
			stm.setInt(10, sinfo.getSi_salenum());
			stm.setString(11, sinfo.getSi_content());
			stm.setString(12, sinfo.getSi_remark());
			stm.setDouble(13, sinfo.getSi_count());
			int rs=stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
	}
}
