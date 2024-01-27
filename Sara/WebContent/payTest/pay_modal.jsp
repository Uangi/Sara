<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/common/pay_modal.css">
</head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    
    <script>
    $(".btn_payment").click(function() {
    	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
    		
    	  	IMP.init("imp01368228");	
    	  	//결제시 전달되는 정보
    		IMP.request_pay({
    				    pg : 'inicis', 
    				    pay_method : 'card',
    				    merchant_uid : 'merchant_' + new Date().getTime(),
    				    name : '구찌가방',
    				    amount : 1234,
    				    buyer_email : 'jyp423@siot.do',
    				    buyer_name : '박진영',
    				    buyer_tel : '010-1234-5678',
    				    buyer_addr : '서울특별시 강남구 삼성동',
    				    buyer_postcode : '123-456'
    				}, function(rsp) {
    					var result = '';
    				    if ( rsp.success ) {
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
    				    if(result=='0') {
    				    	location.href= $.getContextPath()+"/Cart/Success";
    				    }
    				    alert(msg);
    				});
    			}
    
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기@</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>