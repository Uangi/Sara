<%@page import="com.join.CustomInfo"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.user.SignUpDTO"%>
<%@page import="com.user.SignUpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.util.DBConn"%>

<%
 request.setCharacterEncoding("UTF-8");
 String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Login </title>

<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/create.css" />
<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/style.css" />
<link rel="stylesheet" type="text/css" 	href="<%=cp %>/Function/css/login.css" />
	
<script type="text/javascript" src="<%=cp%>/Function/js/userCreated.js"></script>	
	
	<script type="text/javascript">
		var images = [
        'localhost:8081/Sara/imageSara/1.jpg',
        'localhost:8081/Sara/imageSara/2.jpg',
        'localhost:8081/Sara/imageSara/3.jpg',
        'localhost:8081/Sara/imageSara/4.jpg',
        'localhost:8081/Sara/imageSara/5.jpg',
        'localhost:8081/Sara/imageSara/6.jpg',
        'localhost:8081/Sara/imageSara/7.jpg',
        'localhost:8081/Sara/imageSara/8.jpg',
        'localhost:8081/Sara/imageSara/9.jpg',
        'localhost:8081/Sara/imageSara/10.jpg'
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
    
    function login() {
    	f.action = "<%=cp%>/shop.do";
		f.submit();
//     }
	</script>
	
</head>
<body>



<div id = "bbsList">
<img src="localhost:8081/Sara/imageSara/사라찐누끼.png" width="300" >
</div>
<br/><br/><br/>


<div id="bbsshop"style="display: flex;
justify-content: space-between; align-items: center;" >



<div style="width: 300px;
 	height:550px;
	padding-right: 25px; ">


<div style=" width:200px;  
	margin-left: 50px;
	height:30px;
	background: tranparent;
	text-align:center;
	font-weight: normal;
	line-height:40px;
	font-size:20pt;
	color : #000;
	font-family: constantia;
	text-decoration: line-through; "> ACCESS &nbsp;YOUR ACCOUNT 
</div>

<br/><br/>
<br/><br/>

<div style="margin-bottom: 10px;">
<b style="margin: 10px;"> I D <br/></b>
</div>

<form action="" method="post">
<div id="titletitle" style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;">
	
	<input type="text" name="userId" class="input1" style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;"/>
	
</div>


<br/><br/><br/>


<div style="margin-bottom: 10px;">
<b style="margin: 10px;"> P W <br/></b>
</div>

<div id="titletitle" name = "userId"  style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;">
	
	<input type="password" name="userPwd" class="input1" style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;"/>
	
	
</div>


<div id = "butt">


<table>

<tr>
	<td style="margin: auto;"></td>
	<td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">
		<br/>
		<br/>
		<button type="submit" class="btn" value="login" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> L O G I N  </button>
		<br/>
		<br/>
		<button type="button" class="btn" onclick="location='<%=cp%>/Function/find.jsp'" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> F O R G O T &nbsp; &nbsp;P W &nbsp;? </button><br/>
		<br/>
		<button type="button" class="btn" onclick="location='<%=cp%>/project/userCreated.do'" style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> J O I N &nbsp; &nbsp;U S &nbsp;? </button>
		</form>
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


	<div id="bbsmagazine">
	<img id="slideImage" 
    src="localhost:8081/Sara/imageSara/1.png"
    width="480px;" height="650px;" align="right"/>
	</div>		


</div>

<div id="mit" style="display: flex;
justify-content: space-between; align-items: center;">

<div id="mit1" style="padding: 200px; padding-bottom: 200px;" >

			 
			 <br/><br/><br/>
			 
<a href="<%=cp %>/main.jsp">
<img src="localhost:8081/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 30px;"></a><br/>			 
<br/>
<input type="button" 
	value="&nbsp;&nbsp;4 t h &nbsp;&nbsp;F L O O R &nbsp;,&nbsp; 1 2 4 &nbsp;,&nbsp;
&nbsp;&nbsp;T E H E R A N &nbsp;-&nbsp; R O &nbsp;,&nbsp; G A N G N A M &nbsp;-&nbsp; G U &nbsp;,&nbsp;
&nbsp;&nbsp;S E O U L &nbsp;,&nbsp; R E P U B L I C &nbsp;&nbsp;O F&nbsp;&nbsp; K O R E A" class="btn2"
			onclick="location='<%=cp%>/outer.jsp';" 
			 align="middle" style="text-align: left; border: none; outline: none; padding-left: 20px; background: transparent;" /><br/>
 
 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-top: 100px;" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 
 
 </div>
	
</div>

<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

if (userId != null && userPwd != null && !userId.isEmpty() && !userPwd.isEmpty()) {
    Connection connection = null;
    try {
        connection = DBConn.getConnection();
        SignUpDAO dao = new SignUpDAO(connection);
        SignUpDTO member = dao.login(userId, userPwd);

        if (member != null) {

            session.setAttribute("loggedInUser", member);

            response.sendRedirect(cp + "/shop.jsp");
        } else {
            out.print("<p style='color: red;' align='center'>입력한 정보와 일치하는 회원이 없습니다.</p>");
        }
    } catch (Exception e) {
        out.print("<p style='color: red;' align='center'>DB 연결 오류: " + e.toString() + "</p>");
    }
}

%>

<%
SignUpDTO loggedInUser = (SignUpDTO)session.getAttribute("loggedInUser");
if (loggedInUser != null) {
    out.print("<p style='color: blue;' align='center'>" + loggedInUser.getUserName() + " 님 로그인 상태입니다</p>");
}
%>

</body>
</html>