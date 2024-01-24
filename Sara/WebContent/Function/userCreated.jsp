<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회 원 가 입</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/Function/css/userCreated.css" />
<script type="text/javascript" src="<%=cp%>/Function/js/addr.js"></script>	

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>

<br/>
<div id="wrapper">
<table border="1" cellpadding="0" cellspacing="0" class="table-subject">
<tr>
	<td>회&nbsp;원&nbsp;가&nbsp;입</td>
</tr>
</table>
</div>
<br/>


<table class="table-pilsu">
<tr>
	<td><span style="color: red;">*</span>필수입력사항</td>
</tr>
</table>

<form action=""  name="myForm" method = "post">
<div id="wrapper">
<table border="0" cellpadding="0" cellspacing="0"  class="table-content">
<tr>
	<td width="90">아이디<span style="color: red;">*</span></td>

<c:if test="${not empty userId  }">
<td><input type="text" name="userId" value="${userId }" class="input1" /> 
</c:if>
<c:if test="${empty userId  }">
<td><input type="text" name="userId" class="input1" /> 
</c:if>

<input type="checkbox" name="userId2"  style="margin-left:15px;" onclick="idChecked();"
<c:if test="${not empty userId}">checked</c:if> />
<span style="font-size: 12px;">가입가능아이디</span></td>
</tr>
<c:if test="${not empty message  }">

<tr style="margin: auto; height: 15px; ">
	<td></td>
	<td colspan="2"> <span style="font-size: 10px; color: blue ;margin-left: 80px; "><b>${message }</b></span></td>			
</tr>
</c:if>
<tr>
	<td>패스워드<span style="color: red;">*</span></td>
	<td><input type="password" name="userPwd" class="input1" /></td>
</tr>
<tr>
	<td style="font-size: 12px;">패스워드확인<span style="color: red; font-size: 15px;">*</span></td>
	<td><input type="password" name="userPwd2" class="input1" /> 
	<input  type="checkbox" name="userPwd3" style="margin-left: 20px;" onchange ="pwdCheckd();" /><span
	style="font-size: 12px;">패스워드확인</span></td>
</tr>
<tr>
	<td style="font-size: 15px;">이름<span style="color: red; font-size: 15px;">*</span></td>
	<td><input type="text" name="userName" class="input1" /></td>
</tr>
<tr>
	<td style="font-size: 15px;">주소</td>
	<td><input type="text" name="postal" style="width: 70px; height: 23px;">&nbsp;<span
	class="addr"> 우편번호 </span><br /> <span class="addr">기본주소</span><br />
	<input type="text" name="addr1" class="input2" /><br /> 
	<span class="addr">상세주소</span><br /> <input type="text" name="addr2"
	class="input2" /></td>
</tr>


<tr>
	<td width="90">일반전화</td>
	<td><select name="tel1">
		<option value="02">02</option>
		<option value="031">031</option>
		<option value="032">032</option>
		<option value="051">051</option>
		<option value="043">043</option>
		<option value="041">041</option>
		</select> - <input type="text" name="tel2" style="width: 70px;"> - <input
						type="text" name="tel3" style="width: 70px;"></td>
</tr>

<!-- 	우편번호 api  -->
<input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목">


<tr>
	<td width="90">휴대전화<span style="color: red; font-size: 15px;">*</span></td>
	<td><select name="xx">
		<option value="010" selected="selected">통신사 선택</option>
		<option value="KT">KT</option>
		<option value="LG">LG</option>
		<option value="SK">SK</option>
		</select> 
		<select name="mobile1">
		<option value="010" selected="selected">010</option>
		</select> - <input type="text" name="mobile2" style="width: 70px;"> - 
		<input 	type="text" name="mobile3" style="width: 70px;"></td>
</tr>
<tr>
	<td width="90">EMAIL<span style="color: red; font-size: 15px;">*</span></td>
	<td><input type="text" name="email1" class="input1" /></td>
</tr>
</table>
</div>


		<table class="table-pilsu">
			<tr>
				<td>추가입력사항</td>
			</tr>
		</table>

		<div id="wrapper">
			<table border="1" cellpadding="0" cellspacing="0"
				class="table-content">
				<tr>
					<td width="90">성별</td>
					<td><input type="radio" name="gender" value="남자" />남자 <input
						type="radio" name="gender" value="여자" />여자</td>
				</tr>
				<tr>
					<td width="90">생년월일</td>
					<td><input type="text" name="birth" class="input1" /></td>
				</tr>
				<tr>
					<td width="90">가입경로</td>
					<td></td>
				</tr>
				<tr>
					<td width="90">환불계좌<span style="color: red; font-size: 15px;">*</span></td>
					<td><select name="bank">
							<option value="010" selected="selected">은행 선택</option>
							<option value="하나은행">하나은행</option>
							<option value="국민은행">국민은행</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="우리은행">우리은행</option>
							<option value="농협">농협</option>
					</select> <input type="text" name="act"></td>
				</tr>
			</table>
		</div>
		<br />
		<table    style="width: 250px; margin: auto;">
			<tr align="center">
				<td><input type="button" value="회원가입" onclick="sendIt();" >&nbsp; <input
					type="reset" value="다시작성">&nbsp; <input type="button"
					value="로그인화면" onclick="location='<%=cp%>/project/login.do'"></td>
			</tr>
		</table>
</form>
</body>
</html>




