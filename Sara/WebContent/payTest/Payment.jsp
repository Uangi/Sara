<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	
<script>
// IMP.init("imp01368228");

// function requestPay() {
// 	  IMP.request_pay({
// 	    pg: "html5_inicis",
// 	    pay_method: "phone",
// 	    merchant_uid: "test_lrrmn16c",
// 	    name: "테스트 결제",
// 	    amount: 666,
// 	    buyer_tel: "010-0000-0000",
// 	  });
// 	}
function iamport(){

    var flag = $("#flag").val();
    var principalId = $("#principalId").val();
    var name = $("#name").val();
    var phone = $("#phone").val();
    var email = $("#email").val();
    var postcode = $("#postcode").val();
    var address = $("#address").val() + " " + $("#detailAddress").val();

    var productName;
    var productId = $("#productId").val();
    var detailName = $("#productName").val();
    var cartName = $("#cartName").val();
    var amount = $("#amount").val();
    var price = $("#total-price").text();


    //가맹점 식별코드
    IMP.init("imp01368228");
    IMP.request_pay({
        pg : 'kcp',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : productName,
        amount : 1444,
//         buyer_email : email,
//         buyer_name : name,
//         buyer_tel : phone,
//         buyer_addr : address,
//         buyer_postcode : postcode
    }
</script>

</head>
<body>

<button onclick="requestPay()">결제하기</button>

</body>
</html>