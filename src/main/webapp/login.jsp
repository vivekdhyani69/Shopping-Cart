<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-MyCart</title>
<%@include file="Components/common_css_js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<!-- Makes Card -->
<div class="card mt-3">
<!-- Header -->
<div class="card-header custom_bg text-white">
<h3 class="text-center">Login here</h3>
</div>
<!-- Body -->
<div class="card-body">

<!-- Yaha humne uper msg print kraya agr details glt hai login ki then invlaid 
with the help of UserDao class and LoginServlet-->
<%@include file="Components/message.jsp" %>

<form action="LoginServlet" action="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="register.jsp" class="text-center d-block mb-2">If not register click here</a>
  
 <div class=" container text-center mt-3">
  <button type="submit" class="btn btn-primary custom_bg border-0 ">Submit</button>
   <button type="reset" class="btn btn-primary custom_bg border-0">Reset</button>
  </div>
</form>
</div>



</div>

</div>

</div>

</div>

</body>
</html>