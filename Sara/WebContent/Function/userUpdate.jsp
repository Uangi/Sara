<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 request.setCharacterEncoding("UTF-8");
 String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정 보 수 정</title>
<link rel="stylesheet" type="text/css" 
	href="<%=cp%>/sara/css/userCreated.css" />
<script type="text/javascript" src="<%=cp%>/sara/css/util.js"></script>	

<script type="text/javascript">

// 서버에서 전달된 DTO 값으로 초기화

        var f = document.myForm;
        var tel1Value = "<%= dto.getTel1() %>"; // 서버에서 직접 JSP 코드를 사용하여 값을 가져옴

        var tel1Select = f.tel1;
        for (var i = 0; i < tel1Select.options.length; i++) {
            if (tel1Select.options[i].value === tel1Value) {
                tel1Select.selectedIndex = i;
                break;
            }
        }


</script>




</head>
<body>


<br/>
<div id="wrapper">
<table border="1" cellpadding="0" cellspacing="0" class="table-subject">
<tr>
	<td>정&nbsp;보&nbsp;수&nbsp;정</td>
</tr>
</table>
</div>
<br/>


<form action="" method="post" name="myForm">
<div id="wrapper">
<table border="0" cellpadding="0" cellspacing="0"  class="table-content">
<tr>
	<td width="90">아이디</td>
<td> %{dto.userId } 
</tr>
<tr>
	<td style="font-size: 12px;">현재 패스워드</td>
	<td><input type="password" name="userPwd" class="input1" />
	<input  type="checkbox" name="userPwd3" style="margin-left: 11px;" /><span
	style="font-size: 12px;">기존패스워드확인</span></td>
</tr>
<tr>
	<td style="font-size: 12px;">변경할패스워드</td>
	<td><input type="password" name="userPwd2" class="input1" /> 
</tr>
<tr>
	<td style="font-size: 12px;">확인패스워드</td>
	<td><input type="password" name="userPwd2" class="input1" /> 
	<input  type="checkbox" name="userPwd3" style="margin-left: 11px;" /><span
	style="font-size: 12px;">변경패스워드확인</span></td>
</tr>


<tr>
	<td style="font-size: 15px;">이름<span style="color: red; font-size: 15px;">*</span></td>
	<td><input type="text" name="userName" value="${dto.userName }"  class="input1" /></td>
</tr>
<tr>
	<td style="font-size: 15px;">주소</td>
	<td><input type="text" name="postal" value="${dto.postal}" style="width: 70px; height: 23px;">&nbsp;<span
	class="addr"> 우편번호 </span><br /> <span class="addr">기본주소</span><br />
	<input type="text" name="addr1" value="${dto.addr1 }" class="input2" /><br /> 
	<span class="addr">상세주소</span><br /> <input type="text" name="addr2" value="${dto.addr2 }"
	class="input2" /></td>
</tr>
<tr>
	<td width="90">일반전화</td>
	<td><select name="tel1" >
		<option value="02" >02</option>
		<option value="031">031</option>
		<option value="032">032</option>
		<option value="051">051</option>
		<option value="043">043</option>
		<option value="041">041</option>
		</select> - <input type="text" name="tel2" value="${dto.tel2 }" style="width: 70px;"> - <input
						type="text" value="${dto.tel3 }" name="tel3" style="width: 70px;"></td>
</tr>
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
	<td><input type="text" name="email1" value="${dto.email1 }"  class="input1" /></td>
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
					<td><input type="radio" name="gender" value="${dto.gender }"/>남자 <input
						type="radio" name="gender" value=${dto.gender } />여자</td>
				</tr>
				<tr>
					<td width="90">생년월일</td>
					<td><input type="text" name="birth" ${dto.birth } class="input1" /></td>
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
					</select> <input type="text" name="act" ${dto.act }></td>
				</tr>
			</table>
		</div>
		<br />
		<table    style="width: 250px; margin: auto;">
			<tr align="center">
				<td><input type="button" value="정보수정" onclick="sendIt();" >&nbsp; <input
					value="취소" onclick="location='<%=cp%>/project/login.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>

</body>
</html>