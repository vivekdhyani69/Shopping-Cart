<!-- //coding:- session ki value dikhane k lia jb be data save hua -->
<%
 String message=(String) session.getAttribute("message");//yaha bas key deni hai value khud print
	if(message!=null){
		
	
		%>
		<!-- //print msg jo screen pe dikhana hai
		//out.println("Successfully !!");
		
		///////////Bootstrap ki alert coding -->
		
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%= message%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
  </button>
</div>
	
		 	
		<%
		//hume ek he br msg dikhana hai page pe then sessionRemoved
		session.removeAttribute("message");
	}

%>