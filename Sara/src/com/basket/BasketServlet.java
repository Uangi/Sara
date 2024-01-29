package com.basket;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.SignUpDTO;
import com.util.DBConn;
import com.util.MyPage;



public class BasketServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}



	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



		req.setCharacterEncoding("UTF-8");

		String cp = req.getContextPath();

		Connection conn = DBConn.getConnection();

		BasketDAO dao = new BasketDAO(conn);

		MyPage myPage = new MyPage();

		String root = getServletContext().getRealPath("/");
		String path = root + "ProductImage" + File.separator + "saveFile";


		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}


		String uri = req.getRequestURI();

		String url;


		if(uri.indexOf("basket_ok.do")!=-1) {
			
		
			
			String saveFileName = req.getParameter("saveFileName");
			String imagePath = req.getParameter("imagePath");

			
			HttpSession session = req.getSession();

			SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");

			int maxNum = dao.basketGetMaxNum();

			BasketDTO dto = new BasketDTO();

			dto.setNum(maxNum+1);
			dto.setUserId(loggedInUser.getUserId());	
			dto.setUserName(loggedInUser.getUserName());
			
			dto.setProductNum(Integer.parseInt(req.getParameter("productNum")));
			dto.setProductName(req.getParameter("productName"));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setSaveFileName(req.getParameter("saveFileName"));
			dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
//			dto.setTotalprice(Integer.parseInt(req.getParameter("totalprice")));
			
			
			dao.basketInsertData(dto);

			int productNum = Integer.parseInt((req.getParameter("productNum")));

			req.setAttribute("productNum", productNum);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("saveFileName", saveFileName);	

			url = cp + "/detail/board.do?productNum="+productNum+"&imagePath="+imagePath+"&saveFileName="+saveFileName;

			resp.sendRedirect(url);		



		}else if(uri.indexOf("basket.do")!=-1){
			

			String pageNum = req.getParameter("pageNum");

			HttpSession session = req.getSession();

			SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");

			
			String userId = loggedInUser.getUserId();
			String userName = loggedInUser.getUserName();

			int currentPage = 1;

			int dataCount = dao.basketGetDataCount(userId);    

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


			List<BasketDTO> lists = dao.basketGetList(start, end , userId);

			String param = "";
			
			String urlList = cp + "/shoppingcart/basket.do";

			if(!param.equals("")) {
				urlList += "?" + param;
			}

			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, urlList);

			String deletePath = cp + "/shoppingcart/delete.do";

			String imagePath = cp +"/ProductImage/saveFile";


			req.setAttribute("deletePath", deletePath);
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("userName", userName);

			url = "/shop/basket.jsp";
			forward(req, resp, url);	

			// 장바구니 품목 삭제
		}else if(uri.indexOf("delete.do")!=-1) {


			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			

			//db           
			dao.basketDeleteData(num);

			url = cp+"/shoppingcart/basket.do?pageNum=" + pageNum ;
			resp.sendRedirect(url);

	}

}
}