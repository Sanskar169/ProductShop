<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
CustomerBean cb=(CustomerBean)session.getAttribute("cbean");
String msg=(String)request.getAttribute("msg");
out.println(msg+"<br>");
out.println("Welcome Admin : "+cb.getName());
%>
<a href="viewCus" class="button">View Products</a>
<a href="logout" class="button">Logout</a>


</body>
</html>