package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import bean.TransactionBean;
import util.DBConnection;


public class NewPaymentDAO {
	
	public boolean makePayment(TransactionBean tb) {
		
		Connection con =null;
		PreparedStatement ps=null;
		String email=tb.getTemail();
		Timestamp date=tb.getTdate();
		int amount = Integer.parseInt(tb.getTamount());
		String desc=tb.getTdesc();
		String sqlQuery = "insert into transactions values (NULL,?,?,?,?)";
		
		try {
			con = DBConnection.createConnection();
			
			ps=con.prepareStatement(sqlQuery);
			
			ps.setString(1,desc);
			ps.setString(2, email);
			ps.setTimestamp(3, date);
			ps.setInt(4, amount);
			
			int i = ps.executeUpdate();
			con.close();
			if(i!=0) return true;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean makeOutwardPayment(TransactionBean tb) {

		Connection con =null;
		PreparedStatement ps=null;
		String email=tb.getTemail();
		Timestamp date=tb.getTdate();
		int amount = Integer.parseInt(tb.getTamount());
		String desc=tb.getTdesc();
		String sqlQuery = "insert into outwardpayments values (NULL,?,?,?,?,?)";
		
		try {
			con = DBConnection.createConnection();
			
			ps=con.prepareStatement(sqlQuery);
			
			ps.setString(1,desc);
			ps.setTimestamp(2, date);
			ps.setString(3, "pending");
			ps.setInt(4, amount);
			ps.setString(5, email);
			
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
