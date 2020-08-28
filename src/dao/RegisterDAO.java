package dao;
import java.sql.*;

import bean.UserBean;
import util.DBConnection;

public class RegisterDAO {
	public boolean registerUser(UserBean userBean) {
		String username = userBean.getUsername();
		String email= userBean.getEmail();
		String mobile = userBean.getMobile();
		String password = userBean.getPassword();
		boolean admin = userBean.isAdmin();
		
		Connection con=null;
		PreparedStatement preparedStatement = null;
		
		try {
			con = DBConnection.createConnection();
            String query = "insert into users values (NULL,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, mobile);
            preparedStatement.setString(4, password);
            preparedStatement.setBoolean(5, admin);
            
            int i= preparedStatement.executeUpdate();
            con.close();
            if (i!=0)  //Just to ensure data has been inserted into the database
            return true; 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
