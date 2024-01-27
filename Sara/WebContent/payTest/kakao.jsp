<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.kakaopay"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
  integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
				 // alert(resp.tid); //결제 고유 번호
				var box = resp.next_redirect_pc_url;
				//window.open(box); // 새창 열기
				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});

let index = {
		init:function(){
	        $("#btn-kakaopay").on("click", ()=>{ // function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
				this.kakaopay();
			});
		},

	  // 카카오페이 결제
		kakaopay: {
  function() {
    // kakaopay 객체 안에 있는 함수 정의

    $.ajax({
      url: "kakaopay", // 서버로 요청을 보낼 URL
      dataType: "json" // 서버에서 받아올 데이터 타입을 JSON으로 지정
    }).done(function(resp) {
      // Ajax 요청이 성공했을 때 실행되는 함수
      if (resp.status === 500) {
        alert("카카오페이 결제를 실패하였습니다.");
      } else {
        // 카카오페이 결제 성공 시
        // alert(resp.tid); // 결제 고유 번호 (주석 처리된 부분)
        var box = resp.next_redirect_pc_url;
        // window.open(box); // 새 창 열기 (주석 처리된 부분)
        location.href = box; // 현재 창에서 URL로 이동
      }
    }).fail(function(error) {
      // Ajax 요청이 실패했을 때 실행되는 함수
      alert(JSON.stringify(error));
    });
  },
}

index.init(); // index 객체의 init() 함수 호출
</script>
</head>
<body>
<button id="btn-kakaopay" class="btn btn-primary">카카오페이
<img src="./image/payment_icon_yellow_medium.png"></button>
</body>
</html>