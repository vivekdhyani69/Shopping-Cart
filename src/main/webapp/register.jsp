<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="Components/common_css_js.jsp" %>

</head>
<body>
<%@include file="Components/navbar.jsp" %>

<div class="container-fluid">
<div class="row mt-3">	
<div class="col-md-4 offset-md-4">

     <div class="card">
     <%-- pura form card me dal do boundary achi lgegi --%>
     <%@include file="Components/message.jsp" %>
     <div class="card-body mx-2">
     
     <h4 class="text-center my-3">Sign up here !!</h4>
<form action="RegistrationServlet" method="post">
<!--form me ye action likhte he ye form ka sara data action vali file me jyega -->
<div class="form-group">

 <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" placeholder="Enter Name" id="name" aria-describedby="emailHelp" placeholder="User Name">
  </div> 
  
  <div class="form-group">
 <label for="email">User Email</label>
    <input name="user_email" type="email" class="form-control" placeholder="Enter email" id="name" aria-describedby="emailHelp" placeholder="User Name">
  </div>
  
  <div class="form-group">
 <label for="password">User Password</label>
    <input name="user_password" type="password" class="form-control" placeholder="Enter Password" id="name" aria-describedby="emailHelp" placeholder="User Name">
  </div>
  
  <div class="form-group">
 <label for="phone">User Phone</label>
    <input name="user_number" type=number"" class="form-control" placeholder="Enter Number" id="name" aria-describedby="emailHelp" placeholder="User Name">
  </div>
  
  <div class="form-group">
 <label for="address">User Address</label>
    <textarea name="user_address" style="height:140px"  class="form-control" placeholder="Enter Your Address"></textarea>
  </div>
  
  <!-- Makes Buttons -->
  <div class="container text-center mt-3">
  <button class="btn btn-outline-success">Register</button>
   <button class="btn btn-outline-warning">Reset</button>
  </div>
</form>
     </div>
     
     </div>
    

</div>
</div>

</div>

</body>
</html>