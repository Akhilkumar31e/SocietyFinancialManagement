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
 * Servlet implementation class TransactServlet
 */
@WebServlet("/TransactServlet")
public class TransactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		if(session!=null&&session.getAttribute("currUser")!=null) {
			
			String email = (String)session.getAttribute("currUser");
			String amount= String.valueOf(request.getSession().getAttribute("payment"));
			String desc ="Maintainence";
			Timestamp ts=new Timestamp(System.currentTimeMillis());
			TransactionBean  tb=new TransactionBean(desc,email,amount,ts);
			System.out.println(amount);
			NewPaymentDAO newPayment=new NewPaymentDAO();
			
			boolean isSuccess = newPayment.makePayment(tb);
			
			if(isSuccess) {
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Payment made successfully');");
				pw.println("location='paymentgateway.jsp';");
				pw.println("</script>");
				request.getRequestDispatcher("/home.jsp").forward(request, response);
			}
			else {
				pw.println("Please try again,there was an issue <a href='home.jsp'>Try again</a>");
			}
		}
		else {
			pw.println("Please login to pay, login <a href='index.jsp'>here</a>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
