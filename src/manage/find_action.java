package manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class find_action
 */
@WebServlet("/find_action")
public class find_action extends HttpServlet {
       
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
		String gettype=request.getParameter("gettype");
		List<shopinfos> cloths;
		if(gettype.equals("1")){//通过form传递参数
			String select=request.getParameter("select");
			if(select.equals("1")){//精确
				cloths=find.find_by_name(request.getParameter("name"));
			}else{//模糊
				cloths=find.find_by_blur(request.getParameter("name"),Integer.parseInt(request.getParameter("low")),
						Integer.parseInt(request.getParameter("high")), request.getParameter("type"));
			}
		}else{//通过重定向传递
			String select=request.getParameter("select");
			if(select.equals("1")){//通过名字
				cloths=find.find_by_name((String)request.getAttribute("name"));
			}else{//通过类别id
				cloths=find.find_by_typeid(Integer.parseInt((String)request.getSession().getAttribute("typeid")));
			}
			
		}
		
		if(cloths.size()==0){
			request.getSession().setAttribute("cloths", null);
		}
		request.getSession().setAttribute("cloths", cloths);
		response.sendRedirect(request.getContextPath()+"/cl/search.jsp");
	}

}
