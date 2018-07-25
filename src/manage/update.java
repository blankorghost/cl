package manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * 修改商品信息(通过id)
 */
public class update {
	static int rs ;
	public static int Update(shopinfos sinfo){
		Connection con=null;
		PreparedStatement stm=null;
		con=DBConnection.getConnection();
		try {
			stm=con.prepareStatement("update t_shopinfos set si_name=?,si_typeid=?,si_typename=?,"
					+ "si_time=?,si_photo=?,si_bigphoto=?,si_price=?,si_allnum=?,"
					+ "si_salenum=?,si_content=?,si_remark=?,si_count=? where si_id=?");
			stm.setInt(13, sinfo.getSi_id());
			stm.setString(1, sinfo.getSi_name());
			stm.setInt(2, sinfo.getSi_typeid());
			stm.setString(3, sinfo.getSi_typename());
			stm.setDate(4, sinfo.getSi_time());
			stm.setString(5, sinfo.getSi_photo());
			stm.setString(6, sinfo.getSi_photo());
			stm.setDouble(7, sinfo.getSi_price());
			stm.setInt(8, sinfo.getSi_allnum());
			stm.setInt(9, sinfo.getSi_salenum());
			stm.setString(10, sinfo.getSi_content());
			stm.setString(11, sinfo.getSi_remark());
			stm.setDouble(12, sinfo.getSi_count());
			rs=stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
		return rs;
	}
}
