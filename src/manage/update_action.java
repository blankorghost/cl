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
 * Servlet implementation class update_action
 */
@WebServlet("/update")
public class update_action extends HttpServlet {

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
		shopinfos cloth=new shopinfos();
		request.setCharacterEncoding("gb2312");
		cloth.setSi_allnum(Integer.parseInt(request.getParameter("si_allnum")));
		cloth.setSi_content(request.getParameter("si_content"));
		cloth.setSi_count((double)Integer.parseInt(request.getParameter("si_count")));
		cloth.setSi_id(Integer.parseInt(request.getParameter("si_id")));
		cloth.setSi_name(request.getParameter("si_name"));
		cloth.setSi_photo(request.getParameter("si_photo"));
		cloth.setSi_price((double)Integer.parseInt(request.getParameter("si_price")));
		cloth.setSi_remark(request.getParameter("si_remark"));
		Date d=new Date(System.currentTimeMillis());
		cloth.setSi_time(d);
		cloth.setSi_typeid(Integer.parseInt(request.getParameter("si_typeid")));
		cloth.setSi_typename(request.getParameter("si_typename"));
		int rs=update.Update(cloth);
		if(rs!=0){
			response.sendRedirect(request.getContextPath()+"/admin/look-one.jsp?id="+cloth.getSi_id());
		}else{
			response.sendRedirect(request.getContextPath()+"/admin/look-one.jsp?id="+cloth.getSi_id());
		}
		
	}

}
