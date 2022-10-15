package com.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entity.Category;
import com.Entity.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {//that is constructor then object me iski value pass krani pdegi
		
		
		this.factory=factory;
		
	}

	    public boolean saveProduct(Product product) {//ye method category ko save kr dega
		boolean f=false;
	    	try {
			
			Session session= this.factory.openSession();
		    Transaction tx=	session.beginTransaction();
			session.save(product);
		   	
		    tx.commit();
		    session.close();
		    f=true;

		}catch(Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
		
		
	}
	    
	//Get All Products function makes and then jo ye db se return krega use index.jsp me dikhayef    
	
	    public List<Product> getAllProducts(){
	    	
	    	//get session from factory
	    	Session s=this.factory.openSession();
	    	
	    	//db se product fetch krane ki query
	    	Query query=s.createQuery("from Product");
	    	//and then fires
	    	List<Product> list=query.list();
	    	
			return list;
	    	
	    	
	    	
	    }
	
	//get all products of given category
	
 public List<Product> getAllProductsById(int cid){
	    	
	    	//get session from factory
	    	Session s=this.factory.openSession();
	    	
	    	//ye query caetgory wize product list kara degi
	    	Query query=s.createQuery("from Product as p where p.category.categoryId =: id");
	    	
	    	///and yaha id k ander jo web pe category click ki hai uski id aa jayegi 
	    	query.setParameter("id",cid);
	    	
	    	//and then fires
	    	List<Product> list=query.list();
	    	
			return list;
	    	
	    	
	    	
	    }
}
