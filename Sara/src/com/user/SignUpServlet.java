package com.user;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.CustomInfo;
import com.join.MemberDTO;
import com.util.DBConn;

public class SignUpServlet extends HttpServlet {
	
	
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
		String cp = req.getContextPath();
		Connection conn = DBConn.getConnection();
		SignUpDAO dao = new SignUpDAO(conn);
		String uri = req.getRequestURI();
		String url;
		
		if(uri.indexOf("userCreated.do")!=-1) {
			url="/Function/userCreated.jsp";
			forward(req, resp, url);
			
		}	else if(uri.indexOf("userCreated.do")!=-1){
		
			SignUpDTO dto = new SignUpDTO();

			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setTel1(req.getParameter("tel1"));
			dto.setTel2(req.getParameter("tel2"));
			dto.setTel3(req.getParameter("tel3"));
			dto.setMobile1(req.getParameter("mobile1"));
			dto.setMobile2(req.getParameter("mobile2"));
			dto.setMobile3(req.getParameter("mobile3"));
			dto.setSample4_postcode(req.getParameter("sample4_postcode"));
			dto.setSample4_roadAddress(req.getParameter("sample4_roadAddress"));
			dto.setSample4_jibunAddress(req.getParameter("sample4_jibunAddress"));
			dto.setSample4_detailAddress(req.getParameter("sample4_detailAddress"));
			dto.setSample4_extraAddress(req.getParameter("sample4_extraAddress"));
			dto.setEmail(req.getParameter("email"));
			dto.setGender(req.getParameter("gender"));
			dto.setBirth(req.getParameter("birth"));
			dto.setBank(req.getParameter("bank"));
			dto.setAct(req.getParameter("act"));
			
			dao.insertData(dto);

			url = cp + "/shop.jsp";
			resp.sendRedirect(url);	
		
		} else if(uri.indexOf("idcheked_ok.do")!=-1){
			 String userId = req.getParameter("userId");
			 String id = "";
			 System.out.println(userId);
			 
			    if (userId == null || userId.equals("")) {		    	
			        req.setAttribute("message", "아이디를 입력하세요");
			        url = "/Function/userCreated.jsp";
			        forward(req, resp, url);
			        return;
			        
			    } else if (userId.length() < 6) {
			        req.setAttribute("message", "6자리 이상을 입력해주세요");
			        url = "/Function/userCreated.jsp";
			        forward(req, resp, url);
			        return;
			        
			    }else if (containsSpecialCharacter(userId)) {
			    	
			    	req.setAttribute("message", "특수문자를 제외해 주세요");
			        url = "/Function/userCreated.jsp";
			        forward(req, resp, url);
			        return;
			    }
			    SignUpDTO dto = dao.getReadData(userId);

			    if (dto != null) {
			        req.setAttribute("message", "이미 사용 중인 아이디입니다.");
			        url = "/Function/userCreated.jsp";
			        forward(req, resp, url);
			        return;
			    }
	 
			    req.setAttribute("message", "사용 가능한 아이디입니다.");
			    id = userId;
			    req.setAttribute("userId", id);
			    url="/Function/userCreated.jsp";
			    forward(req, resp, url);
			    
		}	else if(uri.indexOf("login.do")!=-1){
			
			url="/Function/login.jsp";
			forward(req, resp, url);
		
	}	else if(uri.indexOf("login_ok.do")!=-1) {
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		SignUpDTO dto = dao.getReadData(userId);
		
		if(dto==null||(!dto.getUserPwd().equals(userPwd))) {
			
			req.setAttribute("message", "회원정보가 존재하지 않습니다.");				
			url = "/Function/login.jsp";
			forward(req, resp, url);	
		}
		
		HttpSession session = req.getSession();
		 SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
		 loggedInUser.setUserId(dto.getUserId());         
		 loggedInUser.setUserName(dto.getUserName());                
		session.setAttribute("loggedInUser", loggedInUser);
		session.setMaxInactiveInterval(-1);
		url = cp;
		resp.sendRedirect(url);	
		
		// 로그아웃
	}	else if(uri.indexOf("logout.do")!=-1) {
		
		HttpSession session = req.getSession();
		session.removeAttribute("loggedInUser");
		session.invalidate();
		url = cp+ "/product/shop.do";
		resp.sendRedirect(url);	
			
		// 회원정보 수정
	}	else if(uri.indexOf("userUpdate.do")!=-1) {
		
		HttpSession session = req.getSession();
//		CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
		SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
		SignUpDTO dto = dao.getReadData(loggedInUser.getUserId());
		req.setAttribute("dto", dto);
		url="/Function/userUpdate.jsp";

		forward(req, resp, url);
		
	} else if(uri.indexOf("userUpdate_ok.do")!=-1) {
		
		HttpSession session = req.getSession();	// request에 대한 세션 객체를 가져오거나, 새로운 세션 객체 생성
		
		// 세션 생성
		SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
		String userId = loggedInUser.getUserId();
		SignUpDTO dto = dao.getReadData(userId);	
		
		dto.setUserId(userId);
		dto.setUserPwd(req.getParameter("userPwd"));
		dto.setSample4_postcode(req.getParameter("sample4_postcode"));
		dto.setSample4_roadAddress(req.getParameter("sample4_roadAddress"));
		dto.setSample4_jibunAddress(req.getParameter("sample4_jibunAddress"));
		dto.setSample4_detailAddress(req.getParameter("sample4_detailAddress"));
		dto.setSample4_extraAddress(req.getParameter("sample4_extraAddress"));
		dto.setTel1(req.getParameter("tel1"));
		dto.setTel2(req.getParameter("tel2"));
		dto.setTel3(req.getParameter("tel3"));
		dto.setMobile1(req.getParameter("mobile1"));
		dto.setMobile2(req.getParameter("mobile2"));
		dto.setMobile3(req.getParameter("mobile3"));
		dto.setBank(req.getParameter("bank"));
		dto.setAct(req.getParameter("act"));
		
		dao.updateData(dto);
		
		url = cp;
		resp.sendRedirect(url);
		
		// 회원탈퇴
	} else if (uri.indexOf("userWithDrawal.do") != -1) {
		String userId = req.getParameter("userId");
		dao.deleteData(userId);
		HttpSession session = req.getSession();	// 회원탈퇴 후 세션 삭제
		session.removeAttribute("loggedInUser");
		session.invalidate();
		url = cp + "/product/shop.do";	// 회원탈퇴하면 굿바이하면서 만든 주소로 보내기
		resp.sendRedirect(url);
	}
}
	
	private boolean containsSpecialCharacter(String userId) {
	    // 정규표현식을 사용하여 특수 문자 검사
	    String specialCharacters = "[!@#$%^&*(),.?\":{}|<>]";
	    return userId.matches(".*" + specialCharacters + ".*");
	}
}