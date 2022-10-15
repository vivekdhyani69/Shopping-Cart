<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Create Session factory Session Object</h1>
<%
	out.println(FactoryProvider.getFactory());//ab ye factory helper vali file se object get kr lega

%>
</body>
</html>