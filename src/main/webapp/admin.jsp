<!-- Ye admin.jsp ka page pe jane se phle yaha java ki coding me likho ki session
me current user hai kya nhi agr hai toh null toh nhi if(null) hai then redirect login page
 -->	

<%@page import="java.util.Map"%>
<%@page import="com.helper.Helper"%>
<%@page import="com.Entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CategoryDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.Entity.User"%>

<%

User user=(User)session.getAttribute("current_user");//that is return userki koi id db se nikal k db se nikalne ki coding loginServlet page me hai
		

if(user==null){//means current user me kuch nhi hai
	session.setAttribute("message", "You are not logged in !! login first");
	response.sendRedirect("login.jsp");
	return;//ye hote he niche ka kuch nhi chlega
	
}else{//if user hai email dali hai then and if normal ki ho tb ya admin ki ho tb
	
	if(user.getUserType().equals("normal")){//if normalPeople acces kr raha hai toh
		session.setAttribute("message", "You are not admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
		
	}
	
	
}


%>
<!-- ye list of category fetch kri ab ise last me dekhna -->
     <%
     //firstly makes a object of CategoryDao and then object ki help se uska function use karo jaha list nikal rkhh rkhi Category ki
     //ku ki vhi db operation hore 
    CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
    List<Category> list= cdao.getCategories();//yaha sari category aa gyi
     
    //getting count
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory()); 
    
     %>
     

<!-- simple admin page ki coding jo admin me dikhana hai -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-Panel</title>

<%@include file="Components/common_css_js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>
<!-- yaha admin likhte he css me editing karo -->
<div class="container admin"> 

<div class="container-fluid mt-3">
<%@include file="Components/message.jsp" %>
</div>

<div class="row mt-4">

<!-- first box -->
<div class="col-md-4">
<div class="card">
<div class="card-body text-center">
<div class="container ">
<img style="max-width:130px;" class="rounded-circle img-fluid" src="img/man.png" rel>
</div>
<h1><%=m.get("userCount") %></h1>
<h1 class="text-muted">USER</h1>
</div>
</div>

</div>

<!-- second box -->
<div class="col-md-4">
<div class="card">
<div class="card-body text-center">

<div class="container">
<img style="max-width:130px;" class="rounded-circle img-fluid" src="img/list.png" rel>
</div>
<h1><%=list.size() %></h1>
<h1 class="text-muted">CATEGORIES</h1>
</div>

</div>

</div>
<!-- third box -->
<div class="col-md-4">	
<div class="card">
<div class="card-body text-center">
<div class="container">
<img style="max-width:130px;" class="rounded-circle img-fluid" src="img/products.png" rel>
</div>
<h1><%=m.get("productCount") %></h1>
<h1 class="text-muted">PRODUCTS</h1>
</div>

</div>

</div>


</div>

<!-- ////////////////////////////////2nd Row////////////////////////////// -->

<div class="row mt-3">
<div class="col-md-6">
<div class="card" data-toggle="modal" data-target="#exampleModal">
<div class="card-body text-center">
<div class="container">
<img style="max-width:130px;" class="rounded-circle img-fluid" src="img/calculator.png" rel>
</div>

<h1 class="text-muted">ADD CATEGORIES</h1>
</div>

</div>
</div>
 
 <!-- ///2nd box -->
<div class="col-md-6">
<div class="card" data-toggle="modal" data-target="#add-product-model" >
<div class="card-body text-center">
<div class="container">
<img style="max-width:130px;" class="rounded-circle img-fluid" src="img/plus.png" rel>
</div>

<h1 class="text-muted">ADD PRODUCT</h1>
</div>

</div>
</div>

</div>
</div>

<!--Add Product Modal jo toggle kr k khulega uper se-->
<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom_bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
       <!--  Makes Form -->
      <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      
  <!-- that input hidden value is used -->
       
       <input type="hidden" name="operation" value="addproduct" />
       <!--Product title -->
       
       <div class="form-group">
       <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required/>
       </div>
       
       <!-- Product Description -->
       
       <div class="form-group pt-2">
      <textarea class="form-control" style="height: 150px" placeholder="Enter Product Description" name="pDesc" required></textarea>
       </div>
       
     <!-- Product Price -->
       
        <div class="form-group pt-2">
       <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required/>
       </div>
       
       <!-- Product Discount -->
       
        <div class="form-group pt-2">   <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount " required/>
       </div>
       
        <div class="form-group pt-2">
   <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity " required/>
       </div>
       
     <!--  Important ye dropdown categories ka hai ye direct database se ayegi ki ye product kon se category me rkhna hai  -->
     
     <!-- Product Category value Db se Dynamic ani chaiye -->
     
       <div class="form-group pt-2">
  <select name="catId" class="form-control" id="">
  
  <% for(Category c:list) { //ek ek kr k c. se get kr dia dynamicaly data%>
 
  <option value="<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
 
  <% }%>
 
  </select>
       </div>
       
      <!--  Product Image -->
      <div class="form-group mt-3">
      <label for="pPic">Select Picture of Product</label><br>
      <input type="file" id="pPic" name="pPic" required />
      </div>
       
       
       <div class="container text-center pt-2">
       <button type="submit" class="btn btn-outline-success">Add Product</button>
       
       </div>
       </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- End Add PRODUCT MODEL -->


 <!-- Add Category Model   -->
<!-- Start Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom_bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill categories details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
       <!--  Makes Form -->
       <form action="ProductOperationServlet" method="post">
       
      <!--  //That code is skim jo ki Category and product dono form data
       //Condition wize servlet pe bhejega jiski value eqal hogi addCategory se tb ye form ka data db me bhejege
       and jb nich addProduct ki value equal hogi then fr is form ka data-->
     
     <input type="hidden" name="operation" value="addcategory">  
       
       
       <div class="form-group">
       <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
       </div>
       
       <div class="form-group pt-1">
      <textarea  style="height:300px" class="form-control" placeholder="Enter categories description" name="catDescription" required></textarea>
       </div>
       
       <div class="container text-center pt-2">
       <button type="submit" class="btn btn-outline-success">Add Category</button>
       
       </div>
       </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- End Category model -->
<%@include file="Components/common_modal.jsp" %>
</body>
</html>