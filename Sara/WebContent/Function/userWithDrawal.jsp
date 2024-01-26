<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.user.SignUpDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String userId = request.getParameter("userId");
	
	
	Connection conn = DBConn.getConnection();
	SignUpDAO dao = new SignUpDAO(conn);

	dao.deleteData(userId);

	response.sendRedirect(cp + "/product/shop.do;");
	%>
	
<jsp:useBean id="dto" class="com.user.SignUpDTO" scope="page" />
<jsp:setProperty property="*" name="dto" />
