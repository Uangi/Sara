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
<title>Insert title here</title>

<script type="text/javascript">
function sendIt() {
	
	var f = document.myForm;
	
	if(f.addr.value=="직접입력"){
			
		f.addr1.value="";
		f.mobile1.value="";
		return;
	
	}	
	if(f.addr.value=="기본배송지"){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/payment/charge_ok.do";
		f.submit();
	 
	}
	
	if(f.addr.value=="최근배송지"){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/payment/charge_ok.do";
		f.submit();
	 
	}
	
	
	
}




</script>
</head>
<body>
<br/>

<form action="" name="myForm" method="post">
<table border="0" cellpadding="0" cellspacing="0" style="margin:auto; width: 550px; height: 50px; font-size: 30px;">
<tr>
<td style="text-align: left;">주&nbsp;&nbsp; 문&nbsp;&nbsp;결&nbsp;&nbsp; 제</td>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td bgcolor="#000000" height="3"></td></tr>
<tr>
</tr>
</table>
<br/>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px; height: 30px;">
<tr>
<td>
<input type="radio" name="addr" value="기본배송지" checked="checked" onclick="sendIt();"/>기본배송지
<input type="radio" name="addr" value="최근배송지" onclick="sendIt();"/>최근배송지
<input type="radio" name="addr" value="직접입력" onclick="sendIt();"/>직접입력
<input type="hidden" name="imagePath" value="${imagePath }">
<input type="hidden" name="productName" value="${productName }">
<input type="hidden" name="price" value="${price }">
<input type="hidden" name="saveFileName" value="${saveFileName}">
<input type="hidden" name="qty" value="${qty }">
</td> 
</tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td>주소</td>
<td><input type="text" name="addr1"  value="${dto.sample4_roadAddrss }" style="width: 300px;"></td>
</tr>
<tr>
<td>연락처1</td>
<td><input type="text" name="mobile1" value="${dto.mobile1 }"></td>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="1"></td></tr>
<tr>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px; height: 30px;">
<tr>
<td>
<input type="checkbox" name="add" />연락처 추가입력
</td> 
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td>연락처2</td>
<td><input type="text" name="phon2"></td>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>
<br/>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px;">
<tr>
<td>
<select name="message" style="width: 350px;">
<option selected="selected" >배송 시 요청사항 선택하기</option>
<option value="직접 수령하겠습니다.">직접 수령하겠습니다</option>
<option value="문앞에 놓아주세요">문앞에 놓아주세요</option>
<option value="경비실에 맡겨주세요" >경비실에 맡겨주세요</option>
<option value="배송전 휴대폰으로 연락주세요">배송전 휴대폰으로 연락주세요</option>
</select>
</td>
</tr>
</table>
<br/>
<table border="0" cellpadding="0" cellspacing="0" style="margin:auto; width: 550px; height: 50px; font-size: 30px;">
<tr>
<td style="text-align: left; font-size: 25px;">주&nbsp;&nbsp; 문&nbsp;&nbsp;상&nbsp;&nbsp; 품</td>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td bgcolor="#000000" height="3"></td></tr>
<tr>
</tr>
</table>
<br/>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;width: 550px;">
<tr>
<td style="text-align: center;">
번호 
</td>
<td style="text-align: center;">
이미지
</td>
<td style="text-align: center;">
상품명
</td >
<td style="text-align: center;">
판매가
</td>
<td style="text-align: center;">
수량
</td>
<td style="text-align: center;">
합계금액
</td>
</tr>
</table>
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" style="margin: auto; width: 550px;">
<tr>
<td style="text-align: center;">
1
</td>
<td style="text-align: center;">
<img src="${imagePath}/${saveFileName}"  width="30px" height="30px">
</td>
<td style="text-align: center;">
${productName }
</td >
<td style="text-align: center;">
${price }
</td>
<td style="text-align: center;">
${qty }
</td>
<td style="text-align: center;">
${total }
</td>
<td style="text-align: center; ">
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width:550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" style="margin: auto; width:550px;">
<tr>  
<td>
<span style="margin-left: 500px;"><input type="button"  value="결제" name="" onclick=""></span>

</td></tr>
</table>





</form>

</body>
</html>