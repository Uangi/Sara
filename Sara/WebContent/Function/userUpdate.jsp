<%@ page import="com.user.SignUpDTO" %>
<%@ page import="com.user.SignUpDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.DBConn" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();

    SignUpDTO loggedInUser = (SignUpDTO) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }

    Connection conn = DBConn.getConnection();
    SignUpDAO signUpDAO = new SignUpDAO(conn);

    loggedInUser = signUpDAO.getDTOByUserId(loggedInUser.getUserId());

    if (loggedInUser == null) {
        response.sendRedirect(cp + "/Function/login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>Modify</title>
    <style>
        body {
            background-color: #f2f2f2;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: inline-block;
            width: 120px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input {
            width: 200px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        span {
            display: inline-block;
            width: 200px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f2f2f2;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
.input-container {
    display: flex;
    align-items: center;
}

.input-container label {
    margin-right: 10px;
}

.input-container input {
    width: 50px;
    margin-right: 5px;
}

.address-container {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
}

.address-container label {
    margin-bottom: 5px;
}

.address-container input {
    width: 200px;
    padding: 8px;
    margin-bottom: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}



    </style>
</head>
<body>
<br /><br /><br /><br />
<a href="<%=cp%>/product/shop.do" style="display: block; text-align: center;">
    <img alt="sara" src="./sara.png" style="width: 150px; margin: auto;" />
</a>

<br />
<h2 align="center">Modify</h2>
<form action="<%=cp%>/user/userUpdate.do" method="post">
    <div style="margin-left: 780px;">
    
        <input type="hidden" name="userId" value="<%=loggedInUser.getUserId()%>"/>
        <input type="hidden" name="userName" value="<%=loggedInUser.getUserName()%>"/>
        <input type="hidden" name="gender" value="<%=loggedInUser.getGender()%>"/>
        <input type="hidden" name="birth" value="<%=loggedInUser.getBirth()%>"/>
        
        <label for="userId">User ID:</label>
        <span><%=loggedInUser.getUserId()%></span><br/>

        <label for="userName">Name:</label>
        <span><%=loggedInUser.getUserName()%></span><br/>

        <label for="gender">Gender:</label>
        <span><%=loggedInUser.getGender()%></span><br/>
        
         <label for="birth">Birth:</label>
        <span><%=loggedInUser.getBirth()%></span><br/>

        <label for="userPwd">Password:</label>
        <input type="password" name="userPwd" value="<%=loggedInUser.getUserPwd()%>" required/><br/>

<div class="input-container">
    <label for="tel">Tel:</label>
    <input type="text" name="tel1" value="<%=loggedInUser.getTel1()%>" required/>-
    <input type="text" name="tel2" value="<%=loggedInUser.getTel2()%>" required/>-
    <input type="text" name="tel3" value="<%=loggedInUser.getTel3()%>" required/>
</div>

<div class="input-container">
    <label for="mobile">Mobile:</label>
    <input type="text" name="mobile1" value="<%=loggedInUser.getMobile1()%>" required/>-
    <input type="text" name="mobile2" value="<%=loggedInUser.getMobile2()%>" required/>-
    <input type="text" name="mobile3" value="<%=loggedInUser.getMobile3()%>" required/>
</div>


        <label for="email">Email:</label>
        <input type="text" name="email1" value="<%=loggedInUser.getEmail()%>" required/><br/>

        <label for="bank">Bank:</label>
        <input type="text" name="bank" value="<%=loggedInUser.getBank()%>" required/><br/>
        


    <label for="sample4_postcode">Postal Code:</label>
    <input type="text" name="sample4_postcode" value="<%=loggedInUser.getSample4_postcode()%>" required/>


<div class="address-container">
    <label for="sample4_allAddress">Address:</label>
    <input type="text" name="sample4_roadAddrss" value="<%=loggedInUser.getSample4_roadAddress()%>" required/><br/>

    <label for="sample4_allAddress"></label>
    <input type="text" name="sample4_jibunAddress" value="<%=loggedInUser.getSample4_jibunAddress()%>" required/><br/>

    <label for="sample4_allAddress"></label>
    <input type="text" name="sample4_detailAddress" value="<%=loggedInUser.getSample4_detailAddress()%>" required/><br/>

    <label for="sample4_allAddress"></label>
    <input type="text" name="sample4_extraAddress" value="<%=loggedInUser.getSample4_extraAddress()%>" required/><br/>
</div>


        <br />
        <input type="submit" value="Modify" style="margin-left: 70px;"/>
    </div>
</form>
</body>
</html>