package com.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.Entity.User;

public class UserDao {

	///Coding of All Database configuration
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {//Makes constructor ye factory ko initialize krega means const ki help se isme koi value aa skti hai
		
		//Ab jb be hum object bnayege UseDao ka then hume usme Session dena hoga
		this.factory = factory;
	}
	
	
	//Get user by email and password
//MAKES amethod jo ki email and password lega an user return krega
//and user nhi hoga then vo return krega null value	
	
	public User getUserByEmailAndPassword(String email,String password) {
		
		User user=null;
		//Fire querie user get krna hai iss email and password ka
		try {
			///Hql Query User class me se userEmail and userPass ko 
//jo is fun me pass kia hai email and pass se match kraya match krega to user return kr dega nhi to return
			
//This query is condition Authenticate ki
	String query="from User where userEmail =: e and userPassword=:p ";		
		
	Session s=this.factory.openSession();
	Query q=s.createQuery(query);
	q.setParameter("e",email);
	q.setParameter("p",password);
	
	
	user=(User)q.uniqueResult();

	
	s.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		return user;
	}
}
