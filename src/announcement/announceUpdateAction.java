package announcement;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class announceUpdateAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public announceUpdateAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		int id=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		Date currentDate = new Date(System.currentTimeMillis());
	    announcementDB ad=new announcementDB();
	    announceEntity ae=new announceEntity();
	    ae.setA_id(id);
	    ae.setA_title(title);
	    ae.setA_content(content);
		ae.setA_time(currentDate);
		try {
			ad.updateAnnouncement(ae);
			response.sendRedirect("admin/announcement/announcement.jsp");
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("失败");
		}
	    
	    
	    
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
