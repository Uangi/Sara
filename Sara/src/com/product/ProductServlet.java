package com.product;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyPage;

public class ProductServlet extends HttpServlet {

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

		MyPage myPage = new MyPage();

		String cp = req.getContextPath();

		String uri = req.getRequestURI();
		String url;

		// 파일 저장 경로 설정            
		String root = getServletContext().getRealPath("/");
		String path = root + "ProductImage" + File.separator + "saveFile";
		
		// newImage  -> saveFile          
		
		// 폴더 생성    
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (uri.indexOf("productCreated.do") != -1) {
			url = "/admin/productCreated.jsp";	// 실제 주소
			forward(req, resp, url);
			
			// 파일 업로드 @@
			
		} else if (uri.indexOf("productCreated_ok.do") != -1) {	// 가상 주소
			
			String encType = "UTF-8";
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());

			//          DB       
			if (mr.getFile("upload") != null) {
				// 업로드한 파일이 있으면                 
				int maxNum = dao.getMaxNum();

				ProductDTO dto = new ProductDTO();
				dto.setProductNum(maxNum + 1);
				dto.setProductName(mr.getParameter("productName"));
				dto.setProductSubject(mr.getParameter("productSubject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				dto.setCategory(mr.getParameter("category"));
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
		        dto.setQuantity(Integer.parseInt(mr.getParameter("quantity")));
//				dto.setHitCount(mr.getParameter("hitCount"));

				dao.insertData(dto);
			}

//			url = cp + "/product/Top.do";	// 가상 주소
			url = cp + "/shop.jsp";
			resp.sendRedirect(url);

			//파일 목록 조회 @@
			
			// Top.do
			
		} else if (uri.indexOf("Top.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");

			
			int currentPage = 1;

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}

			//   ü           
			int dataCount = dao.getDataCount();

			//              
			int numPerPage = 9;

			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> topProducts = dao.getList(start, end, "Top");

			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Top.do?";	// 가상 주소

			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";

			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";	// 파일 저장 경로
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("topProducts", topProducts);
			
			
			url = "/shop/Top.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			// Outer.do
			
		} else if (uri.indexOf("Outer.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");
			
			
			int currentPage = 1;
			
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//   ü           
			int dataCount = dao.getDataCount();
			
			//              
			int numPerPage = 9;
			
			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> outerProducts = dao.getList(start, end, "Outer");
			
			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Outer.do?";	// 가상 주소
			
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";
			
			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("outerProducts", outerProducts);
			
			
			url = "/shop/Outer.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			
			
			// Accessories.do
			
		} else if (uri.indexOf("Accessories.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");
			
			
			int currentPage = 1;
			
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//   ü           
			int dataCount = dao.getDataCount();
			
			//              
			int numPerPage = 9;
			
			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> accessoriesProducts = dao.getList(start, end, "Accessories");
			
			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Accessories.do?";	// 가상 주소
			
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";
			
			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("accessoriesProducts", accessoriesProducts);
			
			
			url = "/shop/Accessories.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			
			
			// Bags.do
			
		} else if (uri.indexOf("Bags.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");
			
			
			int currentPage = 1;
			
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//   ü           
			int dataCount = dao.getDataCount();
			
			//              
			int numPerPage = 9;
			
			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> BagsProducts = dao.getList(start, end, "Bags");
			
			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Bags.do?";	// 가상 주소
			
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";
			
			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("bagsProducts", BagsProducts);
			
			
			url = "/shop/Bags.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			
			
			// Bottoms.do
			
		} else if (uri.indexOf("Bottoms.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");
			
			
			int currentPage = 1;
			
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//   ü           
			int dataCount = dao.getDataCount();
			
			//              
			int numPerPage = 9;
			
			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> bottomsProducts = dao.getList(start, end, "Bottoms");
			
			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Bottoms.do?";	// 가상 주소
			
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";
			
			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("bottomsProducts", bottomsProducts);
			
			
			url = "/shop/Bottoms.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			
			
			// Shoes.do
			
		} else if (uri.indexOf("Shoes.do") != -1) {
			String pageNum = req.getParameter("pageNum");
			
			String category = req.getParameter("category");
			
			
			int currentPage = 1;
			
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//   ü           
			int dataCount = dao.getDataCount();
			
			//              
			int numPerPage = 9;
			
			//          
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<ProductDTO> lists = dao.getList(start, end, category);
			
			List<ProductDTO> shoesProducts = dao.getList(start, end, "Shoes");
			
			
			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/Shoes.do?";	// 가상 주소
			
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			String deletePath = cp + "/product/delete.do";
			String downloadPath = cp + "/product/download.do";
			
			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);	// Top에서 사용가능
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("productName", dto.getProductName());
			req.setAttribute("productSubject", dto.getProductSubject());
			
			req.setAttribute("category", dto.getCategory());
			
			req.setAttribute("price", dto.getPrice());
			req.setAttribute("quantity", dto.getQuantity());
			req.setAttribute("htiCount", dto.getHitCount());
			
			req.setAttribute("shoesProducts", shoesProducts);
			
			
			url = "/shop/Shoes.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);
			
			// Top 파일 삭제 @@
			
		} else if (uri.indexOf("delete.do") != -1) {
			int productNum = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String category = req.getParameter("category");

			ProductDTO dto = dao.getReadData(productNum);

			// 물리 주소 삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);

			// DB 주소 삭제
			dao.deleteData(productNum);

			url = cp + "/product/" + category + ".do?pageNum=" + pageNum;
			resp.sendRedirect(url);
			/* 원래 있던 홈페이지로 리다이렉팅이 안되서 버벅이는듯 ? */
			
//			url = cp + "/product/" + category + ".do";
//			resp.sendRedirect(url);
			
//			url = cp + "/product/Top.do?pageNum=" + pageNum;
//			resp.sendRedirect(url);
			
			
			//파일 다운로드 @@
		} else if (uri.indexOf("download.do") != -1) {
			int productNum = Integer.parseInt(req.getParameter("productNum"));

			ProductDTO dto = dao.getReadData(productNum);

			if (dto == null) {
				return;
			}

			// 다운로드 실행      
			boolean flag = FileManager.doFileDownload(resp, dto.getSaveFileName(), dto.getOriginalFileName(), path);

			if (flag == false) {	// 다운로드가 실패하면 
				
				resp.setContentType("text/html;charset=UTF-8");

				PrintWriter out = resp.getWriter();
				out.print("<script type='text/javascript'>");
				out.print("alert('다운로드 파일이 없습니다.');");
				out.print("history.back();");
				out.print("</script>");
			}

		}

	}
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
}
