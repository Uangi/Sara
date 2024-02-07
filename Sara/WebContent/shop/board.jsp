<%@ page  contentType="text/html; charset=UTF-8"%>
<%@page import="com.user.SignUpDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
	 String userId = (loggedInUser != null) ? loggedInUser.getUserId() : "";
	 int productNum = Integer.parseInt(request.getParameter("productNum"));
	 String category = request.getParameter("category");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/sara/css/util.js"></script>	
<style type="text/css">

textarea {
	width: 490px;
	height: 150 px;
	resize: none;
	background: #ffffff;
}
</style>

<script type="text/javascript">

function incrementQuantity() {
	
    var quantityInput = document.getElementById("quantity");
    quantityInput.value = parseInt(quantityInput.value) + 1;
    calculateTotal();
  }
  
function decrementQuantity() {
	
    var quantityInput = document.getElementById("quantity");
    if (parseInt(quantityInput.value) > 1) {
      quantityInput.value = parseInt(quantityInput.value) - 1;
      calculateTotal();
    }
  }

function calculateTotal() {
	
    var quantity = parseInt(document.getElementById("quantity").value);
    var price =  parseFloat("${dto.price}"); // 가격을 실수형으로 변환
    var total = quantity * price;
    document.getElementById("totalPrice").innerHTML = total.toFixed(2);
}
  
 function sendIt() {
	 
	 var f = document.myForm;
	 f.action = "<%=cp%>/project/board_ok.do";
	 f.submit();
}
 
 function basketSendIt() {
		 
		 var f = document.myForm;
		 var imagePath = "${imagePath }";
		 var saveFileName = "${saveFileName }";
		 var productNum = "${dto.productNum }";
		 var productName = "${dto.productName }";
		 var price = "${dto.price }";
		 var userId = "<%=userId %>";
		 
		 if (userId === "" || userId === null){
			 alert("로그인을 진행해주세요")
			 return;		 
		 }
		 alert("장바구니에 담겼습니닷")
		 f.action = "<%=cp%>/shoppingcart/basket_ok.do?imagePath=" + imagePath + "&saveFileName=" + saveFileName + 
				 	"&productNum=" + productNum + "&productName=" + productName + "&price=" + price;
		 f.submit();
	}
 
function basketView() {
	
	var f = document.myForm
	var userId = "<%=userId %>";
	 
	 if (userId === "" || userId === null){
		 alert("로그인을 진행해주세요")
		 return;		 
	 }
	 var imagePath = "${imagePath }";
	 f.action = "<%=cp%>/shoppingcart/basket.do";
	 f.submit();
	
}

function reviewSendIt(){
	
	var f = document.myForm;
	f.action="<%=cp%>/detail/board_ok.do";
    f.submit();	
	}
</script>

</head>
<body onload="calculateTotal();">
<br/><br/>

<form action="" method="post" name="myForm" >
<div style="text-align: center;">
<div style="display: inline-block; margin-right: 5px;">
<table border="1" style="margin: auto; width: 350px;" cellpadding="0" cellspacing="0" >
<tr>
<td>
<img src="${imagePath}/${saveFileName }" width="350px" height="345px">
</td>
</tr>
</table>
</div>
<div style="display: inline-block;">
<table border="1" style="margin: auto; width: 350px; height: 350px;" >
<tr>
<td style="text-align: left;">
상품명: ${dto.productName }
</td>
</tr>
<tr>
<td style="text-align: left;">
조회수:${dto.hitCount }
</td>
</tr>
<tr>
<td style="text-align: left;">
리뷰점수:${average }
</td>
</tr>
<tr>
<td style="text-align: left;">
분류: ${dto.category }
</td>
</tr>
<tr>
<td style="text-align: left;">
출고정보: 결제 이후 1년후 도착
</td>
</tr>
<tr>
<td style="text-align: left;">
재고:${dto.quantity }
</td>
</tr>
<tr>
<td style="text-align: left;">
수량선택: 
<input type="button" value="-" onclick="decrementQuantity()">
<input type="text" id="quantity" value="1" readonly style="width: 15px;">
<input type="button" value="+" onclick="incrementQuantity()">
</td>
</tr>
<tr>
<td style="text-align: left;">
금액: <p id="totalPrice"></p> &nbsp;원
</td>
</tr>
<tr >
<td style=" margin: auto;">
<input type="button" value="결제하기" >
<input type="button" value="장바구니담기" onclick="basketSendIt();">
<input type="button" value="장바구니보기" onclick="basketView();">
</td>
</tr>
</table>
</div>
</div>

<br/><br/>
<br/><br/>
<br/><br/>

<table border="1" cellpadding="0" cellspacing="0" style="margin: auto; width: 720px; height: 1px;">
<tr>
<td></td>
</tr>
</table>

<br/><br/>

<table border="1" cellpadding="0" cellspacing="0" style="margin: auto; width: 500px; height: 50px">
<tr>
<td style="text-align: center;">상&nbsp;&nbsp; 품&nbsp;&nbsp;리&nbsp;&nbsp; 뷰</td>
</tr>
</table>
<br/>



<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
	
	<table style="margin: auto;" >
	<tr>
	<td>
	로그인 시 리뷰작성이 가능합니다.
	</td>
	</tr>
	</table>
	</c:when>
<c:otherwise>
<table border="1" cellpadding="0" cellspacing="0" style="width: 500px; margin: auto;">
<tr>
<td>
리뷰 작성
<textarea rows="30" cols="30" name="content" style="height: 30px; width: 300px"></textarea>
</td>
 </tr>
<tr>
<td>
리뷰 점수

<select name="rev">
<option selected="selected">선택</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>


</td>
</tr>
</table>
<table border="0" style="margin: auto;" >
<tr>
<td>
<input type="button" value="등록"  onclick="reviewSendIt();"/>
</td>
</tr>
</table> 			
	</c:otherwise>
</c:choose>
<input type="hidden" name="productNum" value="${dto.productNum }">
<input type="hidden" name="imagePath" value="${imagePath }">
<input type="hidden" name="saveFileName" value="${saveFileName }">
<input type="hidden" name="productName" value="${dto.productName }">

 
<c:forEach var="dto" items="${lists}">
<table width="500" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
<tr>
</tr>
</table>
<table width="500" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" style="margin: auto;">
<tr height="20">
<td width="50%" style="padding: 5px; font-size: 13px;">
<b>아이디:</b> ${dto.userId }     <br/>
<b>작성자:</b> ${dto.userName }   <br/>
작성일: ${dto.created }   <br/>
리뷰점수: ${dto.rev } 
</td>
</tr>
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="1"></td></tr>
<tr>
<td bgcolor="#fff" colspan="2" height="20" valign="top"
style="padding: 5px;">
${dto.content }
</td>
</tr>
<tr>
<td colspan="2" bgcolor="#dbdbdb" height="3"></td></tr>
</table>
</c:forEach>
<table border="1">
<tr>
<td>
</td>
</tr>
</table>

<table style="margin: auto;" border="0">
<tr>
	<td colspan="4" align="center">
	<c:if test="${dataCount!=0 }">
	${pageIndexList }
	</c:if>
	<c:if test="${dataCount==0 }">
	등록된 게시물이 없습니다.
	</c:if>
	</td>
</tr>
</table>
 
 </form>
</body>
</html>