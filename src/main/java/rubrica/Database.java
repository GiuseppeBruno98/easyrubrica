package rubrica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class Database {
	private static String jdbcUrl;
    private static String dbuser;
    private static String dbpassword;
    
    public Database(String host, String port, String dbname, String dbusername, String dbdbpassword) {
    	jdbcUrl = "jdbc:mysql://"+host+":"+port+"/"+dbname;
    	dbuser = dbusername;
    	dbpassword = dbdbpassword;
    }
    
    public int DatabaseConnectionTest() {
    	try (Connection conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword)) {
            if (conn.isValid(5)) { 
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println("Errore di connessione al database.");
            e.printStackTrace();
        }
    	return 0;
    }
    
    public Vector<Persona> getListaPersone(){
	    Vector<Persona> listaPersone = new Vector<>();
	    String query = "SELECT id, nome, cognome, indirizzo, telefono, eta FROM lista_contatti";
	
	    Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String nome = resultSet.getString("nome");
	            String cognome = resultSet.getString("cognome");
	            String indirizzo = resultSet.getString("indirizzo");
	            String telefono = resultSet.getString("telefono");
	            int eta = resultSet.getInt("eta");
	
	            Persona persona = new Persona(id, nome, cognome, indirizzo, telefono, eta);
	            listaPersone.add(persona);
	        }
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} 
	    return listaPersone;
    }
    
    public int deletePersona(int idToDel){
    	String deleteQuery = "DELETE FROM lista_contatti WHERE id = "+ idToDel;
    	int rowDeleted=0;
      
    	Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
			PreparedStatement statement = conn.prepareStatement(deleteQuery);
			rowDeleted = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	    return rowDeleted;
    }
    
    public int editPersona(int idToEdit,String newNome, String newCognome, String newIndirizzo,String newTelefono, int newEta){
    	String updateQuery = "UPDATE lista_contatti SET nome = '" + newNome + "', cognome = '" + newCognome + "', indirizzo = '"+ newIndirizzo + "', telefono = '"+ newTelefono +"', eta = '"+ newEta +"' WHERE id = " + idToEdit;
    	Connection conn;
    	int rowsUpdated=0;
    	try {
    		conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
            PreparedStatement statement = conn.prepareStatement(updateQuery);
            rowsUpdated = statement.executeUpdate();
    	}catch (SQLException e) {
			e.printStackTrace();
		} 
    	return rowsUpdated;
    }
    
    public int addPersona(String newNome, String newCognome, String newIndirizzo,String newTelefono, int newEta){
    	String updateQuery = "INSERT INTO lista_contatti (nome, cognome, indirizzo, telefono, eta) VALUES ('"+ newNome +"','"+ newCognome +"','"+ newIndirizzo+"','"+ newTelefono+"', "+newEta+")";
    	Connection conn;
    	int rowsInserted=0;
    	try {
    		conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
            PreparedStatement statement = conn.prepareStatement(updateQuery);
            rowsInserted = statement.executeUpdate();
    	}catch (SQLException e) {
			e.printStackTrace();
		} 
    	return rowsInserted;
    }
    
    public int userLogin(String username, String password) {
        String query = "SELECT * FROM users WHERE username = '"+ username +"' AND password = '" + password + "'";
        Connection conn;
        


        try {
            conn = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet user = stmt.executeQuery();

            if (user.next()) {
                return 1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return 0; 
    }
}
