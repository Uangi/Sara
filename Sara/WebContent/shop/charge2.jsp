<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 request.setCharacterEncoding("UTF-8");
 String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 결제2 </title>


<style>
        .btn2 {
        border: none;
        outline: none;
        background: transparent;
       
    }

    .btn2:hover {
        border: 1px double #000;
        background: transparent;
        color: #000; 
    }
    
    
     .wishlist-button {
        border: none;
        outline: none;
        background: transparent;
    }

    .wishlist-button img {
        width: 10; /* 이미지 크기 조절 */
        height: 10;
    }
    
    
     .cart-button {
        border: none;
        outline: none;
        background: transparent;
    }

    .cart-button img {
        width: 10; /* 이미지 크기 조절 */
        height: 10;
    }
    
    
    .inputField {
        height: 150px; 
       
    }
    
    
    
    
    input[type="radio"] {
	margin-bottom: 6px;
}

input[type="radio"]:checked {
	border: 1px solid #fff;

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
	border: 1px solid #000;
	border-radius: 50%;
	outline: 1px solid #fff;
	background-color: #fff; 
	margin-right: 5px;
	vertical-align: middle;
}

input[type="radio"][name="r1"]:checked {
    background-color: #000;
    border-color: #000; 
    width: 13px;
	height: 13px;
}


label {
	display: flex;
	align-items: center;
}  
    
    </style>



<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>
<script type="text/javascript" src="<%=cp%>/Function/js/addr.js"></script>	

<!-- 결제 모듈 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>


<script type="text/javascript">
function sendIt() {
	
	var f = document.myForm;
	
	if(f.addr.value=="직접입력"){
			
		f.addr1.value="";
		f.mobile1.value="";
		return;
	
	}	
	if(f.addr.value=="기본배송지"){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/payment/charge2.do";
		f.submit();
	 
	}
	
	if(f.addr.value=="최근배송지"){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/payment/charge2.do";
		f.submit();
	 
	}
	
	
}
</script>


</head>
<body>

<div id="temp" style="padding: 100px;" >

<div style="margin-left: 1300px; background: transparent; outline: none; border: none; ">

<input type="button" value="&nbsp; LOGIN &nbsp;" class="btn2"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle"/>

<input type="button" value="&nbsp; MY PAGE &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"/>	

<input type="button" value="&nbsp; CART &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle"/>

</div><br/>


<div style="display: flex; justify-content: space-between; align-items:top: ;">





<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.11:8080/Sara/imageSara/사라찐누끼.png" width="300" align="right" style="padding-left: 180px;"></a><br/>




<div id="cate" style=" padding-right: 35px; padding-top: 80px; background: transparent; outline: none; border: none;">





<input type="button" value="&nbsp; O U T E R &nbsp;" class="btn2"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle"/>

<input type="button" value="&nbsp; T O P &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bags.jsp';" 
			 align="middle"/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/shoes.jsp';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn2"

			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle"/>
			 
<input type="button" value="&nbsp; S A L E&nbsp;" class="btn2"

			onclick="location='<%=cp%>/sara/sale.jsp';" 
			 align="middle"/>			 


</div>


<div id="ser" style=" padding-right: 80px; padding-top: 50px;" >
	<form action="" name="searchForm" method="post">
	
	   <br/>
	   
		<img src="http://192.168.16.11:8080/Sara/imageSara/서치콘누끼.png"
			width="30px" align="middle" style="margin-bottom: 16px;"/>
									
			<select name="searchKey" class="selectField" style="border: none; outline: none;" >
				<option value="product">products</option>
				<option value="price">price</option>
			</select>
				<input type="text" name="searchValue" class="textField"/>
				<input type="button" value=" search " class="btn2"  
				onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent"><br/>
						
		</form>	
	</div>
  </div>
</div>

<br/><br/>

<table width="1300" border="1" cellpadding="3" cellspacing="3"bordercolor="#000" style="margin-left: 360px;">
<tr>
<td><br/>
<b style="padding-left: 400px; align-content:center; font-size: 36px; text-align:center;
 font-family: 'Constantia', sans-serif;">&nbsp;&nbsp; &nbsp; O R D E R &nbsp; P A Y M E N T </b><br/><br/>
</td></tr>


<tr height="30">
<td style="padding-left: 22px; font-size: 18px; font-family: 'Constantia', sans-serif;">
 &nbsp; O r d e r  &nbsp; L i s t
</td>
</tr>
</table>
<br/>




