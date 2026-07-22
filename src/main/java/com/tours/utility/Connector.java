package com.tours.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {

    public static Connection requestConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Loaded Successfully");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tours",
                    "root",
                    "Gaganasarji@29");

            System.out.println("Database Connected Successfully");

        } catch (Exception e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}