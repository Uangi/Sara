// 내용의 값의 빈공백을 trim(앞/뒤)


String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};

// E-Mail 검사
function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 한글 필터링
function isValidKorean(data){
     // UTF-8 코드 중 AC00부터 D7A3 값이지 검사
	var format = /^[\uac00-\ud7a3]*$/g;
    if (data.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 날짜 검사
function isValidDate(year, month, day) {
	var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

     if(year%4==0 && year%100 !=0 || year%400==0)
       days[1]=29;
     else
       days[1]=28;

     if(month < 1 || month > 12)
       return false;

     if(day > days[month-1] || day < 1)
       return false;
     return true;
}

	function idCheck() {

		var f = document.myForm;
			
		if(f.userId2.checked){
		
		if (!f.userId.value) {
				
				alert("아이디를 입력하세요");
				f.userId2.checked = false;
				f.userId.focus();
				return;

			}
		
		if (f.userId.value.length<8){
			
			alert("8자리이상 입력하세요");
			f.userId2.checked = false;
			f.userId.value = "";
			f.userId.focus();
			return;
	
		}
		
		  var specialCharacters = /[!@#$%^&*(),.?":{}|<>]/;
			
		  if (specialCharacters.test(f.userId.value)) {
              alert("특수문자를 제외해주세요");
              f.userId.value = "";
              f.userId2.checked = false; // 체크박스 해제
              f.userId.focus();
              return;
          }
		  
		   var onlyAlphabets = /^[a-zA-Z]+$/;
	        if (onlyAlphabets.test(f.userId.value)) {
	            alert("영문으로만 구성되어 있습니다. 다른 문자도 포함시켜주세요.");
	            f.userId2.checked = false; // 체크박스 해제
	            f.userId.focus();
	            return;
	        }
	        
	        var onlyNumbers = /^[0-9]+$/;
	        if (onlyNumbers.test(f.userId.value)) {
	            alert("숫자로만 구성되어 있습니다. 다른 문자도 포함시켜주세요.");
	            f.userId2.checked = false; // 체크박스 해제
	            f.userId.focus();
	            return;
	        }
	        alert("사용가능한 아이디입니다.");
			
		}
	}
	
	function sendIt() {

		var f = document.myForm;
		
			if(!f.userId2.checked){
		
 			alert("가입가능한 아이디인지 확인해주세요");
			f.userId2.focus();
			return;

			}if(!f.userPwd3.checked ){
				
			alert("패스워드 중복확인을 확인해주세요 ");
			f.userPwd.focus();
			return;
						
			}if(!f.userName.value ){
				
			alert("이름을 입력해주세요");
			f.userName.focus();
			return;							
			}
		
			if(!f.mobile1.value || !f.mobile2.value || !f.mobile3.value ){
			alert("휴대폰 번호를 입력해주세요");
			f.mobile1.focus();
			return;							
			}
			
			if(!f.email.value){
			alert("이메일을 입력해주세요");
			f.email.focus();
			return;							
			}
		
			if(!f.bank.value || !f.act.value ){
			alert("환불계좌를 입력해주세요");
			f.act.focus();
			return;							
			}
			
			f.action= "<%=cp%>/project/userCreated_ok.jsp";
    		f.submit();
	
	}
		
	function pwdChecked(){
		
		var f = document.myForm;
		
		if(!f.userPwd.value || !f.userPwd2.value ){
		
			alert("패스워드를 확인해주세요");
			
			f.userPwd.focus();
			 f.userPwd3.checked = false;
			return;			
		}
	
		if(f.userPwd.value != f.userPwd2.value ){
		
		alert("패스워드를 확인해주세요");
			
			f.userPwd2.focus();
			f.userPwd3.checked = false;
			return;			
		}
		alert("패스워드 이상 없어요!!");
	
	}
	
	function login(){
		
		var f = document.myForm;
		
			if(!f.userId.value){
 			alert("아이디를 입력해주세요");
			f.userId.focus();
			return;
			}
			
			if(!f.userPwd.value){
 			alert("비밀번호를 입력해주세요");
			f.userPwd.focus();
			return;
			}
			
			f.action="<%=cp%>/project/login_ok.do";
    		f.submit();
			
	}
	
		function idChecked(){
		
		var f = document.myForm;
			
			f.action="<%=cp%>/project/idcheked_ok.do";
    		f.submit();		
	}
	
	
	
