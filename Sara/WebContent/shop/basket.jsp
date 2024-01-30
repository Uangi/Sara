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
<title> C A R T </title>

<style>


        .btn3 {
        border: none;
        outline: none;
        background: transparent;
       
    }

    .btn3:hover {
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
    
    
    </style>


<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/list.css"/>

<script type="text/javascript">


function searchData(){

		var f = document.searchForm;
		f.action ="<%=cp%>/sara/product.do";		
		f.submit();
	}
	
function searchCategory(){

	var f = document.searchForm;
	f.action ="<%=cp%>/sara/product.do";		
	f.submit();
}
	
	
function addToCart(productId) {
    var addToCart = confirm("장바구니에 추가하시겠습니까?");
    if (addToCart) {
        // 장바구니 추가 코드 
     
    }
}

function addToWishlist(productId) {
    var addToWishlist = confirm("위시리스트에 추가하시겠습니까?");
    if (addToWishlist) {
        // 위시리스트 추가코드 
       
    }
}	
	
</script>



</head>
<body>

<div id="temp" style="padding: 100px;" >

<div style="margin-left: 1200px; ">


<input type="button" value="&nbsp; MY PAGE &nbsp;" class="btn3"
			onclick="location='<%=cp%>/user/myPage.do';" 
			 align="middle"/>	

</div><br/>


<div style="display: flex; justify-content: space-between; align-items:top: ;">





<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.11:8080/Sara/imageSara/사라찐누끼.png" width="300" align="right" style="padding-left: 50px;"></a><br/>




<div id="cate" style=" padding-right: 35px; padding-top: 80px;">


<input type="button" value="&nbsp; O U T E R &nbsp;" class="btn3"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle"/>

<input type="button" value="&nbsp; T O P &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/bags.jsp';" 
			 align="middle"/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/shoes.jsp';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn3"

			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle"/>

<input type="button" value="&nbsp; S A L E&nbsp;" class="btn3"

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
				<input type="button" value=" search " class="btn3"  
				onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent"><br/>
						
		</form>	
	</div>
  </div>
</div>
<div>


<span style="margin-left: 1240px;"><input type="button" value="결제" onclick="location='<%=cp%>/payment/charge2.do';"/></span>


</div>
<div id="cartlist"  style="margin-left: 380px; margin-right: 50px;">

<table style="margin-left: 185px; text-align: center; border: 1px solid; width: 50%;">


<tr height="100" style="justify-content: space-between; text-align: center; outline-style: solid; outline-width: 1px; " >

<td width="150" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>no.</b>
</td>

&nbsp;<td width="200" colspan="2" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>&nbsp;product</b>
</td>

<td width="150" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>price</b>
</td>

<td width="150" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>quantity</b>
</td>

<td width="150" style="border-left:1px; border-right:1px;  background-color: transparent; color: #000; ">
<b>total</b>
</td>


</tr>


  <c:forEach var="dto" items="${lists}">
    <tr style="height:25px; text-align: center; outline-width: 1px; 
     justify-content: space-between; text-align: center; outline-style: solid; outline-width: 1px; ">
      <td>${dto.num}</td>
      <td style="text-align: center; width: 100px;">
<img src="${imagePath}/${dto.saveFileName}"  width="150px" height="150px">
</td>
      <td>${dto.productName}</td>
      <td>${dto.price}</td>
      <td>${dto.qty}</td>
      <td>${dto.total}</td>
    </tr>
  </c:forEach>
  
  
 </table>
<table border="0" style="width: 820px; margin-left: 150px;" >
<tr>
<td style="text-align: center;">
	<c:if test = "${dataCount != 0 }">
		${pageIndexList }	
	</c:if>
	
	<c:if test = "${dataCount == 0 }">
		등록된 게시물이 없습니다.
	</c:if>
</td>
</tr>
</table>

</div>

</div>


</div>


</div>

<br/><br/><br/><br/>
<br/><br/><br/><br/>

<div id="mit" style="display: flex;
justify-content: space-between; align-items: center;">

<div id="mit1" style="padding: 200px; padding-bottom: 200px;" >

<input type="button" value="&nbsp; T O P &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"  style="font-size: 18px;"/><br/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/bags.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/shoes.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; S A L E .&nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/sale.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>				 
			 
<input type="button" value="&nbsp; M Y&nbsp;&nbsp; P A G E&nbsp;"  class="btn3"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; H O M E &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
<input type="button" value="&nbsp; A B O U T&nbsp;&nbsp; U S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/sara/acc.jsp';" 
			 align="middle" style="font-size: 18px;"/><br/>
			 
			 
			 <br/><br/><br/>
			 
			 
			 
<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 13px;"></a><br/>			 
			 
			 
			 <br/>
			 
 
<input type="button" 
	value="&nbsp;&nbsp;4 t h &nbsp;&nbsp;F L O O R &nbsp;,&nbsp; 1 2 4 &nbsp;,&nbsp;
&nbsp;&nbsp;T E H E R A N &nbsp;-&nbsp; R O &nbsp;,&nbsp; G A N G N A M &nbsp;-&nbsp; G U &nbsp;,&nbsp;
&nbsp;&nbsp;S E O U L &nbsp;,&nbsp; R E P U B L I C &nbsp;&nbsp;O F&nbsp;&nbsp; K O R E A" class="btn3"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle" style="text-align: left;"/><br/>

 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-top: 300px;" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 
 </div>

</body>
</html>