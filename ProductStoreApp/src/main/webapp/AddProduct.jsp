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
        color: #fff;
    }
    .message {
        margin-bottom: 20px;
        font-size: 1.5rem;
        color: #FFA500; /* Orange */
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

<div class="container">
    <% String msg=(String)request.getAttribute("msg"); %>
    <% if (msg != null) { %>
        <p class="message"><%= msg %></p>
    <% } %>
    <div class="box">
        <%@include file="AdminLogin.jsp" %>
    </div>
</div>

</body>
</html>
