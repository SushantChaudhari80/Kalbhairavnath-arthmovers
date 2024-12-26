package com.sushant.live.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	
    public static Connection getConnection() {
    	 Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://root:STBTbMioppKqvJePNHgKKCXLtKQDbtXo@junction.proxy.rlwy.net:39140/railway","root","STBTbMioppKqvJePNHgKKCXLtKQDbtXo");
			//mysql://root:STBTbMioppKqvJePNHgKKCXLtKQDbtXo@junction.proxy.rlwy.net:39140/railway
			System.out.println("Connection object"+con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return con;
    }
    
//    public static void main(String[] args) {
//		System.out.println(ConnectionProvider.getConnection());
//	}


}
