<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #FFE5B4; /* Faint skin-orange background */
        color: #8B4513; /* Darker skin-orange text color */
        padding: 20px;
    }
    .container {
        background-color: #F4A460; /* Lighter skin-orange container background */
        border-radius: 5px;
        padding: 20px;
        margin-bottom: 20px;
        text-align: center; /* Center align content */
    }
    .msg {
        font-weight: bold;
        color: #FF6347; /* Deeper orange color for messages */
        margin-bottom: 10px; /* Add some space below the message */
    }
</style>
</head>
<body>
<%
AdminBean abean = (AdminBean) session.getAttribute("abean");
String message = (String) request.getAttribute("msg");
%>
<div class="msg"><%= message %></div>
<div class="container">
    <p>Page belongs to Admin: <%= abean.getfNmae() %></p>
    <%@include file="ViewAllProduct.jsp" %>
</div>
</body>
</html>
