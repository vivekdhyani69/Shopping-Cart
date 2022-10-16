package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.PrintWriter
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.User;
import com.helper.FactoryProvider;


public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	protected void processRequest(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("text/html;charset=UTF-8");
			
		try(PrintWriter out=response.getWriter()){
			
			try {
//Firstly form ka sara data yaha submit krana hai form k action me iss file ka url deke
//Now we fetch all inputs data in this file easily 
				
				String userName=request.getParameter("user_name");
				String userEmail=request.getParameter("user_email");
				String userPassword=request.getParameter("user_password");
				String userPhone=request.getParameter("user_number");
				String userAddress=request.getParameter("user_address");
				
		//Hum Validation be laga skte hai
				
				if(userName.isEmpty()) {
					
					out.println("Name is Blank");
					return;
				}
//Creating user object to store data!!
//Ab yaha jo be form ka data aya hai register.jsp se use Hibernate(db) pe
				//Stored krdo
User user=new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");

///Now Hibernate me data save kesa krege used session

     Session s=FactoryProvider.getFactory().openSession();
     Transaction tx=s.beginTransaction();//Physically Chnged
              
     int userId=(int) s.save(user);  
     

    tx.commit();
     s.close();

    ///Makes http ka session msg print krne k lia
     HttpSession httpSession=request.getSession();
     httpSession.setAttribute("message","Registration Successfully !!"+ userId);
     response.sendRedirect("register.jsp");
     return;//is se age kuch na chle terminates
     
     
     
			}
			catch(Exception e) {
				
				e.printStackTrace();
			}
				
			
		}
		
		
	}
 
    public RegistrationServlet() {
        super();
       
    }

	//sari coding processRequest me he hogi if doGet call hoga tb be 
 //processRequest call hoga and doPost call hoaga tb be processRequest call hoga
    
	
	  protected void doGet(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
		  processRequest(request,response);
	  
	  }
	  
	  
	  protected void doPost(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
		  processRequest(request,response);
	 }
	 
}
