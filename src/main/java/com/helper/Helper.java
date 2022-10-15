package com.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Helper {

	//Makes a function jo ki description k 10 words he return kr dega beshk 1000 he ku na ho
	
	
	public static String get10Words(String desc) {
		
		String[] strs=desc.split(" ");
		
		if(strs.length >10) {
			 String res="";
			for(int i=0;i<10;i++) {
				
				res=res+strs[i]+" ";//1- he word lega
			}
			return (res+"...");
		}else {
			
			//agr 10 se kam word hoge toh vhi same string return kr dega
			return (desc + "...");
		}
		
	
	}
	
	public static Map<String,Long> getCounts(SessionFactory factory){
		
		Session session=factory.openSession();
		String q1="Select count(*)from User";
		String q2="Select count(*)from Product";
		
		Query query1=session.createQuery(q1);
		Query query2=session.createQuery(q2);
		
		Long userCount=(Long) query1.list().get(0);
		Long productCount=(Long) query2.list().get(0);
		Map<String , Long> map=new HashMap<>();
		//ye put kr dega data web pe
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		session.close();
		return map;
		
	}
}
