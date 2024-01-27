<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>


<script>
IMP.init("imp14397622");

function requestPay() {
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "phone",	// 결제 수단
    merchant_uid: "test_lrw467v6",
    name: "테스트 결제",	// 상품명
    amount: 423,	// 결제 가격
    buyer_tel: "010-0000-0000", 	// 주문자 휴대폰 번호
  });
}
</script>

</head>
<body>

<button onclick="requestPay()">결제하기</button>

</body>
</html>