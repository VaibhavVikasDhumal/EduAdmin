package com.eduadmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eduadmin.entities.User;
import com.eduadmin.utils.ConnectionProvider;

public class UserDao {

    private Connection con;

    public UserDao() {
        con = ConnectionProvider.getConnection();
    }

    // ✅ USED BY ADMIN ADD USER
    public boolean registerUser(String name, String email, String password, String role) {

        boolean status = false;

        try {
            String sql = "INSERT INTO users(name, email, password, role) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Login
    public String login(String email, String password) {
        try {
            String sql = "SELECT role FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Delete user
    public boolean deleteUser(String email) {
        try {
            String sql = "DELETE FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // View all users
    public List<User> getAllUsers() {

        List<User> list = new ArrayList<>();

        try {
            String sql = "SELECT name, email, role FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("role")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
