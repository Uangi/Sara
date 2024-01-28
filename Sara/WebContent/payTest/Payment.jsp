<%@page import="com.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

ProductDTO dto = new ProductDTO();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> kg 이니시스 결제 </title>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<button onclick="requestPay()">결제하기</button>

<script>
IMP.init("imp번호");

function requestPay() {
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid: "test_lrxbfgbq",
    name: "테스트 결제",
    amount: 100,
    buyer_tel: "010-0000-0000",
  });
}
</script>

</script>

</head>
<body>
<%System.out.println(dto.getTprice()); %>
<input type = "button" onclick="requestPay()" value = "결제하기">
<button type = "button" onclick="requestPay()">결제하기22</button>


</body>
</html>