<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 String dbhost=request.getParameter("dbhost");
 String dbport=request.getParameter("dbport");
 String dbname=request.getParameter("dbname");
 String dbuser=request.getParameter("dbuser");
 String dbpassword=request.getParameter("dbpassword");
 if(dbhost!=null && dbport!=null && dbname!=null && dbuser!=null && dbpassword!=null){
	 session.setAttribute("dbhost", dbhost); 
	 session.setAttribute("dbport", dbport); 
	 session.setAttribute("dbname", dbname); 
	 session.setAttribute("dbuser", dbuser); 
	 session.setAttribute("dbpassword", dbpassword); 
	 response.sendRedirect("login.jsp");
	 return;
 }
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Connessione al database</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		<script>
	        function togglePassword() {
	            var passwordField = document.getElementById("dbpassword");
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
		<h1 class="text-center text-danger">Dati database a cui connettersi</h1>
		<form action="index.jsp" class="text-center mx-auto" style="width: 50%;" method="post">
			<div class="form-group">
			    <label for="dbhost">Host:</label>
			    <input type="text" class="form-control" name="dbhost" id="dbhost" required>
			</div>
			<div class="form-group">
			    <label for="dbport">Porta:</label>
				<input class="form-control" type="number" name="dbport" id="dbport" required>
			</div>
			<div class="form-group">
			    <label for="dbname">Nome database:</label>
				<input class="form-control" type="text" name="dbname" id="dbname" required>
			</div>
			<div class="form-group">
			    <label for="dbuser">Username:</label>
				<input class="form-control" type="text" name="dbuser" id="dbuser" required>
			</div>
			<div class="form-group">
                <label for="dbpassword">Password:</label>	                
                <input class="form-control" type="password" name="dbpassword" id="dbpassword" required>	                
                   <input type="checkbox" class="form-check-input" id="showPassword" onclick="togglePassword()">
                   <label class="form-check-label" for="showPassword">Mostra Password</label> 
	  		</div>
			
			<button type="submit" class="btn btn-primary">Procedi</button>
		</form>
	</body>
</html>