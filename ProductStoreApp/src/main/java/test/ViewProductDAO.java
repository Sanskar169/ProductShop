package test;

import java.sql.*;
import java.util.*;

public class ViewProductDAO {
	public ArrayList<ProductBean> al=new ArrayList<>();
	public ArrayList<ProductBean> retrieve(){
		try {
			Connection con=DBConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from product");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setCode(rs.getString(1));
				pb.setName(rs.getString(2));
				pb.setPrice(rs.getDouble(3));
				pb.setQty(rs.getInt(4));
				al.add(pb);//ProductBean added to ArrayList Object
			}
			
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

}
