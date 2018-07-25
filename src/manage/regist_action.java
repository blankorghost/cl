package manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class regist_action
 */
@WebServlet("/regist_action")
public class regist_action extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String repass=request.getParameter("repass");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String adress=request.getParameter("adress");
		
		if(repass.equals(password)){
		int u_id=getlen.getu_id();//给用户的id
		

		Connection con1=null;
		PreparedStatement stm1=null;
		con1=DBConnection.getConnection();
		try {
		stm1 = con1.prepareStatement("insert into t_users values(?,?,?,?,?)");
		stm1.setInt(1, u_id);
		stm1.setString(2, username);
		stm1.setString(3, password);
		Date d1=new Date(System.currentTimeMillis());
		stm1.setDate(4,d1);
		stm1.setDate(5,d1);
		stm1.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConnection.closeConnection();
	}
		
		Connection con=null;
		PreparedStatement stm=null;
		con=DBConnection.getConnection();
		try {
			stm = con.prepareStatement("insert into t_userinfos values(?,?,?,?,?,?,?,?,?,?,?)");
			stm.setInt(1, u_id);
			stm.setInt(2, u_id);
			stm.setString(3, "inuse");
			stm.setString(4, username);
			stm.setInt(5, u_id);
			stm.setString(6, null);
			stm.setString(7, email);
			stm.setString(8, adress);
			stm.setString(9, phone);
			stm.setInt(10, 00000);
			stm.setInt(11, 0);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.closeConnection();
		}
		
		response.sendRedirect(request.getContextPath()+"/cl/login.jsp");
		
		}else{
			response.sendRedirect(request.getContextPath()+"/cl/regist.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
