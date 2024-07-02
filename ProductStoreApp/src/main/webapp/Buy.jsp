<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="test.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>Cart</h1>
    <table border="1">
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>
        <% 
            // Retrieve cart items from the database
            Connection con = DBConnection.getCon();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM cart");
            ResultSet rs = stmt.executeQuery();
            double total = 0;
            int totalProducts = 0;
            while (rs.next()) {
                String code = rs.getString("code");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("qty");
                total += price * quantity;
                totalProducts += quantity;
        %>
        <tr>
            <td><%= code %></td>
            <td><%= name %></td>
            <td><%= price %></td>
            <td><%= quantity %></td>
        </tr>
        <% } %>
    </table>
    <p>Total number of products: <%= totalProducts %></p>
    <p>Total: <%= total %></p>
    <form action="CheckoutServlet" method="post">
        <input type="submit" value="Checkout">
    </form>
</body>
</html>