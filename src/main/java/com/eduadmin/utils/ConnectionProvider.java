package com.eduadmin.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    private static Connection con;

    private ConnectionProvider() {
    }

    public static Connection getConnection() {

        try {
            if (con == null || con.isClosed()) {

                // 1. Load Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // 2. Create Connection
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/edu",
                        "root",
                        "Vaibhav@123"
                );

                System.out.println("Database Connected Successfully");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
