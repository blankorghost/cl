package announcement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import common.DBConnection;

public class announcementDB {
	private Connection con=null;
	
	public ArrayList<announceEntity> getAnnounce(){
		ResultSet rs=null;
		Statement st=null;
		String sql="select * from t_announcement";
		ArrayList<announceEntity> ac=new ArrayList<announceEntity>();
		try {
			con=DBConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				announceEntity ae=new announceEntity();
				ae.setA_id(rs.getInt(1));
				ae.setA_title(rs.getString(2));
				ae.setA_content(rs.getString(3));
				ae.setA_time(rs.getDate(4));
				ae.setA_settop(rs.getInt(5));
				ac.add(ae);
			}	
			return ac;
		} catch (Exception e) {
			System.out.println("获取所有公告失败！");
			e.printStackTrace();// TODO: handle exception
		}
		
		return null;
	}
	
	
	public announceEntity getAnnounceById(int id){
		ResultSet rs=null;
		PreparedStatement ps=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("select * from t_announcement where a_id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			announceEntity ae=new announceEntity();
			while(rs.next()){
				ae.setA_id(rs.getInt(1));
				ae.setA_title(rs.getString(2));
				ae.setA_content(rs.getString(3));
				ae.setA_time(rs.getDate(4));
				ae.setA_settop(rs.getInt(5));
			}
			return ae;
		} catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
		}
		
		return null;
	}
	
	
	
	public int insertAnnouncement(announceEntity ac){
		PreparedStatement ps=null;
		int count=0;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("insert into t_announcement(a_title,a_content,a_time) values(?,?,?)");
			ps.setString(1, ac.getA_title());
			ps.setString(2, ac.getA_content());
			ps.setDate(3, ac.getA_time());
			count=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("添加失败");// TODO: handle exception
		}
		return count;
	}
	
	public int updateAnnouncement(announceEntity ac){
		PreparedStatement ps=null;
		int count=0;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("update t_announcement set a_title=?,a_content=?,a_time=? where a_id=?");
			ps.setString(1, ac.getA_title());
			ps.setString(2, ac.getA_content());
			ps.setDate(3, ac.getA_time());
			ps.setInt(4, ac.getA_id());
			count=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("更新失败");// TODO: handle exception
		}
		
		return count;
	}
	
	public int deleteAnnouncement(int id){
		PreparedStatement ps=null;
		int count=0;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("delete from t_announcement where a_id=?");
			ps.setInt(1, id);
			count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			System.out.println("删除失败");// TODO: handle exception
		}
		return count;
	}
	
	public ArrayList<announceEntity> getAnnounceByPage(int pageSize,int curPage){
		String sql="select * from t_announcement order by a_id desc limit "+((curPage-1)*pageSize)+","+pageSize;
		Statement statement=null;
		try {
			con=DBConnection.getConnection();
			statement=con.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			ArrayList<announceEntity> ac=new ArrayList<announceEntity>();
			while(rs.next()){
				announceEntity ae=new announceEntity();
				ae.setA_id(rs.getInt(1));
				ae.setA_title(rs.getString(2));
				ae.setA_content(rs.getString(3));
				ae.setA_time(rs.getDate(4));
				ae.setA_settop(rs.getInt(5));
				ac.add(ae);
			}
			return ac;
		} catch (Exception e) {
			System.out.println("获取失败！");// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

	public int getPageCount(int pageSize){
		int pageCount=0;
		Statement statement=null;
		try {
			con=DBConnection.getConnection();
			statement=con.createStatement();
			ResultSet rs=statement.executeQuery("select count(1) from t_announcement");
			if(rs.next()){
				int recods=rs.getInt(1);
				pageCount=recods/pageSize+(recods%pageSize==0?0:1); 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return pageCount;
	}



	
	
}
