<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('bg_image.jpg'); /* Add your image path here */
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        text-align: center;
        padding: 20px;
        color: #fff;
    }
    .welcome-msg {
        margin-bottom: 20px;
        font-size: 2rem;
        color: #009999 /* Orange */
    }
    .button {
        background-color: #800080; /* Purple */
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
        margin: 5px;
    }
    .button:hover {
        background-color: #FFC0CB; /* Faint pink */
    }
    .box {
        border: 2px solid #fff;
        padding: 20px;
        border-radius: 5px;
        display: inline-block;
    }
</style>
</head>
<body>

<%
AdminBean ab=(AdminBean)session.getAttribute("abean");
out.println("<div class='container'>");
out.println("<div class='box'>");
out.println("<p class='welcome-msg'>Welcome Admin : "+ab.getfNmae()+"</p>");
%>
<a href="product.html" class="button">Add Product</a>
<a href="view" class="button">View All Product</a>
<a href="logout" class="button">Logout</a>
<%
out.println("</div>"); // Close the box div
out.println("</div>"); // Close the container div
%>

</body>
</html>