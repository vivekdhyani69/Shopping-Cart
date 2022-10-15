package com.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entity.Category;

public class CategoryDao {
private SessionFactory factory;

public CategoryDao(SessionFactory factory) {//that is constructor then object me iski value pass krani pdegi
	
	
	this.factory=factory;
	
}

	//saves the category to db
    public int saveCategory(Category cat) {//ye method category ko save kr dega
	Session session= this.factory.openSession();
    Transaction tx=	session.beginTransaction();
	
    int catId=(int) session.save(cat);///object save category ka	and ye return kr dega id vha ki p.k
	
    tx.commit();
    session.close();
	
	
	return catId ;
	
	
}
    
    ///Dynamic Category-data aye db se product vale form  me
    //then makes a list  function isme sari caetgory aa jayegi
    
    public List<Category> getCategories(){
    	
    Session s=	this.factory.openSession();
    	Query q=s.createQuery("from Category");
    	List<Category> list=q.list();//fire this query
    
    	return list;
    }
    
    
    public Category getCategoryById(int catId) {
    	Category cat=null;
    	try {
    		Session session=this.factory.openSession();//uper vala factory
    		
    		//that is retrun product of category
    		 cat=session.get(Category.class,catId);
    		session.close();
    		
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return cat;
    }


}
