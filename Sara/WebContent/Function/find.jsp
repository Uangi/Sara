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
</head>
<body>
<br /><br /><br /><br />
<a href="<%=cp%>/shop.jsp" style="display: block; text-align: center;">
    <img alt="sara" src="./sara.png" style="width: 150px; margin: auto;" />
</a>

<br />
    <h2 align="center">Forgot Password</h2>
    <form action="" method="post">
        <div style="margin-left: 810px;">
        <label for="userId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID:</label>
        <input type="text" name="userId" required/><br/>
        <label for="email">E-Mail:</label>
        <input type="email" name="email" required/><br/>
        <br />
        <input type="submit" value="continue" style="margin-left: 100px;"/></div>
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
</body>
</html>
