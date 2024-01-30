<%@page import="com.user.SignUpDTO"%>
<%@page import="com.user.SignUpDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();

    SignUpDTO loggedInUser = (SignUpDTO) session.getAttribute("loggedInUser");

    Connection conn = DBConn.getConnection();
    SignUpDAO signupDAO = new SignUpDAO(conn);

    loggedInUser = signupDAO.getDTOByUserId(loggedInUser.getUserId());

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 목록</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/css/list.css"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="<%=cp%>/shop/js/list.js"></script>	
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">

function searchData() {
    var f = document.searchForm;
    f.action ="<%=cp%>/product/category2.do";        
    f.submit();
}
</script>
<script>
function highData() {
   
	var f = document.getElementById("myForm");
    var sort = 'high';
    var category = f.category.value;
    f.action = "<%=cp%>/product/category.do?category="+category+"&sort="+sort;   
    f.submit();
    
}

</script>



<style>
	
	.swiper-slide-prev {
    opacity: 0;
}


.swiper-slide-active img {
    opacity: 1;
}

 .swiper-container {
            width: 100%; /* 전체 화면 너비로 설정 */
            max-width: 700px; /* 최대 폭 설정 (선택사항) */
            margin: 0 auto; /* 가운데 정렬 */
            position: relative; /* 상대 위치 설정 */
        }

        /* 이미지 슬라이드의 스타일 조정 */
        .swiper-slide img {
            width: 100%; /* 슬라이드 너비에 맞게 이미지 크기 조정 */
            height: auto;
        }

</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var swiper = new Swiper('.swiper-container', {
        // 기존 스와이퍼 설정을 여기에 추가
        direction: 'horizontal',
        slidesPerView: 3, /* 슬라이드 3개씩 보이도록 변경 */
        spaceBetween: 50,
        loop: true,
        centeredSlides: false, /* 중앙 정렬 해제 */
        autoplay: {
            delay: 1500,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        // 첫 슬라이드로 시작하도록 설정
        initialSlide: 0,
        on: {
            slideChangeTransitionEnd: function () {
                swiper.wrapper.transitionEnd(function () {
                    swiper.wrapper.css({transform: 'translate3d(0px, 0, 0)'});
                });
            },
        },
    });
});
</script>

</head>
<body>

<div id="temp" style="padding: 100px;" >

<div id  style="margin-left: 1300px; ">

<%

    if (loggedInUser != null) {
%>
        <!-- 로그인한 경우 -->
        
        <input type="button" value="&nbsp; LOGOUT &nbsp;" class="btn2"
               onclick="logout()" 
               align="middle"/>
        
        <input type="button" value="&nbsp; MY PAGE &nbsp;" class="btn2"
               onclick="location='<%=cp%>/user/myPage.do';" 
               align="middle"/>
<%
    } else {
%>
        <!-- 로그인하지 않은 경우 -->
        <input type="button" value="&nbsp; LOGIN &nbsp;" class="btn2"
               onclick="location='<%=cp%>/user/login.do';" 
               align="middle"/>
<%
    }
%>

<input type="button" value="&nbsp; CART &nbsp;" class="btn2"
			onclick="location='<%=cp%>/sara/bottoms.jsp';" 
			 align="middle"/>

</div><br/>


<div style="display: flex; justify-content: space-between; align-items:top: ;">





<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.5//Sara/imageSara/사라찐누끼.png" width="300" align="right" style="padding-left: 50px;"></a><br/>




<div id="cate" style=" padding-right: 80px; padding-top: 80px;">





<input type="button" value="&nbsp; O U T E R &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Outer';" 
			 align="middle"/>

<input type="button" value="&nbsp; T O P &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Top';" 
			 align="middle"/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Bottoms';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Bags';" 
			 align="middle"/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Shoes';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/category.do?category=Accessories';" 
			 align="middle"/>


</div>



