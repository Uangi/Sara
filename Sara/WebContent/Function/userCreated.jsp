<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title> JOIN US </title>
<script type="text/javascript" src="<%=cp%>/Function/js/addr.js"></script>	

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">



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
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="200px;" ></a><br/><br/>
</div>

<div id = "join1">

<table>
<tr>
	<td colspan="2" width="535" style ="text-align: right; padding-bottom: 5px; 
	color: #000; font-size: 14px; overflow: hidden; border: none; outline: none;">*필수입력사항
	<br/>
	</td>
	</tr>
</table>


<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">

<tr>
	
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>I D :</b>
        <input type="text" id="id" placeholder=" 영문/숫자 만 입력 가능 "
        style="border: none; outline: none; background: #fff; color: #000;" size="20px">
        &nbsp;
        <button type="button" onclick="checkDuplicate()" 
        style=" outline-width: 1px ; background: #fff; color: #000;">아이디 확인</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="inj" value="실명 인증가입" onclick="sendIt();" style="color: #000;"/>
        &nbsp;실명인증가입 
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>P W :</b>
        <input type="password" name="pwd" placeholder=" 4자리 이상 입력 가능" style="border: none; outline: none; background: #fff; color: #000;" size="20px">
        <button type="button" onclick="checkDuplicate()" style="
            outline-width: 1px ; background: #fff; color: #000;">패스워드 확인</button>
            
    </td>
</tr>





<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>P W :</b>
        <input type="password" name="pwd2" placeholder=" 패스워드 일치 여부 확인"
        style="border: none; outline: none; background: #fff; color: #000;" size="20px">
		<button type="button" onclick="checkDuplicate()" style="
            outline-width: 1px ; background: #fff; color: #000;">확인</button>&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="inj2" value=" 패스워드확인완료" onclick="sendIt();" style="color: #000;"/>
        패스워드 확인 완료 
    </td>
</tr>

<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>N A M E :</b>
        <input type="text" name="name" style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>


<!-- <tr> -->
<!--     <td style="margin: auto;"></td> -->
<!--     <td style="border-left: none; padding-left: 40px;" width="500" height="50"> -->

<div>
<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>A D D R E S S :</b>
        <input type="text" id="sample4_postcode" name ="sample4_postcode"  placeholder= " 우편번호" style="border: none; outline: none; background: #fff; color: #000;">
        
        <input type="button" onclick="sample4_execDaumPostcode();"  style="
            outline-width: 1px ;  background: #fff; color: #000;" value = "우편번호 검색"/>
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
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>T E L :</b>&nbsp;&nbsp;&nbsp;
        <select style="border: none; outline: none; background: #fff; color: #000; padding-left: 3px;" >
						<option selected="selected"></option>
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
        <input type="text" name="tel1" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center; ">
        &nbsp;-&nbsp;
        <input type="text" name="tel2" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" >
    </td>
</tr>


<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>P H O N E :</b>&nbsp;&nbsp;
        <select style="border: none; outline: none; background: #fff; color: #000; padding-left: 3px;">
						<option selected="selected"></option>
						<option>SKT</option>
						<option>SKT 알뜰폰</option>
						<option>LGU+</option>
						<option>LGU+ 알뜰폰</option>
						<option>KT</option>
						<option>KT 알뜰폰</option>
		</select>	
					
		<select style="border: none; outline: none; background: #fff; color: #000; padding-left: 6px;">
						<option selected="selected"></option>
						<option>010</option>
						<option>011</option>
						<option>012</option>
						<option>013</option>
						<option>014</option>
						<option>001</option>
						<option>002</option>
						<option>007</option>
		</select>
			&nbsp;-&nbsp;
        <input type="text" name="phn1" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;">
        &nbsp;-&nbsp;
        <input type="text" name="phn2" onkeypress="onlyNum();" size="4" placeholder="****"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" >
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>E M A I L :</b>
        <input type="text" name="email" placeholder=" ex) Examplefff@example.com" size="30" style="border: none; outline: none; background: #fff; color: #000;">
        
        <button type="button" onclick="checkDuplicate()" style="
            outline-width: 1px ; background: #fff; color: #000;">이메일 중복확인</button>
    </td>
</tr>


</table>


</div>

<div id = join2>


<table>

<tr>
	<td colspan="2" width="535" style ="text-align: right; padding-bottom: 5px; padding-top: 20px; 
	color: #000; font-size: 14px; overflow: hidden; border: none; outline: none;">*추가입력정보
	<br/></td>
</tr>

</table>


<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">


<tr>
	
    <td style="margin: auto;"></td>
    <td colspan="2" align="center" style="border-left: none; " width="540" height="50">
	
	<input type="radio" name="r1" checked="checked"><b>남자&nbsp;&nbsp;&nbsp;&nbsp;</b>
	<input type="radio" name="r1"> <b>여자
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
        <input type="text" name="bir" placeholder=" ex) 2024-01-01"style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>


<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>B A N K :</b>&nbsp;&nbsp;
        <select style="border: none; outline: none; background: #fff; color: #000;">
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
        <input type="text" name="tel1" onkeypress="onlyNum();" size="30" 
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;">
      
      	<button type="button" onclick="checkDuplicate()" style="
            outline-width: 1px ; background: #fff; color: #000;">계좌 확인</button>
      
      
     </td>
</tr>

</table>

</div>


<div id = "butt">

<table>
<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">

<input type="button" class="btn" value=" J O I N " onclick="sendIt();" style="background: #fff; color: #000;"/> &nbsp;
<input type="reset" value=" R E S E T " onclick="document.myForm.id.focus();"  style="background: #fff; color: #000;"/> &nbsp;
<input type="button" class="btn" value=" C A N C L E"  style="background: #fff; color: #000;" onclick="javascript:location.href='<%=cp%>/batttmnn/jsp/list.jsp';" />

  
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
		<button type="button" class="btn" onclick="sendIt();" style="border: none; outline: none;"> L O G I N &nbsp; ? </button>
		<br/>
		<br/>
		<button type="button" class="btn" onclick="sendIt();" style="border: none; outline: none;"> F O R G O T &nbsp; &nbsp;P W &nbsp;? </button>
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
<img src="http://192.168.16.11:8080/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 13px;"></a><br/>			 
			 
			 
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

</body>
</html>