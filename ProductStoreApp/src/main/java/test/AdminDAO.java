package test;

import java.sql.*;
public class AdminDAO {
	
	public AdminBean ab=null;
	
	public AdminBean login(String uName,String pWord) {
		try {
			
			Connection con=DBConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from Admin60 where name=? and password=?");
			
			ps.setString(1, uName);
			ps.setString(2, pWord);
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				ab=new AdminBean();
				ab.setuName(rs.getString(1));
				ab.setpWord(rs.getString(2));
				ab.setfName(rs.getString(3));
				ab.setlName(rs.getString(4));
				ab.setmId(rs.getString(5));
				ab.setPhNo(rs.getLong(6));
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ab;
	}
}
