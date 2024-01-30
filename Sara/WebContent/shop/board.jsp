<%@page import="com.user.SignUpDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title> D E T A I L </title>



<style>
 
dl {
    display: flex;
    justify-content: space-between;
    text-align: center;
  }

  dt {
    flex: 1;
  }


 .submitBtn {
        border: none;
        outline: none;
        background: transparent;
       
    }

    .submitBtn:hover {
        border: 1px double #000;
        background: transparent;
        color: #000; 
    }






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
    
    
    
    
    .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .star {
            font-size: 24px;
            color: #ccc;
            cursor: pointer;
            transition: color 0.3s;
        }

        .star:hover,
        .star.checked {
            color: #f8d42e; /* 선택된 별의 색상 */
        }

        .inputField {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        .submitBtn {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
    
    
    
    
    </style>


<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/list.css"/>

<script type="text/javascript">

	
let selectedRating = 0;

function rateStar(rating) {
    selectedRating = rating;
    updateStars();
}

// function updateStars() {
//     const stars = document.querySelectorAll('.star');
//     stars.forEach((star, index) >= {
//         star.classList.toggle('checked', index < selectedRating);
//     });
// }

function submitReview() {
    const name = document.querySelector('[name="name"]').value;
    const product = document.querySelector('[name="product"]').value;
    const date = document.querySelector('[name="date"]').value;
    const size = document.querySelector('[name="size"]').value;
    const content = document.querySelector('[name="content"]').value;

    // Here you can send the review data (including rating) to the server using AJAX or any other method.
    console.log("Name:", name);
    console.log("Product:", product);
    console.log("Date:", date);
    console.log("Size:", size);
    console.log("Content:", content);
    console.log("Rating:", selectedRating);

    document.querySelector('[name="name"]').value = "";
    document.querySelector('[name="product"]').value = "";
    document.querySelector('[name="date"]').value = "";
    document.querySelector('[name="size"]').value = "";
    document.querySelector('[name="content"]').value = "";

    // Reset the star ratings
    selectedRating = 0;
    updateStars();
}
</script>

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
//     request.setAttribute("totalPrice", total.toFixed(2));
}
  
 function sendIt() {
	 
	 var f = document.myForm;
	 
	 f.action = "<%=cp%>/project/board_ok.do";
	 f.submit();

}
 

 function logout() {
     // 현재 카테고리와 페이지 정보 가져오기
     var category = '<%= category %>';
     var currentPage = '<%= request.getParameter("pageNum") %>';

     // 카테고리와 페이지 정보를 포함한 로그아웃 URL 구성
     var logoutURL = '<%=cp%>/user/logout.do?category=' + category + '&pageNum=' + currentPage;

     // 로그아웃 URL로 리다이렉트
     location = logoutURL;
 }
 
 // 장바구니 담기

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
 
 // 장바구니 보기

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
	
function requestPay(){
	
	var f = document.myForm;
	
	
	f.action="<%=cp%>/payment/charge.do";
    f.submit();	
		
	}


</script>

</head>

<body onload="calculateTotal();">

<div id="temp" style="padding: 100px;" >

<div style="margin-left: 1200px; ">

 <c:choose>
        <c:when test="${empty loggedInUser}">
            <input type="button" value="&nbsp; LOGIN &nbsp;" class="btn3" onclick="location='<%=cp%>/user/login.do';" align="middle"/>
        </c:when>
        <c:otherwise>
            <input type="button" value="&nbsp; LOGOUT &nbsp;" class="btn3" onclick="logout();" align="middle"/>
        </c:otherwise>
    </c:choose>

<input type="button" value="&nbsp; MY PAGE &nbsp;" class="btn3"
			onclick="location='<%=cp%>/user/myPage.do';" 
			 align="middle"/>	

<input type="button" value="&nbsp; CART &nbsp;" class="btn3"
			onclick="location='<%=cp%>/shoppingcart/basket.do';" 
			 align="middle"/>

</div><br/>


<div style="display: flex; justify-content: space-between; align-items:top: ;">





<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.11:8080/Sara/imageSara/사라찐누끼.png" width="300" align="right" style="padding-left: 50px;"></a><br/>




<div id="cate" style=" padding-right: 35px; padding-top: 80px;">





<input type="button" value="&nbsp; O U T E R &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Outer';" 
			 align="middle"/>

<input type="button" value="&nbsp; T O P &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Top';"  
			 align="middle"/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Bottoms';"
			 align="middle"/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Bags';" 
			 align="middle"/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Shoes';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn3"
			onclick="location='<%=cp%>/product/category.do?category=Accessories';" 
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










<form action=""  method="post" name="myForm">
<table width="1200" border="1" cellpadding="3" cellspacing="3"
bordercolor="#000" style="margin: auto;">
<tr height="30">
<td style="padding-left: 20px; font-size: 18px; font-family: 'Constantia', sans-serif;">
 &nbsp;P r o d u c t s &nbsp;'&nbsp; D e t a i l 
</td>
</tr>
</table>
<br/><br/>


<div id="det"style="display: flex;
 align-items: center; margin-left: 500px;" >

<div>
<img src="${imagePath}/${saveFileName }" width="400px" align="left" >
</div>


<div width="1300" border = "0" cellpadding = "0" cellspacing = "0" align = "center" style="margin-left: 80px;">



<table width="500px;">

<input type="hidden" name="productNum" value="${dto.productNum }">

<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> P R O D U C T S ' &nbsp; N A M E : </b> ${dto.productName }
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> H I T S ' &nbsp; C O U N T :  </b> ${dto.hitCount }
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> R E V I E W &nbsp; S C O R E :  </b> ${average }
    </td>
</tr>



<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> C A T E G O R I Z E :  </b> ${dto.category }
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> F O W A R D I N G &nbsp; I N F O :  </b> 결제 이후 1년후 도착
    </td>
</tr>


<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> Q U A N T I T Y :  </b>  ${dto.quantity }
    </td>
</tr>
  <input type="hidden" name="qty" value="${dto.quantity}">

<tr>
    <td style="margin: auto;"></td>
    <td style="border-left: none; padding-left: 40px;" width="500" height="50">
        <b> P R I C E : </b> ${dto.price } &nbsp;<b>원</b>
         <input type="hidden" name="price" value="${dto.price}">
    </td>
</tr>

</table>




<table>
<tr>
	<td style="margin: auto;">
	</td>
	<td style=" border-left: none; padding-left: 22px; padding-top: 30px; " width="500" height="50" align="center">
		
		<button type="button" class="btn" onclick="requestPay();" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> B U Y &nbsp; I T  </button>
		
		<button type="button" class="btn" onclick="basketSendIt();" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> C A R T </button>
		
		<button type="button" class="btn" onclick="basketView();" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> W I S H L I S T </button>
		
	</td>
</tr>
</table>
</form>


</div>


</div>



<table border="1" cellpadding="0" cellspacing="0" style="margin: auto; width: 1200px; height: 1px; margin-top: 80px;">
<tr >
<td></td>
</tr>
</table>


<table align="center" style="text-align: center;">
<tr>
<td>
</td>
</tr>
</table>


<table align="center" style="text-align: center;">
<tr>
<td>

<br/><br/><br/><br/><br/><br/>


<table width="800" border = "0" cellpadding = "0" cellspacing = "0" align = "center">


<tr>
	<td >

	<video autoplay muted loop style="width: 800px; height: auto;">
   
    <source src="<%=cp%>/imageSara/123456.mp4" type="video/mp4">
         Your browser does not support the video tag.
     <br/><br/>   
  	</video>
	
	</td>
</tr>


</table>

<table width="800" border = "0" cellpadding = "0" cellspacing = "0" align = "center">

<tr>
<td>

<br/><br/><br/><br/><br/><br/>


<관리자가 올린사진 올라갈부분><br/>

{dto.saveFileName}
<br/><br/><br/><br/><br/><br/>

</td>
</tr>


</table>







<table width="800" border = "0" cellpadding = "0" cellspacing = "0" align = "center">


<tr>
	<td >

	<div>
<img src="http://192.168.16.11:8080/Sara/imageSara/주의주의사항.png" width="800px" align="left" >
</div>
	
	</td>
</tr>





</td>
</tr>
</table>




<br/>
<br/>
<br/>

<table border="1" cellpadding="0" cellspacing="0" style="margin: auto; width: 1200px; height: 1px;">

<tr >
<td></td>
</tr>
</table>
<br/>


<table width="1200" border="1" cellpadding="3" cellspacing="3"
bordercolor="#000" style="margin: auto; ">
<tr height="30">
<td style="padding-left: 20px; font-size: 15px; font-family: 'Constantia', sans-serif;">
 W R I T E &nbsp;&nbsp; R E V I E W  
</td>
</tr>
</table>
<br/><br/>



<c:choose>
	<c:when test="${empty sessionScope.loggedInUser.userId }">
	
	<table style="margin: auto;" >
	<tr>
	<td>
	로그인 시 리뷰작성이 가능합니다.
	</td>
	</tr>
	</table>
	</c:when>
</c:choose>



<div style="display: flex; width: 1000px; margin-left: 320px; margin-right: 400px;">

    <div>
        <img src="http://192.168.16.2:8080/Sara/imageSara/5410833cd4c1075018bff9ece0038ab6.jpg" width="400px" height="550px">
    </div>

    <table width="300" cellpadding="0" cellspacing="0" align="right" style="margin-right:50px;">

        <tr>
            <td style="border-left: none; " align="right" width="80" height="20">
                <b>N A M E &nbsp;</b>
                <input type="text" name="name" style="outline-width: 1px; background: #fff; color: #000; margin-top: 20px;"><br/>
            </td>
        </tr>
        
        <tr>
            <td style="border-left: none; " align="right" width="80" height="20">
                <b>D A T E &nbsp;</b>
                <input type="text" name="date" style="outline-width: 1px; background: #fff; color: #000;"><br/>
            </td>
        </tr>
        <tr>
            <td style="border-left: none; " align="right" width="80" height="20">
                <b>S I Z E &nbsp;</b>
                <input type="text" name="size" style="outline-width: 1px; background: #fff; color: #000;"><br/>
                
            </td>
        </tr>

        <tr>
            <td style="border-left: none; " align="right" width="80" height="20">                
     
            
                <textarea class="inputField" name="content" placeholder="포토리뷰 작성 시 적립금 500원을 드립니다." 
                style="outline-width: 1px; outline-style:solid; margin-top:10px; font-family:나눔고딕;
                 text-align: left; width: 170px; background: #fff; color: #000;"></textarea>
            </td>
        </tr>

        <tr>
            <td style="border-left: none; " width="50">
                <b style="margin-left: 240px;"> R A T I N G </b>
                <div class="rating" id="rating" style="margin-left: 235px;">
                    <span  class="star" onclick="rateStar(1)">★</span>
                    <span class="star" onclick="rateStar(2)">★</span>
                    <span class="star" onclick="rateStar(3)">★</span>
                    <span class="star" onclick="rateStar(4)">★</span>
                    <span class="star" onclick="rateStar(5)">★</span>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div align="right" class="rating" id="rating">
                    <input type="button" class="submitBtn" onclick="submitReview()" value="&nbsp; Submit Review &nbsp;"
                            style="outline:none; outline-width:1px; font-size: 18px; margin-left: 235px;
                             font-family: 'Constantia', sans-serif; color: #000; background: transparent;"/>
                </div>
            </td>
        </tr>

    </table>
    <div>
        <img src="http://192.168.16.11:8080/Sara/imageSara/032c702d2d48333e2d11edfea27f032d.jpg"
         width="200px" height="200px"style="padding: 30px; padding-top: 50px;">
        <img src="http://192.168.16.11:8080/Sara/imageSara/032c702d2d48333e2d11edfea27f032d.jpg" 
        width="200px" height="200px"style="padding: 30px; padding-top: 20px;" >
        </div>

</div>


<div>


<table border="1" cellpadding="0" cellspacing="0" style="margin: auto; width: 1200px; height: 1px; margin-top: 80px;">
<tr >
<td></td>
</tr>
</table>



<div  style="width: 1720px;">
	
	<div  style="width: 1720px;" align = "center">
		R E V I E W &nbsp;&nbsp; L I S T
	</div>
	
	
	<div  style="width: 1720px;">
		<div  style="width: 1720px; padding: 20px; " >
			<form action="" name="searchForm" method="post" style="padding-right: 30px;">
				<select name="searchKey" class="selectField" style="border: none; outline: none;">
					<option value="subject">product</option>
					<option value="name">name</option>
					<option value="content">content</option>
				</select>
				<input type="text" name="searchValue" class="textField"/>
				<input type="button" value=" search " class="btn3"  
				onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent">
			</form>		
		</div>
			
	</div>
	
	
	<div id="tem"> 


<table style="width: 800px; text-align: center; outline-style:groove; ; outline-width: 1px;">




  <tr>
    <th style="width: 80px; font-weight: lighter;">NO.</th>
    <th style="width: 200px; font-weight: lighter;">PRODUCT</th>
    <th style="width: 80px; font-weight: lighter;">NAME</th>
    <th style="width: 80px; font-weight: lighter;">DATE</th>
    <th style="width: 80px; font-weight: lighter;">HIT.</th>
  </tr>
	
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
			
	</div>
</c:forEach>



 </table>




<div id="footer"  style="height:25px; width: 800px; text-align: center; outline-style: groove; outline-width: 1px;">

	<div colspan = "5" align = "center">
	
	<c:if test = "${dataCount != 0 }">
		${pageIndexList }	
	</c:if>
	
	<c:if test = "${dataCount == 0 }">
		등록된 게시물이 없습니다.
	</c:if>

</div>

</div>


</div>







</div>









<br/><br/><br/><br/>
<br/><br/><br/><br/>

<div id="mit" style="display: flex; justify-content: space-between; align-items: center;">

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
			 align="middle" style="text-align: left; background: "/><br/>

 
 
 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-top: 300px;" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 </div>

</body>
</html>