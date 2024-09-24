package com.sushant.live.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	
    public static Connection getConnection() {
    	 Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12732560","sql12732560","Yzm77EHwDN");
			System.out.println("Connection object"+con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return con;
    }
    
    public static void main(String[] args) {
		System.out.println(ConnectionProvider.getConnection());
	}


}
