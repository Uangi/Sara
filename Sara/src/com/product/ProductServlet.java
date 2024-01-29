package com.product;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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


		} else if (uri.indexOf("shop.do") != -1){




			url = "/shop.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);



		}  else if (uri.indexOf("category.do") != -1) {


			String pageNum = req.getParameter("pageNum");
			String category = req.getParameter("category");		
		
			int currentPage = 1;

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}


				//   ü           
				int dataCount = dao.getDataCount(category);

			          
				int numPerPage = 9;

			     
				int totalPage = myPage.getPageCount(numPerPage, dataCount);

				if (currentPage > totalPage) {
					currentPage = totalPage;
				}

				int start = (currentPage - 1) * numPerPage + 1;
				int end = currentPage * numPerPage;

				List<ProductDTO> lists = dao.getList(start, end, category);		



				ProductDTO dto = new ProductDTO();

				String param = "";

				param = "category=" + category;

				String listUrl = cp + "/product/category.do";	// 가상 주소

				if(!param.equals("")) {

					listUrl += "?" + param;
				}



				String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);

				String deletePath = cp + "/product/delete.do";

				// 이미지 경로 

				String imagePath = cp +"/ProductImage/saveFile";


				req.setAttribute("imagePath", imagePath);		
				req.setAttribute("lists", lists);	// Top에서 사용가능
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("pageNum", currentPage);
				req.setAttribute("deletePath", deletePath);
				req.setAttribute("totalPage", totalPage);

				req.setAttribute("productName", dto.getProductName());
				req.setAttribute("productSubject", dto.getProductSubject());
				req.setAttribute("category", dto.getCategory());



				url = "/shop/category.jsp";	// 이미지 파일 리스트의 실제 주소
				forward(req, resp, url);

	


		} else if (uri.indexOf("category2.do") != -1) {
			
			
			String pageNum = req.getParameter("pageNum");	
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			
			
			int currentPage = 1;

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}

				if(searchValue==null) {
					searchKey = "productName";
					searchValue = "";
				}else {
					if(req.getMethod().equalsIgnoreCase("GET")) {
						searchValue = URLDecoder.decode(searchValue, "UTF-8");
					}
				}

				//전체 데이터 개수
				int dataCount = dao.searchGetDataCount(searchKey, searchValue);

				int numPerPage = 9;
				int totalPage = myPage.getPageCount(numPerPage, dataCount);

				if(currentPage>totalPage) {
					currentPage = totalPage;
				}

				int start = (currentPage - 1) * numPerPage +1;
				int end =  currentPage * numPerPage;

				List<ProductDTO> lists = dao.serchGetLists(start, end, searchKey, searchValue);

				String param = "";
				
				if(searchValue!=null && !searchValue.equals("")) {
					
					param = "searchKey=" + searchKey;
					param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				}
				

				String urlList = cp + "/product/category.do";
				
				if(!param.equals("")) {
					
					urlList += "?" + param;
				}
				
				String pageIndexList = myPage.pageIndexList(currentPage, totalPage, urlList);
						
				ProductDTO dto2 = new ProductDTO();
			
				String deletePath = cp + "/product/delete.do";

				// 이미지 경로 

				String imagePath = cp +"/ProductImage/saveFile";


				req.setAttribute("imagePath", imagePath);		
				req.setAttribute("lists", lists);	// Top에서 사용가능
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("pageNum", currentPage);
				req.setAttribute("deletePath", deletePath);
				req.setAttribute("totalPage", totalPage);

				req.setAttribute("productName", dto2.getProductName());
				req.setAttribute("productSubject", dto2.getProductSubject());
				req.setAttribute("category", dto2.getCategory());
				 req.setAttribute("searchKey", searchKey);
		         req.setAttribute("searchValue", searchValue);
				
				
		



				url = "/shop/category.jsp";	// 이미지 파일 리스트의 실제 주소
				forward(req, resp, url);			
			
		}
			else if (uri.indexOf("delete.do") != -1) {


			int productNum = Integer.parseInt(req.getParameter("productNum"));
			String pageNum = req.getParameter("pageNum");
			String category = req.getParameter("category");

			ProductDTO dto = dao.getReadData(productNum);

			// 물리 주소 삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);

			// DB 주소 삭제
			dao.deleteData(productNum);

			url = cp + "/product/category.do?category=" + category + "&pageNum=" + pageNum;



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

		} else if (uri.indexOf("shop.do") != -1) {


			ProductDTO dto = new ProductDTO();
			String listUrl = cp + "/product/shop.do?";	// 가상 주소


			//			String downloadPath = cp + "/product/download.do";

			// 이미지 경로    
			String imagePath = cp + "/ProductImage/saveFile";	// 파일 저장 경로
			req.setAttribute("imagePath", imagePath);

			//			req.setAttribute("downloadPath", downloadPath);

			url = "/shop.jsp";	// 이미지 파일 리스트의 실제 주소
			forward(req, resp, url);

		}



	}

}
