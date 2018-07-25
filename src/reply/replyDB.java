package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import common.DBConnection;

public class replyDB {
	private Connection con=null;
	
	
	
	public ArrayList<userreplyEntity> getUserReplyByShopId(int shopid){
		String sql="select * from t_reply where r_shopid=? order by r_id desc";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, shopid);
			rs=ps.executeQuery();
			ArrayList<userreplyEntity> list=new ArrayList<userreplyEntity>();
			while(rs.next()){
				userreplyEntity ue=new userreplyEntity();
				ue.setR_id(rs.getInt(1));
				ue.setR_userid(rs.getInt(2));
				ue.setR_username(rs.getString(3));
				ue.setR_shopid(rs.getInt(4));
				ue.setR_content(rs.getString(5));
				ue.setR_time(rs.getDate(6));
				list.add(ue);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("获取评论失败！");
		}
		
		return null;
	}
	
	public int deleteUserReply(int r_id){
		int flag=0;
		PreparedStatement ps=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("delete from t_reply where r_id=?");
			ps.setInt(1, r_id);
			flag=ps.executeUpdate();
			return flag;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return flag;
	}
	
	public int inserUserReply(userreplyEntity ue){
		int flag=0;
		PreparedStatement ps=null;
		String sql="insert into t_reply(r_userid,r_username,r_shopid,r_content,r_time) values(?,?,?,?,?)";
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, ue.getR_userid());
			ps.setString(2, ue.getR_username());
			ps.setInt(3, ue.getR_shopid());
			ps.setString(4, ue.getR_content());
			ps.setDate(5, ue.getR_time());
			flag=ps.executeUpdate();
			
			return flag;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return flag;
	}
	
	public ArrayList<userreplyEntity> getUserReplyByUserId(int pageSize,int curPage,int userid){
		String sql="select * from t_reply where r_userid=? order by r_id desc limit "+((curPage-1)*pageSize)+","+pageSize;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, userid);
			rs=ps.executeQuery();
			ArrayList<userreplyEntity> list=new ArrayList<userreplyEntity>();
			while(rs.next()){
				userreplyEntity ue=new userreplyEntity();
				ue.setR_id(rs.getInt(1));
				ue.setR_userid(rs.getInt(2));
				ue.setR_username(rs.getString(3));
				ue.setR_shopid(rs.getInt(4));
				ue.setR_content(rs.getString(5));
				ue.setR_time(rs.getDate(6));
				list.add(ue);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("获取失败！");// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ArrayList<userreplyEntity> getUserReplyByPage(int pageSize,int curPage){
		String sql="select * from t_reply order by r_id desc limit "+((curPage-1)*pageSize)+","+pageSize;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			ArrayList<userreplyEntity> list=new ArrayList<userreplyEntity>();
			while(rs.next()){
				userreplyEntity ue=new userreplyEntity();
				ue.setR_id(rs.getInt(1));
				ue.setR_userid(rs.getInt(2));
				ue.setR_username(rs.getString(3));
				ue.setR_shopid(rs.getInt(4));
				ue.setR_content(rs.getString(5));
				ue.setR_time(rs.getDate(6));
				list.add(ue);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("获取失败！");// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	public ArrayList<userreplyEntity> getUserReplyByPage(int pageSize,int curPage,int shopid){
		String sql="select * from t_reply where r_shopid=? order by r_id desc limit "+((curPage-1)*pageSize)+","+pageSize;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, shopid);
			rs=ps.executeQuery();
			ArrayList<userreplyEntity> list=new ArrayList<userreplyEntity>();
			while(rs.next()){
				userreplyEntity ue=new userreplyEntity();
				ue.setR_id(rs.getInt(1));
				ue.setR_userid(rs.getInt(2));
				ue.setR_username(rs.getString(3));
				ue.setR_shopid(rs.getInt(4));
				ue.setR_content(rs.getString(5));
				ue.setR_time(rs.getDate(6));
				list.add(ue);
			}
			
			return list;
			
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
			ResultSet rs=statement.executeQuery("select count(1) from t_reply");
			if(rs.next()){
				int recods=rs.getInt(1);
				pageCount=recods/pageSize+(recods%pageSize==0?0:1); 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return pageCount;
	}
	
	public int getAllReplyNumsByShopId(int shopid){
		int Count=0;
		PreparedStatement ps=null;
		try {
			con=DBConnection.getConnection();
			ps=con.prepareStatement("select count(1) from t_reply where r_shopid=?");
			ps.setInt(1, shopid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				int recods=rs.getInt(1);
				Count=recods;
			}
			return Count;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return Count;
	}
	
	
}
