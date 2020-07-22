/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HD
 */
public class DBUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://prcdatabase.database.windows.net:1433;"
                + "database=Project;"
                + "user=prc;"
                + "password=zaQ@1234;"
                + "encrypt=true;"
                + "trustServerCertificate=false;"
                + "hostNameInCertificate=*.database.windows.net;"
                + "loginTimeout=30;";
        return DriverManager.getConnection(url, "prc", "zaQ@1234");
          
    }
}
