package test;

import java.sql.*;

public class AddToCartDAO {
	public int k = 0;
	public int add(ProductBean pb) {
	    try {
	        Connection con = DBConnection.getCon();
	        // Check if the product is already in the cart
	        PreparedStatement checkIfExists = con.prepareStatement("select * from cart where code=?");
	        checkIfExists.setString(1, pb.getCode());
	        ResultSet rs = checkIfExists.executeQuery();
	        if (rs.next()) {
	            // If the product exists, update the quantity
	            PreparedStatement update = con.prepareStatement("update cart set qty = qty + 1 where code=?");
	            update.setString(1, pb.getCode());
	            return update.executeUpdate();
	        } else {
	            // If the product doesn't exist, add it with quantity 1
	            PreparedStatement add = con.prepareStatement("insert into cart values(?,?,?,?)");
	            add.setString(1, pb.getCode());
	            add.setString(2, pb.getName());
	            add.setDouble(3, pb.getPrice());
	            add.setInt(4, 1); // Initially adding 1 quantity
	            return add.executeUpdate();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // Return 0 if there's any exception
	    }
	}

//    	try {
//			Connection con = DBConnection.getCon();
//			PreparedStatement add = con.prepareStatement("insert into cart values(?,?,?,?)");
//			add.setString(1, pb.getCode());
//			add.setString(2, pb.getName());
//			add.setDouble(3, pb.getPrice());
//			add.setInt(4, pb.getQty());
//			k = add.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return k;
}
