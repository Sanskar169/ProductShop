<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Display</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #FFE5B4; /* Faint skin-orange background */
        color: #8B4513; /* Darker skin-orange text color */
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .msg {
        font-weight: bold;
        color: #FF6347; /* Deeper orange color for messages */
        margin-bottom: 10px; /* Add some space below the message */
        text-align: center; /* Center align the message */
    }
</style>
</head>
<body>
<%
String msg = (String)request.getAttribute("msg");
%>
<div>
    <div class="msg"><%= msg %></div>
    <%@include file="index.html" %>
</div>
</body>
</html>
