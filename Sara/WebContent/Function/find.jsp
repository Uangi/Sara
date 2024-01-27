<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.util.DBConn"%>
<%@ page import="com.user.SignUpDAO, com.user.SignUpDTO, javax.mail.Transport, javax.mail.internet.InternetAddress, javax.mail.Message, javax.mail.internet.MimeMessage, javax.mail.Session, java.util.Properties"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    
<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/create.css" />
<link rel="stylesheet" type="text/css" 	href="<%=cp %>/css/style.css" />
    
    <script type="text/javascript">

	
	
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
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="300"
onclick="location='<%=cp%>/product/shop.do';"  >
</div>
<br/><br/><br/>


<div id="bbsshop" align="center">

<div style="width: 300px;
 	height:550px; ">


<div style=" width:200px;  
	
	height:30px;
	background: tranparent;
	text-align:center;
	font-weight: normal;
	line-height:40px;
	font-size:20pt;
	color : #000;
	font-family: constantia;
	text-decoration: line-through; "> FIND &nbsp;YOUR PASSWORD 
</div>


<br/><br/>
<br/><br/>

<form action = "" method = "post">

<div style="margin-bottom: 10px;">
<b style="margin: 10px;"> I D <br/></b>
</div>

<div id="titttit" >

	<input type="text" name="userId" class="input1" style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;" required />
	
	
</div>


<br/><br/><br/>

<div style="margin-bottom: 10px;">
<b style="margin: 10px;"> &nbsp;E M A I L <br/></b>
</div>

<div id="titttit" >
	
	
<input type="email" name="email" class="input1" style=" width:300px;
	height:40px;
	border:2px solid #000;
	text-align:center;
	align-content:right;" required/>	
	
  </form>
  <% 

    String userId = request.getParameter("userId");
    String email = request.getParameter("email");

    if (userId != null && email != null && !userId.isEmpty() && !email.isEmpty()) {
        Connection connection = null;
        try {
            connection = DBConn.getConnection();
            SignUpDAO dao = new SignUpDAO(connection);
            SignUpDTO member = dao.forgot(userId, email);

            if (member != null) {
                String host = "localhost";
                Properties prop = System.getProperties();
                Session ssn = Session.getInstance(prop, null);

                try {
                    MimeMessage message = new MimeMessage(ssn);
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    message.setFrom(new InternetAddress("manager@sara.com", "sara", "UTF-8"));
                    message.setSubject("회원님의 기존 비밀번호입니다.", "UTF-8");
                    message.setContent("기존 비밀번호 [" + member.getUserPwd() + "] 보안을 위해서 비밀번호를 변경해주세요.", "text/plain;charset=UTF-8");

                    Transport tp = ssn.getTransport("smtp");
                    tp.connect(host, "", "");
                    tp.sendMessage(message, message.getAllRecipients());
                    tp.close();

                    out.print("<p style='color: green;' align='center'>이메일로 비밀번호가 전송되었습니다.</p>");
                } catch (Exception e) {
                    out.print("<p style='color: red;' align='center'>오류가 발생했습니다: " + e.toString() + "</p>");
                }
            } else {
                out.print("<p style='color: red;' align='center'>입력한 정보와 일치하는 회원이 없습니다.</p>");
            }
        } catch (Exception e) {
            out.print("<p style='color: red;' align='center'>DB 연결 오류: " + e.toString() + "</p>");
        }
    }
    %>
</div>


<div id = "butt">



<table>

<tr>
	<td style="margin: auto;"></td>
	<td style=" border-left: none; padding-left: 22px; padding-top: 10px; " width="500" height="50" align="center">
		<br/>
		<br/>
		<button type="submit" class="btn" onclick="location='<%=cp%>/Function/find.jsp';"  style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000">F I N D </button>
		<br/>
		<br/>
		<button type="button" class="btn" onclick="location='<%=cp%>/project/login.do';"  style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> L O G I N &nbsp;? </button>
		<br/>
		<br/>
		<button type="button" class="btn" onclick="location='<%=cp%>/project/userCreated.do';"  style="text-decoration:underline; border: none; outline: none; background: transparent; color: #000"> J O I N &nbsp; &nbsp;U S &nbsp;? </button>
		
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

	
</div>

<div id="mit" style="display: flex;
justify-content: space-between; align-items: center;">

<div id="mit1" style="padding: 200px; padding-bottom: 200px;" >

			 <br/><br/><br/>
			 
<a href="<%=cp %>/main.jsp">
<img src="http://192.168.16.5:8080/Sara/imageSara/사라찐누끼.png" width="50" align="left" style="padding-left: 40px;"></a><br/>			 
			 
			 
			 <br/>
			 
 
<input type="button" 
	value="&nbsp;&nbsp;4 t h &nbsp;&nbsp;F L O O R &nbsp;,&nbsp; 1 2 4 &nbsp;,&nbsp;
&nbsp;&nbsp;T E H E R A N &nbsp;-&nbsp; R O &nbsp;,&nbsp; G A N G N A M &nbsp;-&nbsp; G U &nbsp;,&nbsp;
&nbsp;&nbsp;S E O U L &nbsp;,&nbsp; R E P U B L I C &nbsp;&nbsp;O F&nbsp;&nbsp; K O R E A" class="btn2"
			onclick="location='<%=cp%>/product/shop.do';" 
			 align="middle" style="text-align: left; border: none; outline: none; padding-left: 30px; background: transparent;" /><br/>

 
 </div>
 
 
 <div id="mit2" style="padding-right: 200px; padding-top: 100px;" align="right">
 
 <b>©️ copyright 2024. SARA. All Rights Reserved.</b>
 
 </div>
 
 </div>
</div>


</body>
</html>
