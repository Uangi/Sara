package com.charge;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.BasketDAO;
import com.basket.BasketDTO;
import com.product.ProductDAO;
import com.user.SignUpDTO;
import com.util.DBConn;
import com.util.MyPage;

public class ChargeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);

	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		Connection conn = DBConn.getConnection();

		ProductDAO dao = new ProductDAO(conn);
		
		BasketDAO dao3 = new BasketDAO(conn);

		ChargeDAO dao2 = new ChargeDAO(conn);

		MyPage myPage = new MyPage();

		String cp = req.getContextPath();

		String uri = req.getRequestURI();
		String url;



		if (uri.indexOf("charge_ok.do") != -1) {




			String imagePath = req.getParameter("imagePath");
			String productName = req.getParameter("productName");
			int price = Integer.parseInt(req.getParameter("price")); 	
			int qty = Integer.parseInt(req.getParameter("qty")); 
			String saveFileName = req.getParameter("saveFileName");
			


			url = cp + "/payment/charge.do?imagePath="+imagePath+
				"&productName="+productName+"&price="+price+"&qty="+qty+"&saveFileName="+saveFileName;

			resp.sendRedirect(url);

		}else if(uri.indexOf("charge.do") != -1) {
			
			
			HttpSession session = req.getSession();
			

		    SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
			
			SignUpDTO dto = dao2.chargeGetReadData(loggedInUser.getUserId());
			
			String imagePath = req.getParameter("imagePath");
			String productName = req.getParameter("productName");
			int price = Integer.parseInt(req.getParameter("price")); 	
			int qty = Integer.parseInt(req.getParameter("qty")); 
			String saveFileName = req.getParameter("saveFileName");

			int total = price * qty;
			
			req.setAttribute("total", total);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("productName", productName);
			req.setAttribute("price", price);
			req.setAttribute("qty", qty);
			req.setAttribute("saveFileName", saveFileName);
			req.setAttribute("dto", dto);
					
			
			url = "/shop/charge.jsp";
			forward(req, resp, url);	


		}else if(uri.indexOf("charge2.do") != -1) {
			
			
			String pageNum = req.getParameter("pageNum");

			HttpSession session = req.getSession();

		    SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
		    
		    SignUpDTO dto = dao2.chargeGetReadData(loggedInUser.getUserId());

			String userId = loggedInUser.getUserId();
			String userName = loggedInUser.getUserName();

			int currentPage = 1;

			int dataCount = dao3.basketGetDataCount(userId);    

			if(pageNum!=null) {

				currentPage = Integer.parseInt(pageNum);

			}

			int numPerPage = 5;
			int totalPage = myPage.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage){
				currentPage = totalPage;
			}

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;





			List<BasketDTO> lists = dao3.basketGetList(start, end , userId);

			String param = "";
			
			String urlList = cp + "/payment/charge2.do";

			if(!param.equals("")) {
				urlList += "?" + param;
			}

			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, urlList);

			String deletePath = cp + "/payment/delete.do";

			String imagePath = cp +"/ProductImage/saveFile";
			
			int total = dao3.basketTotal(userId);


			int count = dao3.basketGetDataCount(userId);
			
			String productName2 = dao3.productName(userId);
			String productName = productName2+"외"+(count-1)+"종";

			
			req.setAttribute("productName", productName);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("userName", userName);
			req.setAttribute("dto", dto);
			req.setAttribute("total", total);

			url = "/shop/charge2.jsp";
			forward(req, resp, url);	
		}
	}
}