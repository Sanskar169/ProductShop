<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="test.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('view_product.jpeg'); /* Add your image path here */
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
        max-width: 800px; /* Limit container width */
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ccc;
    }
    th {
        background-color: #DD71B1; /* Orange color for table headings */
        color: #fff; /* White text color for table headings */
    }
    .button {
        background-color: #DD71B1; /* Pink shade for buttons */
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-right: 5px;
        transition: background-color 0.3s ease;
    }
    .button:hover {
        background-color: #FFC0CB; /* Faint orange shade on hover */
    }
    .back-button {
        background-color: #DD71B1; /* Pink shade for buttons */
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-right: 5px;
        transition: background-color 0.3s ease;
        display: inline-block; /* Ensure it stays on the same line */
    }
    .back-button:hover {
        background-color: #FFC0CB; /* Faint orange shade on hover */
    }
</style>
</head>
<body>
<%
CustomerBean cb = (CustomerBean)session.getAttribute("cbean");
ArrayList<ProductBean> al = (ArrayList<ProductBean>)session.getAttribute("al");
%>
<div class="container">
    <div class="admin-info">
        <p>Page Belongs to Customer: <%=cb.getName() %></p>
    </div>
    <div class="product-table">
        <% if(al.size() == 0) { %>
            <p>No Products available.</p>
        <% } else { %>
            <table>
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Product Price</th>
                        <th>Product Qty</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <% Iterator<ProductBean> it = al.iterator(); %>
                    <% while(it.hasNext()) { %>
                        <% ProductBean pb = it.next(); %>
                        <tr>
                            <td><%= pb.getCode() %></td>
                            <td><%= pb.getName() %></td>
                            <td><%= pb.getPrice() %></td>
                            <td><%= pb.getQty() %></td>       
                                
                        </tr>
                    <% } // End of while loop %>
                </tbody>
            </table>
        <% } // End of if-else block %>
    </div>
    <a href="Buy.jsp" >Buy</a>
    <a href="ViewCusProduct.jsp" class="back-button">Back</a>
</div>

</body>
</html>
