package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import dao.LoginDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String email= request.getParameter("loginEmail").toString();
		String password=request.getParameter("loginPassword");
		PrintWriter pw=response.getWriter();
		
		UserBean loginUser = new UserBean();
		response.setContentType("text/html");
		loginUser.setEmail(email);
		loginUser.setPassword(password);
		if(email.equals("checker@gmail.com")&&password.equals("checker")){
			HttpSession session = request.getSession();
			session.setAttribute("currUser", email);
			request.getRequestDispatcher("/checker.jsp").forward(request, response);
		}
		LoginDAO attempt = new LoginDAO();
		int status = attempt.loginUser(loginUser);
		if(status==0) {
			HttpSession session = request.getSession();
			session.setAttribute("currUser", email);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		}
		else if(status==1) {
			HttpSession session = request.getSession();
			session.setAttribute("currUser", email);
			request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
		}
		else {
			pw.write("Failed\n");
			pw.println("try again <a href='index.jsp'>here</a>");
		}
	}

}
