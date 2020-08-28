package bean;

import java.sql.Timestamp;

public class TransactionBean {
	String tdesc,temail,tamount;
	Timestamp tdate;
	int tid;
	String status;
	
	
	
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public TransactionBean() {
		super();
	}

	public TransactionBean( String tdesc, String temail, String tamount, Timestamp tdate) {
		super();
		
		this.tdesc = tdesc;
		this.temail = temail;
		this.tamount = tamount;
		this.tdate = tdate;
	}
	public TransactionBean( String tdesc, String temail, String tamount, Timestamp tdate,String status) {
		super();
		
		this.tdesc = tdesc;
		this.temail = temail;
		this.tamount = tamount;
		this.tdate = tdate;
		this.status=status;
	}


	public String getTdesc() {
		return tdesc;
	}

	public void setTdesc(String tdesc) {
		this.tdesc = tdesc;
	}

	public String getTemail() {
		return temail;
	}

	public void setTemail(String temail) {
		this.temail = temail;
	}

	public String getTamount() {
		return tamount;
	}

	public void setTamount(String tamount) {
		this.tamount = tamount;
	}

	public Timestamp getTdate() {
		return tdate;
	}

	public void setTdate(Timestamp tdate) {
		this.tdate = tdate;
	}
	
	
}
