package com.marryme.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * ClassName: Comment
 * Package: marryme.common
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 12:53
 * @Version 1.0
 */
public class Common {
    public final static String URL = "jdbc:mysql://localhost:3306/marryme?serverTimezone=Asia/Taipei";
    public final static String USER = "root";
    public final static String PASSWORD = "password";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Connecting to MySQL successfully!!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
