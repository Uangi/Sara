<%@page import="com.basket.BasketDTO"%>
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
<title> 장바구니 페이지 </title>

<!-- 결제 모듈 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>


<!-- 		결제 @@@@@@@@@@@@@@@@@@@@-->
<button onclick="requestPay()">진짜 결제하기</button>
<script type="text/javascript">
	IMP.init("imp14397622");	
	
	let productName = '${dto.productName }';
	let price = '${dto.price}';
	
	
	function requestPay() {
	console.log('함수 시작 출력 '); 
	
	//결제시 전달되는 정보
	IMP.request_pay({
		    pg : 'html5_inicis', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : productName,
		    amount : price,
		    buyer_tel : '010-1234-5678',
// 		    @@@@@@@@@@@@@@@@@
		}, function(rsp) {
			var result = '';
			
			// 결제 응답 처리 함수 체크
			console.log(rsp);
			
			// 결제 성공
		    if ( rsp.success ) {
				console.log("결제 성공");
				
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        result ='0';
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result ='1';
		    }
		});
console.log('함수 맨 끝 출력'); 
	}
	
	function calculateTotal() {
		
	    var quantity = parseInt(document.getElementById("quantity").value);
	    var price =  parseFloat("${dto.price}"); // 가격을 실수형으로 변환
	    var total = quantity * price;
	    document.getElementById("totalPrice").innerHTML = total.toFixed(2);
//	     request.setAttribute("totalPrice", total.toFixed(2));
	}
</script>
</head>
<body onload="calculateTotal();">

<br/>
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 30px; margin: auto;" width="600">
<tr>
<td>
${userName }님의 장바구니 내역
</td>
</tr>
</table>
<br/>

<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
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
배송비
</td>
<td style="text-align: center;">
가격
</td>
</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
</table>

<c:forEach var="dto" items="${lists}" >
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
<td style="text-align: center; width: 100px;">
${dto.num}
</td>
<td style="text-align: center; width: 100px;">
<img src="${imagePath}/${dto.saveFileName}"  width="30px" height="30px">
</td>
<td style="text-align: center; width: 100px;">
${dto.productName }
</td >
<td style="text-align: center; width: 100px;">
${dto.price}
</td>
<td style="text-align: center; width: 100px;">
${dto.quantity }
</td>
<td style="text-align: center; width: 100px;">
무료
</td>
<td style="text-align: center; width: 100px;">
${dto.totalprice }
</td>

</tr>


</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
</table>
</c:forEach>

<div class="bbsCreated_bottomLine" align = "center">
			<dl>
				<dt> 합계2 : ${totalPrice}zz</dt>
				<dd>
				
				</dd>
			</dl>			
		</div>
		
<table style="margin: auto;" border="0">
<tr>
	<td colspan="4" align="center">
	<c:if test="${dataCount!=0 }">
	${pageIndexList }
	</c:if>
	<c:if test="${dataCount==0 }">
	등록된 품목이 없습니다. 
	</c:if>
	</td>
</tr>
</table>




</body>
</html>