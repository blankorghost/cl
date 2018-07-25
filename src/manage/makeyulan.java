package manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class makeyulan
 */
@WebServlet("/makeyulan")
public class makeyulan extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int p_id=Integer.parseInt(request.getParameter("pid"));
		int s_sid=Integer.parseInt(request.getParameter("s_sid"));
		String path=find.findpicpath(p_id);
		inserttu.update_si_photo(path, s_sid);
		response.sendRedirect(request.getContextPath()+"/admin/picture.jsp?id="+p_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
