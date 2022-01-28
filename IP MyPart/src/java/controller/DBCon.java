/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBCon {
    private static Connection con;

    public static Connection getCon() {
  
        try {

            String driver = "com.mysql.jdbc.Driver";
            String dbName = "icare";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pass = "";

            Class.forName(driver); //2- Load & Register driver

             con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
            }catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        } 
        return con;
    }
}

