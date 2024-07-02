package test;

import java.sql.*;
public class CustomerDAO {
	public CustomerBean cb=null;
	public CustomerBean login(String uName,long pWord) {
		try {
			Connection con=DBConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from Customer60 where name=? and phno=?");
			ps.setString(1, uName);
			ps.setLong(2, pWord);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				cb=new CustomerBean();
				cb.setPhone(rs.getLong(1));
				cb.setName(rs.getString(2));
				cb.setCity(rs.getString(3));
				cb.setmId(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return cb;
	}

}
