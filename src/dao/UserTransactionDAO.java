package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import bean.TransactionBean;
import bean.UserBean;
import util.DBConnection;

public class UserTransactionDAO {
public ArrayList<TransactionBean> getTransactions(String email) {
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select * from transactions where email=?";
		ArrayList<TransactionBean> result = new ArrayList<>();
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				TransactionBean details =new TransactionBean();
				int tid = rs.getInt(1);
				String tdesc = rs.getString(2);
				Timestamp tdate = rs.getTimestamp(4);
				String amount =String.valueOf(rs.getInt(5));
				details.setTamount(amount);
				details.setTemail(email);
				details.setTid(tid);
				details.setTdesc(tdesc);
				details.setTdate(tdate);
				result.add(details);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	
	}
public ArrayList<TransactionBean> getMonthTransactions(int month,int year) {
	
	Connection con= null;
	PreparedStatement stmt=null;
	String sqlQuery = "select * from transactions where MONTH(date)=? and YEAR(date)=?";
	ArrayList<TransactionBean> result = new ArrayList<>();
	try {
		con = DBConnection.createConnection();
		
		stmt= con.prepareStatement(sqlQuery);
		stmt.setInt(1, month);

		stmt.setInt(2, year);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			TransactionBean details =new TransactionBean();
			int tid = rs.getInt(1);
			String tdesc = rs.getString(2);
			Timestamp tdate = rs.getTimestamp(4);
			String amount =String.valueOf(rs.getInt(5));
			String email=rs.getString(3);
			details.setTamount(amount);
			details.setTemail(email);
			details.setTid(tid);
			details.setTdesc(tdesc);
			details.setTdate(tdate);
			result.add(details);
		}
		con.close();
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return result;

}

public ArrayList<UserBean> getDelayUsers() {
	
	Connection con= null;
	PreparedStatement stmt=null;
	String sqlQuery = "select distinct(transactions.email)  from users,transactions where transactions.amount>? ;";
	ArrayList<UserBean> result = new ArrayList<>();
	try {
		con = DBConnection.createConnection();
		
		stmt= con.prepareStatement(sqlQuery);
		stmt.setInt(1, 5000);
		
		ResultSet rs = stmt.executeQuery();
		UserDAO user = new UserDAO();
		while(rs.next()) {
			String email=rs.getString(1);
			UserBean temp= user.getUserDetails(email);
			result.add(temp);
		}
		con.close();
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return result;

}
public ArrayList<TransactionBean> getAllTransactions() {
	
	Connection con= null;
	PreparedStatement stmt=null;
	String sqlQuery = "select * from transactions";
	ArrayList<TransactionBean> result = new ArrayList<>();
	try {
		con = DBConnection.createConnection();
		
		stmt= con.prepareStatement(sqlQuery);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			TransactionBean details =new TransactionBean();
			int tid = rs.getInt(1);
			String tdesc = rs.getString(2);
			String email = rs.getString(3);
			Timestamp tdate = rs.getTimestamp(4);
			String amount =String.valueOf(rs.getInt(5));
			details.setTamount(amount);
			details.setTemail(email);
			details.setTid(tid);
			details.setTdesc(tdesc);
			details.setTdate(tdate);
			result.add(details);
		}
		con.close();
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return result;

}
	public long getTotal() {
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select SUM(amount) from transactions";
		long amount=0;
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {

				amount=rs.getLong(1);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return amount;
	}
	public long getOutwardTotal() {
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select SUM(amount) from outwardpayments where status=?";
		long amount=0;
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			
			stmt.setString(1, "accepted");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {

				amount=rs.getLong(1);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return amount;
	}
	public ArrayList<TransactionBean> getPendingOutwardPayments() {
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select * from outwardpayments where status=?";
		ArrayList<TransactionBean> result = new ArrayList<>();
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, "pending");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				TransactionBean details =new TransactionBean();
				int tid = rs.getInt(1);
				String tdesc = rs.getString(2);
				String email = rs.getString(6);
				Timestamp tdate = rs.getTimestamp(3);
				String status=rs.getString(4);
				String amount =String.valueOf(rs.getInt(5));
				details.setTamount(amount);
				details.setTemail(email);
				details.setTid(tid);
				details.setTdesc(tdesc);
				details.setTdate(tdate);
				details.setStatus(status);
				result.add(details);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
public ArrayList<TransactionBean> getAcceptedOutwardPayments() {
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select * from outwardpayments where status=?";
		ArrayList<TransactionBean> result = new ArrayList<>();
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, "accepted");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				TransactionBean details =new TransactionBean();
				int tid = rs.getInt(1);
				String tdesc = rs.getString(2);
				String email = rs.getString(6);
				Timestamp tdate = rs.getTimestamp(3);
				String status=rs.getString(4);
				String amount =String.valueOf(rs.getInt(5));
				details.setTamount(amount);
				details.setTemail(email);
				details.setTid(tid);
				details.setTdesc(tdesc);
				details.setTdate(tdate);
				details.setStatus(status);
				result.add(details);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
public ArrayList<TransactionBean> getStatusPayments(String email,String status) {
		
		Connection con= null;
		PreparedStatement stmt=null;
		String sqlQuery = "select * from outwardpayments where email=? and status=?";
		ArrayList<TransactionBean> result = new ArrayList<>();
		try {
			con = DBConnection.createConnection();
			
			stmt= con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			stmt.setString(2, status);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				TransactionBean details =new TransactionBean();
				int tid = rs.getInt(1);
				String tdesc = rs.getString(2);
				
				Timestamp tdate = rs.getTimestamp(3);
				
				String amount =String.valueOf(rs.getInt(5));
				details.setTamount(amount);
				details.setTemail(email);
				details.setTid(tid);
				details.setTdesc(tdesc);
				details.setTdate(tdate);
				details.setStatus(status);
				result.add(details);
			}
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
	
	public boolean updateStatus(int id,String status) {
		Connection con =null;
		PreparedStatement ps=null;
		
		Timestamp currTime=new Timestamp(System.currentTimeMillis());
		
		String sqlQuery = "update outwardpayments SET date=?,status=? where transactionid=? ";
		
		try {
			con = DBConnection.createConnection();
			
			ps=con.prepareStatement(sqlQuery);
			
			ps.setTimestamp(1, currTime);
			ps.setString(2, status);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			con.close();
			if(i!=0) return true;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
