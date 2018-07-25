package bean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manage.find;
import manage.shopinfos;

/**
 * Servlet implementation class buycarAddAction
 */
@WebServlet("/buycarAddAction")
public class buycarAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buycarAddAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		shopcarDB beanDB=new shopcarDB();
		int shopid=Integer.parseInt(request.getParameter("shopid"));
		shopinfos cloth=find.find_by_id(shopid);
		BuyList buylist=new BuyList();
		buylist.setShopID(shopid);
		buylist.setPrice(cloth.getSi_price());
		buylist.setShopname(cloth.getSi_name());
		beanDB.insertShopCar(request);
		//session.setAttribute("buylist", buylist);
		response.sendRedirect("cl/shopcar.jsp");
	}

}
