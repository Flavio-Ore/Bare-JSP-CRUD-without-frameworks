/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {

    protected Connection connection;
    static Logger logger = Logger.getLogger(DatabaseConnection.class.getName());
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL
            = "jdbc:mysql://localhost:3306/registros?user=root";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    protected void createConnection() {
        try {
            Class.forName(JDBC_DRIVER);
            this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    protected void closeConnection() {
        logger.info("CLOSING CONNECTION.");

        try {
            if (this.connection != null && !this.connection.isClosed()) {
                this.connection.close();
                logger.info("CONNECTION CLOSED.");
            } else {
                logger.info("CONNECTION IS ALREADY CLOSED.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
