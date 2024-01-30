<%@ page import="com.user.SignUpDTO" %>
<%@ page import="com.user.SignUpDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.DBConn" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();

    SignUpDTO loggedInUser = (SignUpDTO) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }

    Connection conn = DBConn.getConnection();
    SignUpDAO signUpDAO = new SignUpDAO(conn);

    loggedInUser = signUpDAO.getDTOByUserId(loggedInUser.getUserId());

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>내 정보 수정 </title>
    <script type="text/javascript" src="<%=cp%>/Function/js/addr.js"></script>	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
<br /><br /><br /><br />
<a href="<%=cp%>/product/shop.do" style="display: block; text-align: center;">
    <img alt="sara" src="./sara.png" style="width: 150px; margin: auto;" />
</a>


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
<script type="text/javascript">

function togglePasswordVisibility() {	// 비밀번호 보기
    var passwordInput = document.getElementById("pwd");
    // Toggle the password input type
    passwordInput.type = (passwordInput.type == "password") ? "text" : "password";
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
</script>

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
	 border: none; outline: none;"><span style="color: red;">* 가 들어간 곳은 수정할 수 없습니다.</span>
	</td>
</tr>
</table>

<form action="<%=cp%>/project/userUpdate.do" name = "myForm" method="post">

  		<input type="hidden" name="userId" value="<%=loggedInUser.getUserId()%>"/>
        <input type="hidden" name="userName" value="<%=loggedInUser.getUserName()%>"/>
        <input type="hidden" name="gender" value="<%=loggedInUser.getGender()%>"/>
        <input type="hidden" name="birth" value="<%=loggedInUser.getBirth()%>"/>
        
        
<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">

<tr>
		
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
    
        <b><span style="color: red;">*&nbsp;</span>I D  :</b>
        <%=loggedInUser.getUserId()%>
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;"></span>P W :</b>
        
        <input type="password" name="userPwd" value = "<%=loggedInUser.getUserId()%>" style="border: none; outline: none; background: #fff; color: #000;" size="20px" >
        <div class="password_info" onclick="togglePasswordVisibility()" required>
                                    <em class="how_secure" id="secureLevel"></em>
                                    <button type="button" class="btn_show hide">👁️ </button>
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b>P W :</b>
        
        <input type="password" name="userPwd2" placeholder =" 패스워드 일치 여부 확인"
        style="border: none; outline: none; background: #fff; color: #000;" size="20px">
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="userPwd3" value=" 패스워드확인" onclick ="pwdChecked();" style="color: #000;" required/>
        패스워드 확인 
    </td>
</tr>

<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;">*&nbsp;</span>N A M E :</b>
        <%=loggedInUser.getUserName()%>
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b><span style="color: red;"></span>A D D R E S S :</b>
        <input type="text" id="sample4_postcode" name ="sample4_postcode"  value = "<%=loggedInUser.getSample4_postcode()%>" 
        style="border: none; outline: none; background: #fff; color: #000;" required>
        
        <button type="button" onclick="sample4_execDaumPostcode();" style="
            outline-width: 1px ;  background: #fff; color: #000;">우편번호 검색</button>
<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
    
    	<b>A D D 1 :</b>           
        <input type="text" id="sample4_roadAddress"  name ="sample4_roadAddress"  value = "<%=loggedInUser.getSample4_roadAddress()%>" 
        style="border: none; outline: none; background: #fff; color: #000;" required>
        
        <input type="text" id="sample4_jibunAddress"  name ="sample4_jibunAddress"  value = "<%=loggedInUser.getSample4_jibunAddress()%>" 
        style="border: none; outline: none; background: #fff; color: #000;" required>
        <span id="guide" style="color:#999;display:none"></span>
<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">   
    
    	<b>A D D 2 :</b>     
        <input type="text" id="sample4_detailAddress"  name ="sample4_detailAddress"  value = "<%=loggedInUser.getSample4_detailAddress()%>" 
        style="border: none; outline: none; background: #fff; color: #000;" required>
        
        <input type="text" id="sample4_extraAddress"  name ="sample4_extraAddress"  value = "<%=loggedInUser.getSample4_extraAddress()%>" 
        style="border: none; outline: none; background: #fff; color: #000;" required>
    </td>
</tr>


<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>T E L :</b>&nbsp;&nbsp;&nbsp;
        <select name = "tel1" style="border: none; outline: none; background: #fff; color: #000; padding-left: 3px;" required>
						<option selected="selected"><%=loggedInUser.getTel1()%></option>
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
        <input type="text" name="tel2" onkeypress="onlyNum();" size="4"  value = "<%=loggedInUser.getTel2()%>"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" required>
        &nbsp;-&nbsp;
        <input type="text" name="tel3" onkeypress="onlyNum();" size="4"  value = "<%=loggedInUser.getTel3()%>"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" required >
    </td>
</tr>


<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b>P H O N E :</b>&nbsp;&nbsp;
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
						<option selected="selected"><%=loggedInUser.getMobile1()%></option>
						<option>010</option>
						<option>011</option>
						<option>012</option>
						<option>013</option>
						<option>014</option>
						<option>001</option>
						<option>002</option>
						<option>007</option>
		</select>
					 - <input type="text" name="mobile2" size="4" value = "<%=loggedInUser.getMobile2()%>"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" required> - 
					<input type="text" name="mobile3" size="4" value = "<%=loggedInUser.getMobile3()%>"
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;" required></td>
			</tr>
			&nbsp;&nbsp;
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <span style="color: red;">*&nbsp;</span><b>E M A I L :</b>
        <%=loggedInUser.getEmail()%>
    </td>
</tr>

</table>
</div>

<div id = join2>


<table>

<tr>
	<td colspan="2" width="535" style ="text-align: right; padding-bottom: 5px; padding-top: 20px; 
	color: #000; font-size: 14px; overflow: hidden; border: none; outline: none;">
	<br/></td>
</tr>

</table>


<table bordercolor="#000" border="1" cellpadding="0" cellspacing="0"
			style="color: #000; font-size: 13px; overflow: hidden;">


<tr>
	
    <td style="margin: auto;"></td>
    <td colspan="2" align="left" style="border-left: none; padding-left: 40px;" width="540" height="50">
	
	<span style="color: red;">*&nbsp;</span><b>G E N D E R :</b>
	<%=loggedInUser.getGender()%>	
	</td>
</tr>	


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <span style="color: red;">*&nbsp;</span><b>B I R T H :</b>
        <%=loggedInUser.getBirth()%>
    </td>
</tr>



<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 40px;" width="500" height="50" >
        <b><span style="color: red;">*&nbsp;</span>B A N K :</b>&nbsp;&nbsp;
        <select name = "bank" style="border: none; outline: none; background: #fff; color: #000;">
						<option selected="selected"><%=loggedInUser.getBank()%></option>
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
        <input type="text" name="act" value ="<%=loggedInUser.getAct()%>" onkeypress="onlyNum();" size="30" 
        style="border: none; outline: none; background: #fff; color: #000; text-align: center;">
     </td>
</tr>


</table>


</div>

<div id = "butt">

<table>
<tr>
<td style="margin: auto;"></td>
    <td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">


<input type="submit" class="btn" value=" M O D I F Y"  style="background: #fff; color: #000;"> &nbsp;
<input type="button" class="btn" value=" C A N C L E"  style="background: #fff; color: #000;" onclick="javascript:location.href='<%=cp%>/product/shop.do';" />
  
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