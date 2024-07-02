<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('delete.png'); /* Replace 'your_image.jpg' with your image path */
        background-size: cover;
        background-position: center;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent white background */
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Box shadow for depth */
        max-width: 600px; /* Limit container width */
        margin: 50px auto; /* Center container vertically and horizontally */
        text-align: center; /* Center align text */
    }
    h2 {
        color: #333; /* Dark text color */
    }
    p {
        color: #555; /* Slightly darker text color */
        margin: 10px 0; /* Add some margin between paragraphs */
    }
    .product-details {
        font-weight: bold; /* Make product details bold */
        color: #333; /* Darker text color for product details */
    }
    form {
        margin-top: 20px; /* Add space between message and form */
    }
    input[type="submit"] {
        background-color: #DD71B1; /* Pink shade for button */
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #FFC0CB; /* Faint pink shade on hover */
    }
</style>
</head>
<body>
<div class="container">
    <% AdminBean ab = (AdminBean) session.getAttribute("abean"); %>
    <p>Page belongs to Admin: <%= ab.getfNmae() %></p>
    <form action="deleteProduct" method="post">
        <% ProductBean pb = (ProductBean) request.getAttribute("pbean"); %>
        <input type="hidden" name="pcode" value="<%=pb.getCode()%>">
        <h2>Delete Product</h2>
        <p>Are you sure you want to delete the following product?</p>
        <div class="product-details">
            <p>Product Code: <%=pb.getCode()%></p>
            <p>Product Name: <%=pb.getName()%></p>
            <p>Product Price: <%=pb.getPrice()%></p>
            <p>Product Quantity: <%=pb.getQty()%></p>
        </div>
        <input type="submit" value="Delete Product">
    </form>
</div>
</body>
</html>
