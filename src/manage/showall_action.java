package manage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class showall_action
 */
@WebServlet("/showall_action")
public class showall_action extends HttpServlet {

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
		request.setCharacterEncoding("gb2312");
		List<shopinfos> cloths=new ArrayList<shopinfos>();
		cloths=lookall.getall();
		request.getSession().setAttribute("cloths", cloths);
		request.getSession().setAttribute("len", cloths.size()+"");
		request.getSession().setAttribute("pagenow", 0+"");
		response.sendRedirect(request.getContextPath()+"/admin/show-all.jsp?next=0");
	}

}
