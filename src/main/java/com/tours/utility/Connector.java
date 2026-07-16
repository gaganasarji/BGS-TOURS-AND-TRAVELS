package com.tours.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
    public static Connection requestConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tours_db", "root", "Gaganasarji@29");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC driver not found on classpath", e);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to connect to DB: " + e.getMessage(), e);
        }
    }
}
