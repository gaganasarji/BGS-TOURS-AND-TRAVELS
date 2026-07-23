package com.tours.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
public static Connection requestConnection() {
	

	    Connection con = null;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        System.out.println("Driver class added");

	        con = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/tours",
	                "root",
	                "root");

	        System.out.println("Connection Successful: " + con);

	    } catch (Exception e) {
	        System.out.println("Connection Failed!");
	        e.printStackTrace();
	    }

	    return con;
	}

}