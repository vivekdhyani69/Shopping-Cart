<!-- Ye admin.jsp ka page pe jane se phle yaha java ki coding me likho ki session
me current user hai kya nhi agr hai toh null toh nhi if(null) hai then redirect login page
 -->	

<%@page import="com.Entity.User"%>
<%

User user=(User)session.getAttribute("current_user");//that is return userki koi id db se nikal k db se nikalne ki coding loginServlet page me hai
		

if(user==null){//means current user me kuch nhi hai
	session.setAttribute("message", "You are not logged in !! login first");
	response.sendRedirect("login.jsp");
	return;//ye hote he niche ka kuch nhi chlega
	
}else{//if user hai email dali hai then and if normal ki ho tb ya admin ki ho tb
	
	if(user.getUserType().equals("admin")){//if normalPeople acces kr raha hai toh
		session.setAttribute("message", "You are not user !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
		
	}
	
	
}


%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Components/common_css_js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>



</body>
</html>