<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Vector" %>
<%@ page import="rubrica.Persona" %>
<%@ page import="rubrica.Database" %>
<!DOCTYPE html>
<%
Database db=new Database((String)session.getAttribute("dbhost"),(String)session.getAttribute("dbport"),(String)session.getAttribute("dbname"),(String)session.getAttribute("dbuser"), (String)session.getAttribute("dbpassword"));
if(db.DatabaseConnectionTest() == 0){
	response.sendRedirect("index.jsp");
	return;
}else if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
	return;
}
Vector<Persona> listaPersone = db.getListaPersone();
String idToDel=request.getParameter("idToDel");
if(idToDel!=null && idToDel!="" && idToDel.matches("\\d+")){	//se la stringa c'e, non e vuota ed e composta da soli numeri
	int result=db.deletePersona(Integer.parseInt(idToDel));
	response.sendRedirect("lista.jsp?deletedId="+idToDel);
	return;
}
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TITOLO</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		
	</head>
	<body>
		<h1 class="text-center text-danger">Rubrica</h1>
		<div style="width: 50%;" class="text-center mx-auto">
			<div class="row justify-content-end mb-2">
	            <div class="col-auto">
	                <a href="editor.jsp?add=yes" class="btn btn-primary">Aggiungi nuovo contatto</a>
	            </div>
	        </div>
			<table class="table table-dark table-striped table-bordered table-hover " >
				<thead>
			    	<tr>
				      	<th>Id</th>
				        <th>Nome</th>
				        <th>Cognome</th>
				        <th>Telefono</th>
				  		<th>Modifica</th>
				        <th>Elimina</th>
			    	</tr>
				</thead>
				<tbody>
					<% 
			        for (Persona p : listaPersone) {
					%>
					    <tr>
					    	<td><%= p.getId() %></td>
					        <td><%= p.getNome() %></td>
					        <td><%= p.getCognome() %></td>
					        <td><%= p.getTelefono() %></td>
					        <td>
					        	<form action="editor.jsp" method="post">
					        		<input class="form-control" type="hidden" name="idToEdit" value="<%= p.getId() %>">
					        		<button type="submit" class="btn btn-primary">Modifica</button>
					        	</form>
					        </td>
					        <td>
								<form action="lista.jsp" method="post">
					        		<input class="form-control" type="hidden" name="idToDel" value="<%= p.getId() %>">
					        		<button type="submit" class="btn btn-primary">Elimina</button>
					        	</form>
							</td>
					    </tr>
					<% 
					}
			      	%>
				</tbody>
			</table>
		</div>
	</body>
</html>

	
