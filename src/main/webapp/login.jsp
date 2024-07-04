<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rubrica.Database" %>
<% 
Database db=new Database((String)session.getAttribute("dbhost"),(String)session.getAttribute("dbport"),(String)session.getAttribute("dbname"),(String)session.getAttribute("dbuser"), (String)session.getAttribute("dbpassword"));
if(db.DatabaseConnectionTest() == 0){
	response.sendRedirect("index.jsp");
	return;
}
String username=request.getParameter("username");
String password=request.getParameter("password");
if(username!=null && password!=null){
	if(db.userLogin(username, password) > 0){
		session.setAttribute("username", username); 
		session.setAttribute("password", password); 
		response.sendRedirect("lista.jsp");
		return;
	}	
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login page</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		<script>
	        function togglePassword() {
	            var passwordField = document.getElementById("password");
	            var showPasswordCheckbox = document.getElementById("showPassword");
	            if (showPasswordCheckbox.checked) {
	                passwordField.type = "text";
	            } else {
	                passwordField.type = "password";
	            }
	        }
	    </script>
	</head>
	<body>
	<h1 class="text-center text-danger">Inserisci i dati per accedere all'applicazione</h1>
		<form action="login.jsp" class="text-center mx-auto" style="width: 50%;" method="post">
			<div class="form-group">
			    <label for="username">Username:</label>
				<input class="form-control" type="text" name="username" id="username" required>
			</div>
			<div class="form-group">
                <label for="password">Password:</label>  
                <input class="form-control" type="password" name="password" id="password" required> 
                   <input type="checkbox" class="form-check-input" id="showPassword" onclick="togglePassword()">
                   <label class="form-check-label" for="showPassword">Mostra Password</label>       
            </div>
			
			<button type="submit" class="btn btn-primary">Accedi</button>
		</form>
	
	
	</body>
</html>