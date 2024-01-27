<%@page import="com.user.SignUpDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>SHOP</title>

    <link rel="stylesheet" type="text/css" href="<%=cp %>/css/create.css" />
    <link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css" />

    <style>
#loginStatus {
    position: fixed;
    top: 10px;
    left: 65%;
    transform: translateX(-50%);
}

#logoutBtn {
    cursor: pointer;
}

#logoutBtn:hover {
    text-decoration: underline;
}

        #loginStatus p {
            margin: 0;
        }
    </style>

    <script type="text/javascript">
        function searchData() {
            var f = document.searchForm;
            f.action ="<%=cp%>/sara/product.do";        
            f.submit();
        }

        function logout() {
            location="<%=cp%>/project/logout.do";
        }

        var images = [
            'http://192.168.16.2:8080/Sara/imageSara/1.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/2.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/3.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/4.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/5.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/6.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/7.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/8.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/9.jpg',
            'http://192.168.16.2:8080/Sara/imageSara/10.jpg',
        ];

        var currentIndex = 0;

        function startSlideShow() {
            setInterval(changeImage, 2000); // 3초마다 이미지 변경 (1000ms = 1초)
        }

        function changeImage() {
            currentIndex = (currentIndex + 1) % images.length;
            document.getElementById('slideImage').src = images[currentIndex];
        }

        function moveToLoginPage() {
            location.href = "<%=cp %>/project/login.do";
        }
        // 슬라이드 쇼 시작
        startSlideShow();
    </script>
</head>
<body>

<%
    SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");

    if (loggedInUser != null) {
%>
        <div id="loginStatus">
            <p><%= loggedInUser.getUserName() %> 님 반갑습니다.
                <span id="logoutBtn" onclick="logout()" style="border: 1px solid black;  padding: 2px; ">&nbsp;logout&nbsp;</span>
                <span id="myPageBtn" onclick="location='<%=cp%>/Function/myPage.jsp';"  style="border: 1px solid black;  padding: 2px; ">&nbsp;내 정보&nbsp;</span>
            </p>
        </div>
<%
    } else {
%>
        <div id="loginStatus">
            <p>
            <span id="moveToLoginBtn" onclick="moveToLoginPage()" style="border: 1px solid black; margin-left: 100px; padding: 2px;">Login</span>
             <span onclick="window.location.href='<%=cp%>/Function/find.jsp'" style="border: 1px solid black; padding: 2px;">PW Find</span>
             <span onclick="window.location.href='<%=cp%>/project/userCreated.do'" style="border: 1px solid black; padding: 2px;">Join</span>
             
            </p>
        </div>
<%
    }
%>


<div id="bbsList">
    <img src="http://192.168.16.2:8080/Sara/imageSara/사라찐누끼.png" width="300" /><br/>
    
    <div id="bbsList_title">
        <form action="" name="searchForm" method="post">
            <img src="http://192.168.16.2:8080/Sara/imageSara/서치콘누끼.png" width="40" align="middle" style="margin-bottom: 16px;"/>
            <select name="searchKey" class="selectField" style="border: none; outline: none;" >
                <option value="product">products</option>
                <option value="price">price</option>
            </select>
            <input type="text" name="searchValue" class="textField"/>
            <input type="button" value="search" class="btn2" onclick="searchData();" style="border:1px dashed #000; outline-width:1px; background: transparent" /><br/>
        </form>
    </div>
</div>

<div id="bbsshop" style="display: flex; justify-content: space-between; align-items: center;">

    <div id="list">
        <div id="bbsshop_title">CATEGORY&nbsp;&nbsp;</div><br/>

        <div id="bbsshop_header">
            <input type="button" value="OUTER" class="btn2" onclick="location='<%=cp%>/product/Outer.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>    
        <div id="bbsshop_header">
            <input type="button" value="TOP" class="btn2" onclick="location='<%=cp%>/product/Top.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>    
        <div id="bbsshop_header">
            <input type="button" value="BOTTOMS" class="btn2" onclick="location='<%=cp%>/product/Bottoms.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="BAGS" class="btn2" onclick="location='<%=cp%>/product/Bags.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="SHOES" class="btn2" onclick="location='<%=cp%>/product/Shoes.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="ACC." class="btn2" onclick="location='<%=cp%>/product/Acc.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="MY PAGE" class="btn2" onclick="location='<%=cp%>/product/mypage.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="HOME" class="btn2" onclick="location='<%=cp%>/product/home.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
        <div id="bbsshop_header">
            <input type="button" value="ABOUT US" class="btn2" onclick="location='<%=cp%>/product/about.do';" style="border: none;outline: none; background: transparent" align="middle"/>
        </div><br/>
    </div>

    <div id="bbsmagazine">
        <img id="slideImage" src="http://192.168.16.5:8080/Sara/imageSara/1.jpg" width="480px;" height="650px;" align="right"/>
    </div>

</div>

</body>
</html>