<div id="orderlist"  style="margin-left: 360px; margin-right: 50px;">


<table width="1300" border="0" cellpadding="3" cellspacing="3"bordercolor="#000">


<tr>


<tr height="100" style="justify-content: space-between; text-align: center; outline-style: solid; outline-width: 1px; " >

<td width="200" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>no.</b>
</td>

<td width="200" colspan="2" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>image</b>
</td>

<!-- <td width="150" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; "> -->
<!-- <b>productName</b> -->
<!-- </td> -->

<td width="200" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>price</b>
</td>

<td width="200" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>quantity</b>
</td>

<td width="200" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>total</b>
</td>

</tr>
</div>


<c:forEach var="dto" items="${lists}" >

<tr style="height:25px; text-align: center; outline-width: 1px; 
     justify-content: space-between; text-align: center; outline-style: solid; outline-width: 1px; ">
<td style="text-align: center; width: 100px;">
${dto.rnum}
</td>

<td style="text-align: center; width: 100px; margin-left : 80px;">
<img src="${imagePath}/${dto.saveFileName}"  width="150px" height="150px">
</td >

<td style="text-align: center; width: 100px;">
${dto.productName}
</td>

<td style="text-align: center; width: 100px;">
${dto.price}
</td>

<td style="text-align: center; width: 100px;">
${dto.qty}
</td>

<td style="text-align: center; width: 100px;">
${dto.total}
</td>

</tr>



<!-- <table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;"> -->
<!-- <tr> -->
<!-- <td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr> -->

</c:forEach>

<!-- </table> -->

<!-- <table  width="630" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;"> -->
<tr>
<td>
총합계:
</td>
<td style="margin-left: 800px;">
${total}
</td>
</tr>
</table>
<!-- 
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table> -->
<%-- 
<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td>주소</td>
<td><input type="text" name="addr1"  value="${dto.sample4_roadAddress }" style="width: 300px;"></td>
</tr>
<tr>
<td>연락처1</td>
<td><input type="text" name="mobile1" value="${dto.mobile1 }"></td>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="1"></td></tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px; height: 30px;">
<tr>
<td>
<input type="checkbox" name="add" />연락처 추가입력
</td> 
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td>연락처2</td>
<td><input type="text" name="phon2"></td>
</tr>
</table>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto; width: 550px;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>

<br/>

<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px;">
<tr>
<td>
<select name="message" style="width: 350px;">
<option selected="selected" >배송 시 요청사항 선택하기</option>
<option value="직접 수령하겠습니다.">직접 수령하겠습니다</option>
<option value="문앞에 놓아주세요">문앞에 놓아주세요</option>
<option value="경비실에 맡겨주세요" >경비실에 맡겨주세요</option>
<option value="배송전 휴대폰으로 연락주세요">배송전 휴대폰으로 연락주세요</option>
</select>
</td>
</tr>
</table>
<br/>
 --%>

<table width="1300" border="1" cellpadding="3" cellspacing="3" bordercolor="#000" >

<tr height="30">
<td style="padding-left: 20px; font-size: 18px; font-family: 'Constantia', sans-serif;">
 &nbsp;O r d e r  &nbsp;&nbsp; I n f o
</td>
</tr>
</table>
<br/><br/>


<div>


	

<table width="1300" bordercolor="#000" border="1" cellpadding="0" cellspacing="0" style="color: #000; font-size: 13px; overflow: hidden; ">
<tr>
	
   
	
	<td width="500px;" rowspan="7" align="center" style="align:top; ">
	<br/>
       <img src="http://192.168.16.11:8080/Sara/imageSara/56.png"
         width="100px" height="100px">
         <img src="http://192.168.16.11:8080/Sara/imageSara/next.png"
         width="30px" height="30px" style="padding-bottom: 30px;">
        <img src="http://192.168.16.11:8080/Sara/imageSara/5656.png" 
        width="100px" height="100px" >
        <img src="http://192.168.16.11:8080/Sara/imageSara/next.png"
         width="30px" height="30px" style="padding-bottom: 30px;">
        <img src="http://192.168.16.11:8080/Sara/imageSara/12.png" 
        width="100px" height="100px" ><br/><br/><br/>
                
        <!--  <b>상품 금액 : <input type="text" name=" price" style="font-size:18px; text-align: center; border:none; outline: none;"> {$dto.sum} 원<br/><br/></b>
        -->    <b>총 금 액 : <input type="text" name=" price" style="font-size:18px; text-align: center; border:none; outline: none;">{$dto.sum} 원<br/><br/></b>
