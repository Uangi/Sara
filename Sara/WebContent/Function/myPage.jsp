<%@page import="com.user.SignUpDTO"%>
<%@page import="com.user.SignUpDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();

    SignUpDTO loggedInUser = (SignUpDTO) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }

    Connection conn = DBConn.getConnection();
    SignUpDAO signUpDAO = new SignUpDAO(conn);

    loggedInUser = SignUpDAO.getDTOByUserId(loggedInUser.getUserId());

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 마이 페이지 </title>

	<script type="text/javascript">
	
// 	document.addEventListener("DOMContentLoaded", function() {
//         var userPwdElement = document.getElementById("userPwd");
//         var originalUserPwd = userNameElement.innerHTML; // 원래 사용자 이름 저장

//         // 사용자 이름 길이만큼 '*'로 대체
//         var hiddenUserName = "*".repeat(originalUserName.length);
//         userNameElement.innerHTML = hiddenUserPwd;
        
	function confirmDelete(deleteUrl) {
	    var isDelete = confirm("정말 탈퇴하시겠습니까? 탈퇴 후 회원님에 대한 모든 정보는 삭제됩니다.");
	
	    if (isDelete) {
	        // 사용자가 확인하면 링크로 이동
	        window.location.href = deleteUrl;
	    } else {
	        // 사용자가 취소하면 아무 동작 없음
	        // 또는 원하는 다른 동작 수행 가능
	    	return false;
	    }
	}
		
	</script>
	
<style type = "text/css">

body {
	font-size: 9pt;
}

td {
	font-size: 9pt;
}

.txtField {
	font-size: 9pt;
	border : 1px solid;
}

.btn {
	font-size: 9pt;
	background: #e6e6e6;
}


</style>	

</head>
<body>
<br/><br/>

<table width = "500" cellpadding="0" cellspacing="3"
align = "center" bgcolor = "#e4e4e4">
<tr height = "50">
	<td bgcolor = "#ffffff" style = "padding-left: 10pt;">
		<b> 내 정보 </b>
	</td>
</tr>
</table>
<br/>
	
	<form action = "" method = "post" name = "myForm">
<table width = "500" cellpadding="0" cellspacing="0" align = "center">

<tr height = "3"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 아이디 </td>
	<td style = "padding-left: 5px;">
		<%=loggedInUser.getUserId()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 비밀번호</td>
	<td style = "padding-left: 5px;">
		<span id="userPwd"><%=loggedInUser.getUserPwd()%></span>
	</td>
</tr>


	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 이름 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getUserName()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 우편번호 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getSample4_postcode()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 주소 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getSample4_roadAddress()%>&nbsp;<%=loggedInUser.getSample4_jibunAddress()%>&nbsp;<%=loggedInUser.getSample4_extraAddress()%>&nbsp;<%=loggedInUser.getSample4_detailAddress()%> 
	</td>
</tr>
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 집 전화번호 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getTel1()%>-<%=loggedInUser.getTel2()%>-<%=loggedInUser.getTel3()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 휴대전화번호</td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getMobile1()%>-<%=loggedInUser.getMobile2()%>-<%=loggedInUser.getMobile3()%>
	
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 이메일 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getEmail()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 성별</td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getGender()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 생일 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getBirth()%>
	</td>
</tr>
	
	
	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 은행 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getBank()%>
	</td>
</tr>


	<tr height = "2"> <td colspan = "2" bgcolor ="#cccccc"> 
<tr height = "30">
	<td align = "center" width = "100" bgcolor = "#e6e4e6"> 계좌번호 </td>
	<td style = "padding-left: 5px;">
	<%=loggedInUser.getAct()%>
	</td>
</tr>

	<tr height = "3"> <td colspan = "2" bgcolor ="#cccccc"> 
	
<tr height = "35">
	<td align = "center" colspan = "2">
	
	<input type = "hidden"  name = "userId" value = ${dto.userId } />	
	<!-- 학번과 이름을 위에서 주석처리하고 가려놓으면 학번과 이름이 고정됨.
	하지만 dto엔 반드시 4개의 데이터가 들어가야하기 때문에 여기서 hidden으로 감춰놓으면 된다. -->
	<input type = "button" class = "btn" value = " 수정하기 " 
	onclick = "location='<%=cp%>/Function/userUpdate.jsp';" >

	<input type = "button" class ="btn" value = " 회원탈퇴 " 
	onclick = "return confirmDelete('<%=cp%>/project/userWithDrawal.do?userId=<%=loggedInUser.getUserId()%>')">
	
<!-- <input type = "button" class ="btn" value = " 회원탈퇴 "  -->
<%-- 	onclick = "return confirmDelete('<%=cp%>/user/userWithDrawal.do?userId=<%=loggedInUser.getUserId()%>')"> --%>
	</td>
</tr>

	</table>
	
	</form>
</body>
</html>