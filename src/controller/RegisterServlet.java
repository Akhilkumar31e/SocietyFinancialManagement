package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import dao.RegisterDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String email= request.getParameter("email").toString();
		String mobile = request.getParameter("mobile").toString();
		String password = request.getParameter("password");
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		boolean admin = false;
		
		UserBean newUser = new UserBean(username,password,email,mobile,admin);
		
		RegisterDAO attempt = new RegisterDAO();
		
		boolean success = attempt.registerUser(newUser);
		
		if(success) {
			pw.println("Successfully registered");
			pw.println("Login <a href='index.jsp'>here</a>");
		}
		else {
			pw.println("Failed,");
			pw.println("User already exists,Login <a href='index.jsp'>here</a>");
		}
	}

}
