<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> J O I N&nbsp;&nbsp; U S </title>

<script type="text/javascript" src="<%=cp%>/Function/js/addr.js"></script>	
<%-- <script type="text/javascript" src="<%=cp%>/Function/js/userCreated.js"></script> --%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
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

		}if(!f.userPwd3.checked){
			
		alert("패스워드 중복확인을 확인해주세요 ");
		f.userPwd.focus();
		return;
					
		}if(!f.userName.value){
			
		alert("이름을 입력해주세요");
		f.userName.focus();
		return;							
		}
	
		if(!f.mobile1.value || !f.mobile2.value || !f.mobile3.value){
		alert("휴대폰 번호를 입력해주세요");
		f.mobile1.focus();
		return;							
		}
		
		if(!f.email.value){
		alert("이메일을 입력해주세요");
		f.email.focus();
		return;							
		}
	
		if(!f.bank.value || !f.act.value){
		alert("환불계좌를 입력해주세요");
		f.act.focus();
		return;							
		}
		
		f.action= "/Sara/project/userCreated_ok.do";
<%-- 		f.action= "<%=cp%>/project/userCreated_ok.jsp"; --%>
		f.submit();

}
	
function pwdChecked(){
	
	var f = document.myForm;
	
	if(!f.userPwd.value || !f.userPwd2.value){
	
		alert("패스워드를 확인해주세요");
		
		f.userPwd.focus();
		 f.userPwd3.checked = false;
		return;			
	}

	if(f.userPwd.value != f.userPwd2.value){
	
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

</script>
<style>
        body {
            
            background-color: #fff; 
                                 
            background-attachment: scroll; 
           
            margin: 0;
            padding: 0;
            
            display: flex;
            justify-content: center;
           
        }
        
        
        
        .btn2 {
        border: none;
        outline: none;
        background: transparent;
       
    }

    .btn2:hover {
        border: 0.5px double #000;
        background: transparent;
        color: #000; 
        
    }
    
    
    button {
    border: none;
    outline: solid;
    background: #fff;
    color: #000;
    outline-width: 1px ;
}
    
    
input[type="radio"] {
	margin-bottom: 6px;
}

input[type="radio"]:checked {
	border: 1px solid #000000;

}

label {
	display: inline-block;
	vertical-align: middle;
}


label b {
	position: relative;
	top: 5px; 
}


input[type="radio"][name="r1"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	width: 14px;
	height: 14px;
	border: 2px solid #fff;
	border-radius: 50%;
	outline: none;
	background-color: #000; 
	margin-right: 5px;
	vertical-align: middle;
}

input[type="radio"][name="r1"]:checked {
    background-color: transparent;
    border-color: #000; 
}



input[type="radio"][name="r2"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	width: 14px;
	height: 14px;
	border: 2px solid #fff;
	border-radius: 50%;
	outline: none;
	background-color: #000; 
	margin-right: 5px;
	vertical-align: middle;
}


input[type="radio"][name="r2"]:checked {
    background-color: transparent; 
    border-color: #000;
}


label {
	display: flex;
	align-items: center;
}  
    

        
</style>


</head>
<body>

<div id = "tot" >
<div id = "signUp" >

<div id = "signUp2" style="margin-left: 205px;">

<div id = "tit">
<a href="<%=cp %>/main.jsp">
<img src="http://192.168.0.10:8081/Sara/imageSara/사라찐누끼.png" width="200px;" ></a><br/><br/>
</div>

<div id = "join1">

<table>
<tr>
	<td colspan="2" width="535" style ="text-align: right; padding-bottom: 5px; 
	color: #000; font-size: 14px; overflow: hidden;
	 border: none; outline: none;"><span style="color: red;">*&nbsp;</span>필수입력사항
	<br/>
	</td>
</tr>
</table>

<form action="<%=cp%>/project/userCreated_ok.do"  name="myForm"  method = "post">
<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">

<tr>
	
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
    
        <b><span style="color: red;">*&nbsp;</span>I D  :</b>
        
<%--         <c:if test="${empty userId  }"> --%>
        <input type="text" id = "id" name = "userId" placeholder=" 영문/숫자 만 입력 가능 "
        style="border: none; outline: none; background: #fff; color: #000;" size="20px">
<%--         </c:if> --%>
        
<%--         <c:if test="${empty userId  }"> --%>
<!-- 		<td> <input type="text" name="userId" class="input1" />  -->
<%-- 		</c:if> --%>
        &nbsp;
<!--         <button type="button" onclick="checkDuplicate()"  -->
<!--         style=" outline-width: 1px ; background: #fff; color: #000;">아이디 확인</button> -->
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="userId2" onclick="idCheck();" style="color: #000;"/>
        &nbsp;가입 가능여부 
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;">*&nbsp;</span>P W :</b>
        
        <input type="password" name="userPwd" placeholder =" 4자리 이상 입력 가능" style="border: none; outline: none; background: #fff; color: #000;" size="20px">
        
<!--         <button type="button" onchange="pwdChecked()" -->
<!--         style="outline-width: 1px ; background: #fff; color: #000;">패스워드 확인</button> -->
            
    </td>
</tr>





<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;">*&nbsp;</span>P W :</b>
        
        <input type="password" name="userPwd2" placeholder =" 패스워드 일치 여부 확인"
        style="border: none; outline: none; background: #fff; color: #000;" size="20px">
        
<!-- 		<button type="button" onclick="checkDuplicate()" style=" -->
<!--             outline-width: 1px ; background: #fff; color: #000;">확인</button>&nbsp; -->
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="userPwd3" value=" 패스워드확인" onclick ="pwdChecked();" style="color: #000;"/>
        패스워드 확인 
    </td>
</tr>





<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;">*&nbsp;</span>N A M E :</b>
        <input type="text" name="userName" class = "input1" style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;">*&nbsp;</span>A D D R E S S :</b>
        <input type="text" id="sample4_postcode" name ="sample4_postcode"  placeholder= " 우편번호" style="border: none; outline: none; background: #fff; color: #000;">
        
        <button type="button" onclick="sample4_execDaumPostcode();" style="
            outline-width: 1px ;  background: #fff; color: #000;">우편번호 검색</button>
<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
    	<b>A D D 1 :</b>           
        <input type="text" id="sample4_roadAddress"  name ="sample4_roadAddress" placeholder="도로명주소" style="border: none; outline: none; background: #fff; color: #000;">
        <input type="text" id="sample4_jibunAddress"  name ="sample4_jibunAddress" placeholder="지번주소" style="border: none; outline: none; background: #fff; color: #000;">
        <span id="guide" style="color:#999;display:none"></span>
<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">   
    	<b>A D D 2 :</b>     
        <input type="text" id="sample4_detailAddress"  name ="sample4_detailAddress" placeholder=" 상세주소" style="border: none; outline: none; background: #fff; color: #000;">
        <input type="text" id="sample4_extraAddress"  name ="sample4_extraAddress" placeholder=" 참고항목" style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>









<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>T E L :</b>&nbsp;&nbsp;&nbsp;
        <select name = "tel1" style="border: none; outline: none; background: #fff; color: #000; padding-left: 3px;" >
						<option selected="selected">지역번호 선택</option>
						<option>02</option>
						<option>031</option>
						<option>032</option>
						<option>033</option>
						<option>041</option>
						<option>042</option>
						<option>043</option>
						<option>051</option>
						<option>052</option>
						<option>053</option>
						<option>054</option>
						<option>055</option>
						<option>061</option>
						<option>062</option>
						<option>063</option>
						<option>064</option>
				</select>
			&nbsp;&nbsp;
        <input type="text" name="tel2" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center; ">
        &nbsp;-&nbsp;
        <input type="text" name="tel3" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" >
    </td>
</tr>


<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b><span style="color: red;">*&nbsp;</span>P H O N E :</b>&nbsp;&nbsp;
        <select name = "xx" style="border: none; outline: none; background: #fff; color: #000; padding-left: 3px;">
						<option selected="selected">통신사 선택</option>
						<option>SKT</option>
						<option>SKT 알뜰폰</option>
						<option>LGU+</option>
						<option>LGU+ 알뜰폰</option>
						<option>KT</option>
						<option>KT 알뜰폰</option>
			</select>	
					
		<select name = "mobile1" style="border: none; outline: none; background: #fff; color: #000; padding-left: 6px;">
						<option selected="selected">010</option>
						<option>010</option>
						<option>011</option>
						<option>012</option>
						<option>013</option>
						<option>014</option>
						<option>001</option>
						<option>002</option>
						<option>007</option>
		</select>
					 - <input type="text" name="mobile2" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;"> - 
					<input type="text" name="mobile3" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;"></td>
			</tr>
			&nbsp;&nbsp;
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>E M A I L :</b>
        <input type="text" name="email" class = "input1" placeholder=" ex) Examplefff@example.com" size="30" style="border: none; outline: none; background: #fff; color: #000;">
        
<!--         <button type="button" onclick="checkDuplicate()" style=" -->
<!--             outline-width: 1px ; background: #fff; color: #000;">이메일 중복확인</button> -->
    </td>
</tr>



</table>


</div>



<div id = join2>


<table>

<tr>
	<td colspan="2" width="535" style ="text-align: right; padding-bottom: 5px; padding-top: 20px; 
	color: #000; font-size: 14px; overflow: hidden; border: none; outline: none;">* 추가입력정보
	<br/></td>
</tr>

</table>


<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">


<tr>
	
    <td style="margin: auto;"></td>
    <td colspan="2" align="center" style="border-left: none; " width="540" height="50">
	
	<b>G E N D E R :</b>
	<input type="radio" name="gender" value="남자"><b>남자&nbsp;&nbsp;&nbsp;&nbsp;</b>
	<input type="radio" name="gender" value="여자"> <b>여자
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;</b> 
	<input type="radio" name="r2" checked="checked"><b>내국인&nbsp;&nbsp;&nbsp;&nbsp;</b>
	<input type="radio" name="r2"> <b>외국인</b>
	
	</td>
</tr>	


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>B I R T H :</b>
        <input type="text" name="birth" class = "input1" placeholder=" ex) 970423" style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>





<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b><span style="color: red;">*&nbsp;</span>B A N K :</b>&nbsp;&nbsp;
        <select name = "bank" style="border: none; outline: none; background: #fff; color: #000;">
						<option selected="selected"></option>
						<option>우리</option>
						<option>국민</option>
						<option>하나</option>
						<option>토스</option>
						<option>카카오</option>
						<option>농협</option>
						<option>신한</option>
						<option>제주</option>
						<option>새마을</option>
						
				</select>
			&nbsp;&nbsp;
        <input type="text" name="act" onkeypress="onlyNum();" size="30" 
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;">
      
<!--       	<button type="button" onclick="checkDuplicate()" style=" -->
<!--             outline-width: 1px ; background: #fff; color: #000;">계좌 확인</button> -->
      
      
     </td>
</tr>


</table>


</div>

<div id = "butt">

<table>
<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">


<input type="button" class="btn" value=" J O I N "  onclick="sendIt();" style="background: #fff; color: #000;"/> &nbsp;</button>
<input type="reset" value=" R E S E T " onclick="document.myForm.id.focus()"  style="background: #fff; color: #000;"/> &nbsp;
<input type="button" class="btn" value=" C A N C L E"  style="background: #fff; color: #000;" onclick="javascript:location.href='<%=cp%>/product/shop.do';" />
<!-- /Sara/project/userCreated_ok.do"; -->
  
     </td>
</tr>

</table>
</div>


<div id = "butt">



<table>

<tr>
	<td style="margin: auto;"></td>
	<td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">
		<br/>
		<br/>
		<button type="button" class="btn" onclick= "" style="border: none; outline: none;"> L O G I N &nbsp; ? </button>
		<br/>
		<br/>
		<button type="button" class="btn" onclick= "" style="border: none; outline: none;"> F O R G O T &nbsp; &nbsp;P W &nbsp;? </button>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>

     </td>
</tr>

</table>
</div>
</div>




<div id="ha" style="display: flex; justify-content: space-between; align-items: center;">

<div id="mit1" style=" padding-bottom: 200px; padding-right:200px; color: #000" >

<input type="button" value="&nbsp; T O P &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"  style="font-size: 18px;"/><br/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bags.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/shoes.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; M Y&nbsp;&nbsp; P A G E&nbsp;"  class="btn2"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; H O M E &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; A B O U T&nbsp;&nbsp; U S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
			 
			 <br/><br/><br/>
			 
			 
			 
<a href="<%=cp %>/main.jsp">
<img src="http://192.168.0.10:8081/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 13px;"></a><br/>			 
			 
			 
			 <br/>
			 
 
<input type="button" 
	value="&nbsp;&nbsp;4 t h &nbsp;&nbsp;F L O O R &nbsp;,&nbsp; 1 2 4 &nbsp;,&nbsp;
&nbsp;&nbsp;T E H E R A N &nbsp;-&nbsp; R O &nbsp;,&nbsp; G A N G N A M &nbsp;-&nbsp; G U &nbsp;,&nbsp;
&nbsp;&nbsp;S E O U L &nbsp;,&nbsp; R E P U B L I C &nbsp;&nbsp;O F&nbsp;&nbsp; K O R E A" class="btn2"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle" style="text-align: left; color: #000"/><br/>

 
 
 </div>
 
 
 <div id="mit2" style="padding-left: 200px; color: #000" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 
</div>
 
 </div>



</div>
</div>
</form>
</body>
</html>