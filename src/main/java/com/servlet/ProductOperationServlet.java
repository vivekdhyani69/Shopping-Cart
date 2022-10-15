package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.Part;
import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.DAO.UserDao;
import com.Entity.Category;
import com.Entity.Product;
import com.Entity.User;
import com.helper.FactoryProvider;

//it means ye hmare multipart vale form ko be accept kr paye like images and videos ko be

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {

			try {

				//// Servlet2 :
				// Add Category
				// Add Product
				// bcz iss servlet me humne dono Category and Product ka data save krana hai
				/// Fistlly descide kaam addCategory vala krna hai ya addProduct vala

				String op = request.getParameter("operation");
				// jesa call kia operation then vo value addcategory de dega then condition true
				// and addCategory vale form ka data fetch

				if (op.trim().equals("addcategory")) {
					// addCategory
					// fetching category data
					// fetching caetegory data
					String title = request.getParameter("catTitle");
					String description = request.getParameter("catDescription");

					// category ka object me set kr dia dono filhaal
					Category category = new Category();
					category.setCategoryTitle(title);
					category.setCategoryDescription(description);

					/// makes object of categoryDao ka and pass value of CategoryDao class k
					/// variable ki

					CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

					int catId = categoryDao.saveCategory(category);

					// out.println("Category saved");
//ab admin.jsp pe successfuly ka msg dikhana hai with the help of session then used again message.jsp yaha phele se session bna hua hai
//bs humne yha se value set krni hai vaha jayegi and admin.jsp me sara soda include kr dege

					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Category added succefully");
					response.sendRedirect("admin.jsp");
					return;

				} else if (op.trim().equals("addproduct")) {
					/// Add Product
					// Work
					String pName = request.getParameter("pName");
					String pDesc = request.getParameter("pDesc");
					int pPrice = Integer.parseInt(request.getParameter("pPrice"));
					int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
					int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
					int catId = Integer.parseInt(request.getParameter("catId"));
					Part part = request.getPart("pPic");

					// Makes a Project object and then saved it all the details
					Product p = new Product();
					p.setpName(pName);
					p.setpDesc(pDesc);
					p.setpPrice(pPrice);
					p.setpDiscount(pDiscount);
					p.setpQuantity(pQuantity);
					p.setpPhoto(part.getSubmittedFileName());

					// getcategory by ID
					// CategoryDao me function bna dia hai use use krege

					CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
					Category category = cdao.getCategoryById(catId);// hmare pass category ki id thi then humne function
																	// banya catDao me and vo hume category de dega

					// and then saved category

					p.setCategory(category);
					// Now hume ab product ko save krana hai then ProductDao bnao and usme save krao

					ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
					
					//pic Upload
					//find out the path to upload photo
					
			pdao.saveProduct(p);
//			out.println	("Product save success......");
//Yaha ye file.separator (/) slash dene k lia url me and and yaha hum image manually dalvayege and then getSubmittedFileName se hum img ka name get krege jo ki manually dalvaya hai
					
String path=request.getRealPath("img") + File.separator + "product" +  File.separator + part.getSubmittedFileName();

System.out.println(path);

//Uploading code
try {
	
FileOutputStream fos=new FileOutputStream(path);//Yaha path dalva dia
	
	InputStream is=part.getInputStream();//That is read out data
	
	//reading data
	byte[] data=new byte[is.available()];//main photo ka content data me hai
//byte gives the size of (is)  and makes size fo photo kitno size ki pic hai
	
	is.read(data);
	
	//read k baad write kara dia file me
	fos.write(data);
	
	fos.close();
	
	
}catch(Exception e) {
	e.printStackTrace();
	
}
					 HttpSession httpSession=request.getSession();
					  httpSession.setAttribute("message","Product added succefully");
					  response.sendRedirect("admin.jsp");
					 return;
					 }

			} catch (Exception e) {

				e.printStackTrace();

			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);
	}

}
