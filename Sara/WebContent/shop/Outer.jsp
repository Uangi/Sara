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
<title>이미지 목록</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/css/list.css"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="<%=cp%>/shop/js/list.js"></script>	
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

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
        spaceBetween: 30,
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
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="300" align="right" style="padding-left: 50px;"></a><br/>




<div id="cate" style=" padding-right: 80px; padding-top: 80px;">





<input type="button" value="&nbsp; O U T E R &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Outer.do;" 
			 align="middle"/>

<input type="button" value="&nbsp; T O P &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Top.do';" 
			 align="middle"/>	

<input type="button" value="&nbsp; B O T T O M S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Bottom.do';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; B A G S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Bags.do;" 
			 align="middle"/>
	
<input type="button" value="&nbsp; S H O E S &nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Shoes.do';" 
			 align="middle"/>
		
<input type="button" value="&nbsp; A C C .&nbsp;" class="btn2"
			onclick="location='<%=cp%>/product/Accessories.do';" 
			 align="middle"/>


</div>



<div id="ser" style=" padding-right: 80px; padding-top: 50px;" >
<form action="" name="searchForm" method="post">
	   <td>
	   <br/>
	   
		<img src="http://192.168.16.5:8080/Sara/imageSara/서치콘누끼.png"
			width="30" align="middle" style="margin-bottom: 16px;"/>
									
			<select name="searchKey" class="selectField" style="border: none; outline: none;" >
				<option value="product">products</option>
				<option value="price">price</option>
			</select>
				<input type="text" name="searchValue" class="textField"/>
				<input type="button" value=" search " class="btn2"  
				onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent"><br/>
			</td>					
		</form>	
	</div>
  </div>
</div>







<div>




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

	<input type = "button" value = "제품 등록" 
	onclick = "location='<%=cp %>/product/productCreated.do';"/>
	
	<input type = "button" value = "메인 페이지" 
	onclick = "location='<%=cp %>/shop.jsp';"/>
	</td>
</tr>

<div class="swiper-container">
  <div class="swiper-wrapper">
    <c:forEach var="dto" items="${outerProducts}" varStatus="status">
      <div class="swiper-slide">
        <a href="${imagePath}/${dto.saveFileName}">
          <img src="${imagePath}/${dto.saveFileName}" width="100%" />
        </a>
      </div>
    </c:forEach>
  </div>
  <!-- 페이징 버튼 -->
  <div class="swiper-pagination"></div>
</div>

<c:forEach var="dto" items="${outerProducts}" varStatus="status">
	<c:if test="${status.index % 3 == 0}">
		<tr>
	</c:if>

	<td align="center" width="250">
		<a href="${imagePath}/${dto.saveFileName}">
			<img src="${imagePath}/${dto.saveFileName}" width="180" />
			<div style="text-align: center;">
				${dto.productNum}&nbsp;
				<a href="${deletePath}?num=${dto.productNum}&pageNum=${pageNum}">제품삭제</a>
			</div>
			<div>
			상품명 : ${dto.productName},  상품가격 : ${dto.price}
			  
			 
			<img src="http://192.168.16.5:8080/Sara/imageSara/쇼핑백누끼.png"
			 onclick="addToCart('${dto.saveFileName}')" alt="cart" width="15" >
			  
            <img src="http://192.168.16.5:8080/Sara/imageSara/저장누끼.png"
            onclick="addToWishlist('${dto.saveFileName}')" alt="wishlist" width="12"> 
<%-- 			종류: ${dto.category}, 상품 설명: ${dto.productSubject}, 재고: ${dto.quantity}개, 조회수: ${dto.hitCount} --%>
			</div>
			</a>
		<br/><br/>	
	</td>
			
			
        	<br/><br/><br/>
		
	</td>
		
	<c:if test="${status.index % 4 == 3 or status.last}">
	
	</tr>
	</c:if>
	
</c:forEach>





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
<img src="http://192.168.16.11:8080/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 13px;"></a><br/>			 
			 
			 
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