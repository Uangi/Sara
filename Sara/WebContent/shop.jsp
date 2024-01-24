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
<title> SHOP </title>

<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/create.css" />
<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/style.css" />

<script type="text/javascript">

	function searchData(){

		var f = document.searchForm;
		f.action ="<%=cp%>/sara/product.do";		
		f.submit();
	}

	
	var images = [
        'http://192.168.16.5:8080/Sara/imageSara/1.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/2.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/3.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/4.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/5.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/6.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/7.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/8.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/9.jpg',
        'http://192.168.16.5:8080/Sara/imageSara/10.jpg'
    ];

    var currentIndex = 0;

    function startSlideShow() {
        setInterval(changeImage, 2000); // 3초마다 이미지 변경 (1000ms = 1초)
    }

    function changeImage() {
        currentIndex = (currentIndex + 1) % images.length;
        document.getElementById('slideImage').src = images[currentIndex];
    }

    // 슬라이드 쇼 시작
    startSlideShow();

	
	
</script>




</head>
<body>






<div id = "bbsList">
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="300" ><br/>
		
	<div id="bbsList_title">
	
	<form action="" name="searchForm" method="post">
	
		<img src="http://192.168.16.5:8080/Sara/imageSara/서치콘누끼.png"
			width="40" align="middle" style="margin-bottom: 16px;"/>
									
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






<div id="bbsshop"style="display: flex;
justify-content: space-between; align-items: center;" >




<div id="list">

<div id = "bbsshop_title" > C A T E G O R Y&nbsp;&nbsp; </div><br/>

<div id = "bbsshop_header">
<input type="button" value=" O U T E R " class="btn2"
			onclick="location='<%=cp%>/product/Outer.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>	
<div id = "bbsshop_header">	
<input type="button" value=" T O P " class="btn2"
			onclick="location='<%=cp%>/product/Top.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>	
<div id = "bbsshop_header">	
<input type="button" value=" B O T T O M S " class="btn2"
			onclick="location='<%=cp%>/product/Bottoms.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>
<div id = "bbsshop_header">				
<input type="button" value=" B A G S " class="btn2"
			onclick="location='<%=cp%>/product/Bags.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>
<div id = "bbsshop_header">			
<input type="button" value=" S H O E S " class="btn2"
			onclick="location='<%=cp%>/product/Shoes.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>
<div id = "bbsshop_header">			
<input type="button" value=" A C C ." class="btn2"
			onclick="location='<%=cp%>/product/Accessories.do';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>
<div id = "bbsshop_header">			
<input type="button" value=" M Y &nbsp;&nbsp;P A G E " class="btn2"
			onclick="location='<%=cp%>/product/Mypage.jsp';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>			
<div id = "bbsshop_header">			
<input type="button" value=" H O M E " class="btn2"
			onclick="location='<%=cp%>/Sara/main.jsp';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>			
<div id = "bbsshop_header">			
<input type="button" value=" A B O U T&nbsp;&nbsp;&nbsp;U S " class="btn2"
			onclick="location='<%=cp%>/sara/mypage.jsp';" 
			style="border: none;outline: none; background: transparent" align="middle"/></div><br/>			

<input type = "button" value = "제품 등록" 
onclick="location='<%=cp %>/product/productCreated.do/';"/>


</div>	




	<div id="bbsmagazine">
	<img id="slideImage" 
    src="http://192.168.16.5:8080/Sara/imageSara/1.png"
    width="480px;" height="650px;" align="right"/>
	</div>		






	
</div>

	

	
	









</body>
</html>