<!--           <b>배송 요청 사항&nbsp; : &nbsp; &nbsp;<input type="text" name=" price" style="font-size:18px; text-align: center; outline: 1px;"><br/><br/></b> -->
         <b><table  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="margin: auto; width: 550px;"></b>
<tr>
<td align = "center">
<select name="message" style="width: 350px;">
<option selected="selected" >배송 시 요청사항 선택하기</option>
<option value="직접 수령하겠습니다.">직접 수령하겠습니다</option>
<option value="문앞에 놓아주세요">문 앞에 놓아주세요</option>
<option value="경비실에 맡겨주세요" >경비실에 맡겨주세요</option>
<option value="배송전 휴대폰으로 연락주세요">배송 전 휴대폰으로 연락주세요</option>
</select>
<br/><br/>
</td>
</tr>
</table>
         
         
        </td>
        
        
      
        
     <td width="147px;" rowspan="7" align="center" style="outline:1px; background-color: #000;">
     <b onclick="payOrder();" style="color: #fff;">B U Y</b>
     
     
     
	</td>
	
	
	
</tr>



<tr>
    <td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50">
        <b>N A M E :</b>
        <input type="text" name="name" style="border: none; outline: none; background: #fff; color: #000;">
    </td>
</tr>


<tr>
    <td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50">
        <b>A D D R E S S :</b>
        <input type="text" id="sample4_postcode" name ="sample4_postcode"  value = "${dto.sample4_postcode}"  placeholder= " 우편번호" style="border: none; outline: none; background: #fff; color: #000;">
       </td> 
<tr>
    <td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50">
    	<b>A D D 1 :</b>           
        <input type="text" id="sample4_jibunAddress"  name ="sample4_jibunAddress" placeholder="지번주소"
        value="${dto.sample4_roadAddress }" style="border: none; outline: none; background: #fff; color: #000; width: 400px;">
        <span id="guide" style="color:#999;display:none"></span>
<tr>
    <td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50">   
    	<b>A D D 2 :</b>     
        <input type="text" id="sample4_detailAddress"  name ="sample4_detailAddress" placeholder ="상세주소" 
        style="border: none; outline: none; background: #fff; color: #000; width: 400px;">
    </td>
</tr>


<tr>
<td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50" >
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
<td style="margin: auto;
    border-left: none; padding-left: 40px;" width="500" height="50" >
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



</table>





</div>







<br/><br/><br/><br/>
<br/><br/><br/><br/>

<div id="mit" style="display: flex;
justify-content: space-between; align-items: center;">

<div id="mit1" style="padding-bottom: 200px; background: transparent; outline: none; border: none;" >

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
			 
<input type="button" value="&nbsp; S A L E .&nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/sale.jsp';" 
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
			 align="middle" style="text-align: left; background: transparent; outline: none; border: none;"/><br/>

 
 
 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-bottom: 50px;" align="right">
 
 <a href="<%=cp %>/aboutUs.jsp">
<img src="http://192.168.16.11:8080/Sara/imageSara/서명누끼.png" width="250" align="left" 
style=" padding-left: 160px; padding-bottom: 60px;"></a><br/>
 
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 




 
 
 </div>
 
 
 
 



<script type="text/javascript">

	IMP.init("imp14397622");	
	
	let productName = '${productName }';
	let price = '${total}';
	
	function requestPay() {
	console.log('함수 시작 출력 '); 
	
	//결제시 전달되는 정보
	IMP.request_pay({
		    pg : 'html5_inicis', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : productName,
		    amount : price,
		    buyer_tel : '010-1234-5678',
		}, function(rsp) {
			var result = '';
			
			// 결제 응답 처리 함수 체크
			console.log(rsp);
			
			// 결제 성공
		    if ( rsp.success ) {
				console.log("결제 성공");
				
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
		});
console.log('함수 맨 끝 출력'); 
	}
</script>
<table style="margin: auto;" border="0"  width="630">
<tr>
	<td colspan="4" align="center">
	<c:if test="${dataCount!=0 }">
	${pageIndexList }
	</c:if>
	<c:if test="${dataCount==0 }">
	등록된 품목이 없습니다. 
	</c:if>
	</td>
</tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" style="margin: auto; width:550px;">
<tr>  
<td>
<span style="margin-left: 500px;"><input type="button"  value="결제" name="" onclick="requestPay()"></span>

</td></tr>
</table>





</form>

</body>
</html>