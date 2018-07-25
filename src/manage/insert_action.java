package manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert_action
 */
@SuppressWarnings("serial")
@WebServlet("/insert_action")
public class insert_action extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		shopinfos cloth=new shopinfos();
		cloth.setSi_id(Integer.parseInt((String)request.getParameter("si_id")));
		cloth.setSi_name((String)request.getParameter("si_name"));
		cloth.setSi_typeid(Integer.parseInt((String)request.getParameter("si_typeid")));
		cloth.setSi_typename((String)request.getParameter("si_typename"));
		//String time=(String)request.getParameter("si_time");
		//java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		//cloth.setSi_time((Date) formatter.parse(time));
		Date d=new Date(System.currentTimeMillis());
		cloth.setSi_time(d);
		cloth.setSi_price((double)Integer.parseInt(request.getParameter("si_price")));
		cloth.setSi_allnum(Integer.parseInt((String)request.getParameter("si_allnum")));
		cloth.setSi_count((double)Integer.parseInt(request.getParameter("si_count")));
		cloth.setSi_content((String)request.getParameter("si_content"));
		cloth.setSi_remark((String)request.getParameter("si_remark"));
		
		
		//cloth.setSi_photo((String)request.getParameter("si_photo"));//
		insert.insert(cloth);
		response.sendRedirect(request.getContextPath()+"/admin/add.jsp");
	}

}
