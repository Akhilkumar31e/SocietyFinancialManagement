package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.TransactionBean;
import dao.NewPaymentDAO;

/**
 * Servlet implementation class OutwardServlet
 */
@WebServlet("/OutwardServlet")
public class OutwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutwardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		if(session!=null&&session.getAttribute("currUser")!=null) {
			
			String email = (String)session.getAttribute("currUser");
			String amount= request.getParameter("amount");
			String desc =request.getParameter("desc");
			Timestamp ts=new Timestamp(System.currentTimeMillis());
			TransactionBean  tb=new TransactionBean(desc,email,amount,ts,"pending");
			System.out.println(amount);
			NewPaymentDAO newPayment=new NewPaymentDAO();
			
			boolean isSuccess = newPayment.makeOutwardPayment(tb);
			
			if(isSuccess) {
				pw.println("<h2>Successfully requested for payment ,please click <a href='outwardPayment.jsp'>here </a> to request another payment or click <a href='adminhome.jsp'>here </a> to go HOME");
				
			}
			else {
				pw.println("Please try again,there was an issue <a href='home.jsp'>Try again</a>");
			}
		}
		else {
			pw.println("Please login to pay, login <a href='index.jsp'>here</a>");
		}
	}

}
