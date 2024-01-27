// 구매자 정보
const user_email = response.req_user_email
const username = response.req_username

// 결제창 함수 넣어주기
const buyButton = document.getElementById('payment')
buyButton.setAttribute('onclick', `kakaoPay('${user_email}', '${username}')`)

var IMP = window.IMP;

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;

function kakaoPay(useremail, username) {
	
    if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
        if (localStorage.getItem("access")) { // 회원만 결제 가능
            const emoticonName = document.getElementById('title').innerText

            IMP.init("imp01368228"); // 가맹점 식별코드
            IMP.request_pay({
                pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
                pay_method: 'card', // 결제 방식
                merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
                name: '상품명', // 제품명
                amount: 608, // 가격
                //구매자 정보 ↓
                buyer_email: `${useremail}`,
                buyer_name: `${username}`,
                 buyer_tel : '010-1234-5678',
                 buyer_addr : '서울특별시 강남구 삼성동',
                 buyer_postcode : '123-456'
           },function(data){
		if(data.success){
			var msg = "결제 완료";
            msg += '고유ID : ' + data.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
            msg += '// 상점 거래ID : ' + data.merchant_uid;
            msg += '// 결제 금액 : ' + data.paid_amount;
            msg += '// 카드 승인번호 : ' + data.apply_num;
            
            $.ajax({
            	type : 'post',
            	url : '/paySuccess',
            	data : {"ID" : data.buyer_email, "amount" : data.paid_amount},
            });
        }else{
        	var msg = "결제 실패"
        	msg += "에러 내용" + rsp.error_msg;
        }
		alert(msg);
		document.location.href="/video/list";
	});
}
}
}