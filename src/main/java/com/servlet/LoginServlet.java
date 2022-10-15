package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.Entity.User;
import com.helper.FactoryProvider;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out=response.getWriter()){
			
			try {
				
				///Coding Area:- Fetch Data Jsp page se sara
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				
				//Validations
				
				///Authentication
			//ab yaha UserDao class ka object bana do bcz vo non-static hai and retruns kro 
			//User ka email and
			UserDao userDao=new UserDao(FactoryProvider.getFactory());
		
			//user return kr dega
			User user=userDao.getUserByEmailAndPassword(email, password);//yhi method check krega apne fnction ko value
			//deke ki login vala jo ye data hai kya ye db me hai same or vo checking DAO class kregi & last me return krdega object hoga toh nhi toh invalid
			
	
			//System.out.println(user);//firstlly checks user kya mila hai and then fr processing
			
			HttpSession httpSession=request.getSession();//Firstly get Session
				//Condition 
			if(user==null) {
				
				out.println("<h1>Invalid detalis</h1>");
				//and then hume ye msg login page me he dikhana hai ab yaha session ki help se
	//now set and key message rkhni hai taki vha be fetch kr paye msg component
				httpSession.setAttribute("message","Invalid Details !! Try with another one.");
				response.sendRedirect("login.jsp");
				return; //is se age chle he na yhi se return
				}
			else {
				
				out.println("<h1> Welcome " + user.getUserName()+  "</h1>");
			//agr data match krega db se then data 2-Jsp page pe bhejege
		//1.Admin Page 2.NormalPeople
///Makes HttpSession jo ki apne pass login ki details save kre rkhega
httpSession.setAttribute("current_user", user);//isme current user ki value hai agr yaha se hat gyi then logOut ya browser se removed

		
		if(user.getUserType().equals("admin")) {
			//1 Admin.jsp pe phocha de
			response.sendRedirect("admin.jsp");
			out.println("admin page");
			
		}else if(user.getUserType().equals("normal")){
			response.sendRedirect("normalPeople.jsp");
			
		}else {
			
			out.println("We have not identified user type");
		}
			
			}
				
			}
			catch(Exception e) {
				
				
			e.printStackTrace();
			
		
	}
		}
	}

	  protected void doGet(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
		  processRequest(request,response);
	  
	  }
	  
	  
	  protected void doPost(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
		  processRequest(request,response);
	 }


	 
}
