package BLOOD_DONATION_PROJECT;
import java.sql.*;
public class Jdbc {
	
	public Connection dbconnect() throws ClassNotFoundException,SQLException{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/blood_donation_project";
		
		String user="root" ,pass="Ram@150898@";
		Connection con=DriverManager.getConnection(url,user,pass);
		return con;
	}

}

