<%@page import="com.helper.Helper"%>
<%@page import="com.DAO.CategoryDao"%>
<%@page import="com.Entity.Category"%>
<%@page import="com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My_Cart Home</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>

	<div class="row mt-3 mx-2">


		<%
		//Now makes a object jo ProducDao me banaya tha List of Products fetch krne k lia

		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		//ab iss object se vaha ka function  used 
		List<Product> list = null;

		/////////////////////////+++++++++++++++++++++++++//////////////
		//Now we makes object jo CategoryDao me bnaya tha list of Category fetch krne k lia
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();

		//yaha hum particular category vize product dege  
		String cat = request.getParameter("category");//ye category message hai jo humne url me dia hai

		if (cat == null) {

			list = dao.getAllProducts();//if agr category me kuch b paas nhi kia then fr be sare product milege
		}

		else if (cat.trim().equals("all")) {
			list = dao.getAllProducts();
			//agr cat equal hua all k then sare products dikhayege	  
		} else {

			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProductsById(cid);
		}
		%>


		<!-- show categories -->
		<div class="col-md-2  ">

			<div class="list-group mt-4 mx-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active"> All
					Products </a>




				<%
				for (Category c : clist) {
				%>

				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action "> <%=c.getCategoryTitle()%>
				</a>
				<%
				}
				%>
			</div>
		</div>



			<!-- Makes row inside col -->
			
				<!-- col jo akela 12 grid le raha hai -->
		
		
				

						<!-- Now traversing products -->

						<%
						for (Product p : list) {
						%>

						<!-- product card -->
<div class="col-md-4">
						<div class="card mt-2 product-card">
							<!-- Image lagao top pe -->

							<div class="container text-center">
								<img src="img/product/<%=p.getpPhoto()%>"
									style="max-height: 170px; max-width: 50%; width: auto">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(p.getpDesc())%>
								</p>
							</div>

							<div class="card-footer">
								<button class="btn custom_bg text-white"
									onclick="add_to_cart(<%=p.getpId()%> , '<%=p.getpName()%>' ,<%=p.getPriceAfterApplyDiscount()%>)">Add
									to Cart</button>
								<button class="btn btn-outline-success">
									&#8377;<%=p.getPriceAfterApplyDiscount()%>/- <span
										class="text-secondary discount-label vvk">&#8377;<%=p.getpPrice()%></span>,
									<span class="discount-label"><%=p.getpDiscount()%>-%off</span>
								</button>
							</div>



						</div>
</div>


						<%
						}

						///agr kisi ne category khali chor de product add nhi kia
						if (list.size() == 0) {

						out.println("<h1 class='text-center'>No item in this category</h1>");
						}
						%>
				
			
			

	</div>
	<%@include file="Components/common_modal.jsp"%>
</body>
</html>