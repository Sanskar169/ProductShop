<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
AdminBean abean=(AdminBean)session.getAttribute("abean");
String message=(String)request.getAttribute("msg");
out.println("Page belongs to Admin : "+abean.getfNmae()+"<br>");
out.println(message+"&nbsp&nbsp");
%>
<%@include file="ViewAllProduct.jsp" %>

</body>
</html>