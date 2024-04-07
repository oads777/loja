package teste;

import java.sql.*;

public class connectionDB {

	public static void main(String[] args) {
		try {			
            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/teste2","root","root");
            if(connect != null)
                System.out.println("Connected - 'Teste2' Data Base");
            else
                System.out.println("Error, Not Connected");
            connect.close();

        }
        catch(Exception e){
            System.out.println(e);
        }
    }

} 