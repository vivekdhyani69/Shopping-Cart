
<%
//agr user login nhi hai toh checkout page access nhi krta vhi se return and redirect firstlly login
User user=(User)session.getAttribute("current_user");
if(user==null){//means current user me kuch nhi hai
	session.setAttribute("message","login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;//ye hote he niche ka kuch nhi chlega
	
}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="Components/common_css_js.jsp" %>
</head>

<body>
<%@include file="Components/navbar.jsp" %>

<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<!-- card details -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-4">Your Selected items</h3>

<div class="cart-body">


</div>	
</div>
</div>


</div>
<div class="col-md-6 ">
<!-- form details -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-4">Your details for order</h3>
	
	<form action="#!">

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="name">Your name</label>
    <input value="<%= user.getUserName() %>"   type="text" class="form-control" id="name" placeholder="Your name">
  </div>


 <div class="form-group">
    <label for="exampleFormControl">Enter your Contact</label>
    <input value="<%= user.getUserPhone() %>"  class="form-control" id="exampleFormControl" placeholder="Your contact"></input>
  </div> 

 <div class="form-group">
    <label for="exampleFormControlTextarea1">Enter your address</label>
    <textarea value="<%= user.getUserAddress() %>"  class="form-control" id="exampleFormControlTextarea1" rows="3" cols=""></textarea>
  </div>
 
  <div class="container text-center mt-3">
  <button class="btn btn-outline-success">Order</button>
   <button class="btn btn-outline-primary">Continue Shopping</button>
  </div>
</form>
	
</div>
</div>


</div>


</div>
</div>

<%@include file="Components/common_modal.jsp" %>
</body>
</html>