<div id="ser" style=" padding-right: 80px; padding-top: 50px;" >
<form action="" name="searchForm" method="post">
	   <td>
	   <br/>
	   
		<img src="http://192.168.16.5:8080//Sara/imageSara/서치콘누끼.png"
			width="30" align="middle" style="margin-bottom: 16px;"/>
									
			<select name="searchKey" class="selectField" style="border: none; outline: none;" >
				<option value="productName">products</option>
				<option value="price">price</option>
			</select>
				<input type="text" name="searchValue" class="textField"/>
				<input type="button" value=" search " class="btn2"  
				onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent"><br/>
           		   <input type="hidden" name="search2" value="1"/>
           
							
			</td>					
		</form>	
	</div>
  </div>
</div>







<div>



<form action="<%=cp%>/product/category.do" name="myForm" id = "myForm" method="post">
<table width="900" border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
<td>
<input type="button"   name="high" onclick="highData();"/>높은 가격순
<input type="checkbox"  name="low" onclick="lowData();"/>낮은 가격순
<input type="checkbox" name="hitcount" onclick="hitData() ;"/>조회수 순
</td>
</tr>
</table>
</form>

<table width="900" border="1" cellpadding="3" cellspacing="3"
bordercolor="#000" style="margin: auto;">
<tr height="40">
	<td style="padding-left: 20px; font-size: 18px; font-family: 'Constantia', sans-serif;">
	 WEEKLY BEST
	</td>
</tr>
</table>
<br/><br/>



<table width="1300" border = "0" cellpadding = "0" cellspacing = "0" align = "center">
<tr>
	<td align = "right" colspan = "4">
<c:set var="totalPage" value="${requestScope.totalPage}" />
  <c:if test="${loggedInUser != null && 'manager' eq loggedInUser.getUserId()}">
	<input type = "button" value = "제품 등록" 
	onclick = "location='<%=cp %>/product/productCreated.do';"/>
	</c:if>
	<input type = "button" value = "메인 페이지" 
	onclick = "location='<%=cp %>/shop.jsp';"/>
	</td>
</tr>
<div class="swiper-container">
  <div class="swiper-wrapper">
    <c:forEach var="dto" items="${lists }" varStatus="status">
      <div class="swiper-slide">
        <a href="<%=cp %>/detail/board.do?productNum=${dto.productNum }&imagePath=${imagePath}&saveFileName=${dto.saveFileName}">  
          <img src="${imagePath}/${dto.saveFileName}" width="100%" />
        </a>
      </div>
    </c:forEach>
  </div>
  <!-- 페이징 버튼 -->
  <div class="swiper-pagination"></div>
</div>
</table>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>

<table width="1200" border = "0" cellpadding = "0" cellspacing = "0" align = "center">
<c:set var="n" value="0"/>

<%-- <c:choose> --%>
<%-- <c:when test="${param.high == 'on'}"> --%>
<!--         높은 가격순 체크박스가 체크된 경우 -->
<%--         <c:forEach var="dto" items="${highlists}"> --%>
<!--             highlists를 사용하여 높은 가격순으로 출력 -->
<%--             <c:if test="${n==0}"> --%>
<!-- 		<tr bgcolor="#FFFFFF"> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${n!=0&&n%3==0 }"> --%>
<!-- 		</tr><tr bgcolor="#FFFFFF" > -->
<%-- 	</c:if> --%>
<!-- 	<td align="center" width="250"> -->
	
<%-- 		 <a href="<%=cp %>/detail/board.do?productNum=${dto.productNum }&imagePath=${imagePath}&saveFileName=${dto.saveFileName}"> --%>
<%-- 			<img src="${imagePath}/${dto.saveFileName}" style="width: 350px;height: 300px;" /></a> --%>
<!-- 			<div style="text-align: center;"> -->
<%-- 				${dto.productNum}&nbsp; --%>
<%-- 				  <c:if test="${loggedInUser != null && 'manager' eq loggedInUser.getUserId()}"> --%>
<%-- 				<a href="${deletePath}?productNum=${dto.productNum}&pageNum=${pageNum}&category=${dto.category}">제품삭제</a> --%>
<%-- 				</c:if> --%>
<!-- 			</div>	 -->
<%-- 			상품명 : ${dto.productName},  상품가격 : ${dto.price} --%>
					 
