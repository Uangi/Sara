package com.review;

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

import com.product.ProductDAO;
import com.product.ProductDTO;
import com.user.SignUpDTO;
import com.util.DBConn;
import com.util.MyPage;

public class ReviewServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		process(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBConn.getConnection();
		ReviewDAO dao = new ReviewDAO(conn);
		ProductDAO dao2 = new ProductDAO(conn);
		MyPage myPage = new MyPage();
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		String root = getServletContext().getRealPath("/");
		String path = root + "ProductImage" + File.separator + "saveFile";
		
	if (uri.indexOf("board.do")!=-1) {
		
		int productNum = Integer.parseInt(req.getParameter("productNum"));
		String saveFileName = req.getParameter("saveFileName");
		String imagePath = req.getParameter("imagePath");
		String pageNum = req.getParameter("pageNum");
		dao2.updateHitCount(productNum);
		int currentPage = 1;
		int dataCount = dao.reviewGetDataCount(productNum);

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
		List<ReviewDTO> lists = dao.reviewGetList(start, end , productNum);
		String param = "";
		 param = "productNum=" + productNum;
		 param +="&saveFileName=" + saveFileName;
		 param +="&imagePath=" + imagePath;
         String urlList = cp + "/detail/board.do";
         
         if(!param.equals("")) {
            urlList += "?" + param;
         }
         
         String pageIndexList = myPage.pageIndexList(currentPage, totalPage, urlList);
		 String deletePath = cp + "/detail/delete.do";
		 ProductDTO dto = dao2.getReadData(productNum);
		 int average = dao.revAverage(productNum);

		req.setAttribute("deletePath", deletePath);
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("pageNum", currentPage);
		req.setAttribute("totalPage", totalPage);
	
		req.setAttribute("dto", dto);
		req.setAttribute("average", average);
		req.setAttribute("imagePath", imagePath);
		req.setAttribute("saveFileName", saveFileName);
		url = "/shop/board.jsp";
		forward(req, resp, url);
				
	}	else if(uri.indexOf("board_ok.do")!=-1) {
		
		String saveFileName = req.getParameter("saveFileName");
		String imagePath = req.getParameter("imagePath");
		HttpSession session = req.getSession();
		SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
		ReviewDTO dto = new ReviewDTO();
	
		dto.setUserId(loggedInUser.getUserId());	
		dto.setUserName(loggedInUser.getUserName());
		dto.setProductNum(Integer.parseInt(req.getParameter("productNum")));
		dto.setContent(req.getParameter("content"));
		dto.setRev(Integer.parseInt(req.getParameter("rev")));
		String productNum  = String.valueOf(Integer.parseInt(req.getParameter("productNum")));
		dao.reviewInsertData(dto);
		req.setAttribute("productNum", productNum );
		req.setAttribute("imagePath", imagePath);
		req.setAttribute("saveFileName", saveFileName);	
		url = cp + "/detail/board.do?productNum="+productNum+"&imagePath="+imagePath+"&saveFileName="+saveFileName;
		resp.sendRedirect(url);	
		}
	}
}
