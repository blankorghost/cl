package com.daleyzou.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daleyzou.dao.IUserInfoDao;
import com.daleyzou.entity.UserInfo;
import com.daleyzou.utils.JdbcUtils;
import com.daleyzou.utils.PageBean;

public class UserInfoDao implements IUserInfoDao {

	@Override
	public void getAll(PageBean<UserInfo> pb) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      t_users.`u_id`,");
		sb.append("      t_users.`u_name`,");
		sb.append("      t_userinfos.`ui_email`,");
		sb.append("      t_userinfos.`ui_address`,");
		sb.append("      t_userinfos.`ui_phone`");
		sb.append("  FROM");
		sb.append("      t_users,");
		sb.append("      t_userinfos");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      t_users.`u_id`=t_userinfos.`ui_id`");
		
		List<Object> list = new ArrayList<Object>();//存储查询条件对应的值
		
		/**************分页条件*************************/
		sb.append(" LIMIT ?,?");
		/**判断：当前页<1，设置当前页为1；当前页>总页数，设置当前页为总页数**/
		//先查询总记录数
		int totalCount = getTotalCount(pb);       //******totalCount=0的话就没有必要进行下去了*******
		pb.setTotalCount(totalCount);
		if (pb.getCurrentPage() < 1){
			pb.setCurrentPage(1);
		}else if (pb.getCurrentPage() > pb.getTotalPage()) {
			pb.setCurrentPage(pb.getTotalPage());
		}
		int index = (pb.getCurrentPage() - 1) * pb.getPageCount();
		int count = pb.getPageCount();
		list.add(index);	   	//组装条件值--起始行
		list.add(count);       	//组装条件值--查询返回的行
		
		try {
			List<UserInfo> pageData = JdbcUtils.getQueryRunner().query(sb.toString(),
					new BeanListHandler<UserInfo>(UserInfo.class), list.toArray());
			//把查到的数据设置到分页对象中
			pb.setPageData(pageData);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public int getTotalCount(PageBean<UserInfo> pb) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      count(*)");
		sb.append("  FROM");
		sb.append("      t_users,");
		sb.append("      t_userinfos");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      t_users.`u_id`=t_userinfos.`ui_id`");
		
		try {
			Long num = JdbcUtils.getQueryRunner().query(sb.toString(), new ScalarHandler<Long>());
			return num.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<UserInfo> getAll(String u_name) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      t_users.`u_id`,");
		sb.append("      t_users.`u_name`,");
		sb.append("      t_userinfos.`ui_email`,");
		sb.append("      t_userinfos.`ui_address`,");
		sb.append("      t_userinfos.`ui_phone`");
		sb.append("  FROM");
		sb.append("      t_users,");
		sb.append("      t_userinfos");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      t_users.`u_id`=t_userinfos.`ui_id`");
		sb.append("  AND");
		sb.append("      t_users.`u_name` LIKE ?");
		try {
			return JdbcUtils.getQueryRunner().query(sb.toString(), new BeanListHandler<UserInfo>(UserInfo.class), "%"+u_name+"%");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public UserInfo findById(int u_id) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      t_users.`u_id`,");
		sb.append("      t_users.`u_name`,");
		sb.append("      t_userinfos.`ui_email`,");
		sb.append("      t_userinfos.`ui_address`,");
		sb.append("      t_userinfos.`ui_phone`,");
		sb.append("      t_users.`u_password`");
		sb.append("  FROM");
		sb.append("      t_users,");
		sb.append("      t_userinfos");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      t_users.`u_id`=t_userinfos.`ui_id`");
		sb.append("  AND");
		sb.append("      t_users.`u_id`=?");
		
		try {
			return JdbcUtils.getQueryRunner().query(sb.toString(), new BeanHandler<UserInfo>(UserInfo.class), u_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(UserInfo userInfo) {
		String sql = "UPDATE t_userinfos LEFT JOIN t_users ON t_users.`u_id`=t_userinfos.`ui_id` SET ui_email=?,ui_address=?,ui_phone=?,u_password=? WHERE t_users.`u_id`=?";
		try {
			JdbcUtils.getQueryRunner().update(sql, 
					userInfo.getUi_email(),userInfo.getUi_address(),userInfo.getUi_phone(),userInfo.getU_password(),
					userInfo.getU_id());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public void delete(int u_id) {
		String sql = "DELETE FROM t_users WHERE u_id=?;";
		try {
			JdbcUtils.getQueryRunner().update(sql, u_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public void updateAdministrator(int id, String pwd) {
		String sql = "UPDATE t_admin SET PASSWORD=？ WHERE id=？;";
		try {
			JdbcUtils.getQueryRunner().update(sql, pwd, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

}
