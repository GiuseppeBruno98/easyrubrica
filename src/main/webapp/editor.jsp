<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Vector" %>
<%@ page import="rubrica.Persona" %>
<%@ page import="rubrica.Database" %>
<%
Persona p=null;
Database db=new Database((String)session.getAttribute("dbhost"),(String)session.getAttribute("dbport"),(String)session.getAttribute("dbname"),(String)session.getAttribute("dbuser"), (String)session.getAttribute("dbpassword"));
if(db.DatabaseConnectionTest() == 0){
	response.sendRedirect("index.jsp");
	return;
}else if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
	return;
}
String id=request.getParameter("idToEdit");
String ide=request.getParameter("idToEditdb");
String add=request.getParameter("add");
if(add!=null && add.equals("yes")){
	p=new Persona(0,"","","","",0);
}else if(ide!=null && Integer.parseInt(ide)==0){
	db.addPersona(request.getParameter("nome"), request.getParameter("cognome"), request.getParameter("indirizzo"), request.getParameter("telefono"), Integer.parseInt(request.getParameter("eta")));
}else if(ide!=null && ide!="" && ide.matches("\\d+")){	//se la stringa c'e, non e vuota ed e composta da soli numeri
	db.editPersona(Integer.parseInt(request.getParameter("idToEditdb")), request.getParameter("nome"), request.getParameter("cognome"), request.getParameter("indirizzo"), request.getParameter("telefono"), Integer.parseInt(request.getParameter("eta")));
}else if(id!=null && id!="" && id.matches("\\d+")){	//se la stringa c'e, non e vuota ed e composta da soli numeri
	Vector<Persona> listaPersone = db.getListaPersone(); 
	for (Persona px : listaPersone) {
		if(px.getId()==Integer.parseInt(id)){
			p=px;
			break;
		}
	}
}
if(p==null){
	 response.sendRedirect("lista.jsp");
	 return;
}
%> 
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Modifica Persona</title>
	    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
	    <h1 class="text-center text-danger"><% if(p.getId()!=0){ %>Modifica <%}else{ %> Aggiungi <% } %> Persona</h1>
	    <form action="editor.jsp" class="text-center mx-auto" style="width: 50%;" method="post">
	        <input class="form-control" type="hidden" name="idToEditdb" value="<%= p.getId() %>" required>
	        <label class="form-label">Nome:</label>
	        <input class="form-control" type="text" name="nome" value="<%= p.getNome() %>">
	        <br>
	        <label class="form-label">Cognome:</label>
	        <input class="form-control" type="text" name="cognome" value="<%= p.getCognome() %>" required>
	        <br>
	        <label class="form-label">Indirizzo:</label>
	        <input class="form-control" type="text" name="indirizzo" value="<%= p.getIndirizzo() %>" required>
	        <br>
	        <label class="form-label">Telefono:</label>
	        <input class="form-control" type="text" name="telefono" value="<%= p.getTelefono() %>" required>
	        <br>
	        <label class="form-label">Età:</label>
	        <input class="form-control" type="number" name="eta" value="<%= p.getEta() %>" required>
	        <br>
	        <% 
	        	if(p.getId()!=0){
			%>
	        <input class="btn btn-primary" type="submit" value="Salva">
	        <%	
	        	}else{
	        %>
	        <input class="btn btn-primary" type="submit" value="Aggiungi contatto">
	        <%	
	        	}
	        %>
	        <a href="lista.jsp">Annulla</a>
	    </form>
	</body>
</html>