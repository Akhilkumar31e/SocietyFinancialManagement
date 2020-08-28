package dao;

import java.sql.*;

import bean.UserBean;

import util.DBConnection;

public class LoginDAO {
	
	public int loginUser(UserBean user) {
		String email=user.getEmail();
		String password=user.getPassword();
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select email,password,admin from users USE INDEX (PRIMARY) where email=?";
		boolean loginSuccess =false;
		boolean admin=false;
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			
			if(!rs.next()) {
				loginSuccess = false;
				
			}
			else {
				if(rs.getString(2).equals(password)) {
					loginSuccess= true;
					admin=rs.getBoolean(3);
				}
				else {
					loginSuccess= false;
				}
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		if(loginSuccess&& admin) return 1;
		else if(loginSuccess) return 0;
		else return -1;
	}
}
