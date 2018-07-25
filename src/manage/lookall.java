package manage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * 管理员查看所有商品，
 */
public class lookall {

	static public List<shopinfos> getall(){
		List<shopinfos> sinfo=new ArrayList<shopinfos>();
		Connection con=null;
		Statement stm;
		ResultSet rs;
		con=DBConnection.getConnection();
		try {
			stm=con.createStatement();
			rs=stm.executeQuery("select * from t_shopinfos");
			while(rs.next()){
				shopinfos info=new shopinfos();
				info.setSi_id(rs.getInt("si_id"));
				info.setSi_name(rs.getString("si_name"));
				info.setSi_typeid(rs.getInt("si_typeid"));
				info.setSi_typename(rs.getString("si_typename"));
				info.setSi_time(rs.getDate("si_time"));
				info.setSi_photo(rs.getString("si_photo"));
				info.setSi_bigphoto(rs.getString("si_bigphoto"));
				info.setSi_price(rs.getDouble("si_price"));
				info.setSi_allnum(rs.getInt("si_allnum"));
				info.setSi_salenum(rs.getInt("si_salenum"));
				info.setSi_content(rs.getString("si_content"));
				info.setSi_remark(rs.getString("si_remark"));
				info.setSi_count(rs.getDouble("si_count"));
				sinfo.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
		
		return sinfo;
	}
}
