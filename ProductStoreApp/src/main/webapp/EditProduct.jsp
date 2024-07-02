<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="test.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('update.jpeg'); /* Add your image path here */
        background-size: cover;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent white background for container */
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow for depth */
        text-align: center;
    }
    .message {
        margin-bottom: 20px;
        padding: 10px;
        background-color: rgb(255, 192, 150); /* Blue color for message background */
        color: #fff; /* White text color for message */
        border-radius: 5px;
    }
    form {
        margin-top: 20px;
    }
    input[type="text"] {
        padding: 8px;
        margin-bottom: 10px;
        width: 200px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    input[type="submit"] {
        background-color: rgb(255, 192, 150); /* Faint orange color for submit button */
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #ffa23a; /* Darker orange on hover */
    }
</style>
</head>
<body>
<div class="container">
    <% 
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    ProductBean pb = (ProductBean) request.getAttribute("pbean");
    %>
    <div class="message">
        <p>Page belongs to Admin: <%= ab.getfNmae() %></p>
    </div>
    <form action="update" method="post">
        <input type="hidden" name="pcode" value="<%= pb.getCode() %>">
        <p>Product Price: <input type="text" name="price" value="<%= pb.getPrice() %>"></p>
        <p>Product Qty: <input type="text" name="qty" value="<%= pb.getQty() %>"></p>
        <input type="submit" value="Update Product">
    </form>
</div>
</body>
</html>
