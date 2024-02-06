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
<title> 제품 등록 </title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/shop/data/created.css"/>

<script type="text/javascript" src="<%=cp%>/shop/data/image.js"></script>
<script type="text/javascript">

		function sendIt() {
			
			var f = document.myForm;
			var category = f.category.value;
			str = f.productName.value;
			str = str.trim();
			if(!str) {
				alert("상품명을 입력하세요.");
				f.productName.focus();
				return;
			}
			f.productName.value = str;
			
			str = f.productSubject.value;
			str = str.trim();
			if(!str) {
				alert("상품 설명을 입력하세요.");
				f.productSubject.focus();
				return;
			}
			f.subject.value = str;

			if (category === '종류') {
			            alert("종류를 선택하세요.");
			            f.category.focus();
			            return;
			        }
			
<%-- 			f.action = "<%=cp %>/product/"+category+ ".do"; --%>
			f.action = "<%=cp %>/shop.jsp";
			f.submit();
		}
</script>

</head>
<body>
	
	<div id = "bbs_title">
		이미지 게시판 (Servlet)	
	</div>
	
 <form action="<%=cp %>/product/productCreated_ok.do" name = "myForm" method="post" enctype="multipart/form-data">

	<div id="bbsCreated">	
		<div class="bbsCreated_noLine">
			<dl>
				<dt>상&nbsp;&nbsp;품&nbsp;&nbsp;명&nbsp;&nbsp;</dt>
				<dd>
				<input type="text" name="productName" size="35"
				maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진</dt>
				
				<dd>
				 <input type="file" name="upload">
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>상&nbsp;&nbsp;품&nbsp;&nbsp;설&nbsp;&nbsp;명</dt>
				<dd>
				<input type="text" name="productSubject" size="35"
				maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>종&nbsp;&nbsp;&nbsp;&nbsp;류</dt>
				<dd>
				<select name = "category">
				<option>종류</option>
				<option value = "Accessories">Accessories</option>
				<option value = "Bags">Bags</option>
				<option value = "Bottoms">Bottoms</option>
				<option value = "Outer">Outer</option>
				<option value = "Shoes">Shoes</option>
				<option value = "Top">Top</option>
				</select>
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>가&nbsp;&nbsp;&nbsp;&nbsp;격</dt>
				<dd>
				<input type="text" name="price" size="35"
				maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
		
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>수&nbsp;&nbsp;&nbsp;&nbsp;량</dt>
				<dd>
				<input type="text" name="quantity" size="35"
				maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
		
	</div>	
		<!-- 버튼 -->
	<div id = "bbsCreated_footer">
		
		<input type="submit" value=" 제품등록하기 " name = "upload" class="btn2" />
		<input type="reset" value=" 다시입력 " class="btn2"
			onclick="document.myForm.subject.focus();"/>
		<input type="button" value=" 작성취소 " class="btn2"
			onclick="location='<%=cp %>product/main.do/';"/>
		<input type = "button" value = "파일 리스트" 
			onclick = "location='<%=cp %>/product/Top.do';" style = "margin-top : 20px;"/>
	</div>
	</form>
</body>

</html>