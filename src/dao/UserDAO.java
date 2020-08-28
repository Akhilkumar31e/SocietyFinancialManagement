package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.UserBean;
import util.DBConnection;

public class UserDAO {
	public UserBean getUserDetails(String email) {
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select * from users USE INDEX (PRIMARY) where email=?";
		UserBean user = new UserBean();
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				con.close();
				return null;
				
			}
			else {
				String username = rs.getString(2);
				String mobile = rs.getString(4);
				boolean admin = rs.getBoolean(6);
				user.setUsername(username);
				user.setAdmin(admin);
				user.setMobile(mobile);
				user.setEmail(email);
			}
			con.close();

		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	
	}
}