<!-- 			<img src="http://192.168.16.5:8080/Sara/imageSara/쇼핑백누끼.png" -->
<%-- 			 onclick="addToCart('${dto.saveFileName}')" alt="cart" width="15" > --%>
			  
<!--             <img src="http://192.168.16.5:8080/Sara/imageSara/저장누끼.png" -->
<%--             onclick="addToWishlist('${dto.saveFileName}')" alt="wishlist" width="12">  --%>
            
<%--             조회수:${dto.hitCount} --%>
            
            
            
<%-- 			종류: ${dto.category}, 상품 설명: ${dto.productSubject}, 재고: ${dto.quantity}개, 조회수: ${dto.hitCount} --%>

	</td>
<c:set var="n" value="${n+1}"/>	
            
            <!-- 여기에 출력 내용을 작성 -->
<!--     가격순 체크박스가 체크되지 않은 경우 -->
<c:forEach var="dto" items="${highlists}">
	<c:if test="${n==0}">
		<tr bgcolor="#FFFFFF">
	</c:if>
	<c:if test="${n!=0&&n%3==0 }">
		</tr><tr bgcolor="#FFFFFF" >
	</c:if>
	<td align="center" width="250">
	
		 <a href="<%=cp %>/detail/board.do?productNum=${dto.productNum }&imagePath=${imagePath}&saveFileName=${dto.saveFileName}">
			<img src="${imagePath}/${dto.saveFileName}" style="width: 350px;height: 300px;" /></a>
			<div style="text-align: center;">
				${dto.productNum}&nbsp;
				  <c:if test="${loggedInUser != null && 'manager' eq loggedInUser.getUserId()}">
				<a href="${deletePath}?productNum=${dto.productNum}&pageNum=${pageNum}&category=${dto.category}">제품삭제</a>
				</c:if>
			</div>	
			상품명 : ${dto.productName},  상품가격 : ${dto.price}
					 
			<img src="http://192.168.16.5:8080/Sara/imageSara/쇼핑백누끼.png"
			 onclick="addToCart('${dto.saveFileName}')" alt="cart" width="15" >
			  
            <img src="http://192.168.16.5:8080/Sara/imageSara/저장누끼.png"
            onclick="addToWishlist('${dto.saveFileName}')" alt="wishlist" width="12"> 
            
            조회수:${dto.hitCount}
            
            
            
<%-- 			종류: ${dto.category}, 상품 설명: ${dto.productSubject}, 재고: ${dto.quantity}개, 조회수: ${dto.hitCount} --%>

	</td>
<c:set var="n" value="${n+1}"/>			
</c:forEach>	
<!-- 사진을 1개 넣었을때 2번째 TD가 만들기-->	
<c:if test="${n%3==1 }">	
		<td ></td>
</c:if>

<!-- 사진을 1개 넣었을때 3번째 TD가 만들기-->
<c:if test="${n%3!=0 }">	
		<td></td>
</c:if>

<c:if test="${n!=0 }">
	</tr>
</c:if>
</table>

<br/>
<table style="margin: auto;" width="500">
<tr>
	<td colspan = "4" align = "center">
	
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

<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>

<div id="mit" style="display: flex;
justify-content: space-between; align-items: center;">

<div id="mit1" style="padding: 200px; padding-bottom: 200px;" >

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
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 13px;"></a><br/>			 
			 
			 
			 <br/>
			 
 
<input type="button" 
	value="&nbsp;&nbsp;4 t h &nbsp;&nbsp;F L O O R &nbsp;,&nbsp; 1 2 4 &nbsp;,&nbsp;
&nbsp;&nbsp;T E H E R A N &nbsp;-&nbsp; R O &nbsp;,&nbsp; G A N G N A M &nbsp;-&nbsp; G U &nbsp;,&nbsp;
&nbsp;&nbsp;S E O U L &nbsp;,&nbsp; R E P U B L I C &nbsp;&nbsp;O F&nbsp;&nbsp; K O R E A" class="btn2"
			onclick="location='<%=cp%>/Outer.do';" 
			 align="middle" style="text-align: left;"/><br/>

 
 
 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-top: 300px;" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 




 
 
 </div>





</body>
</html>