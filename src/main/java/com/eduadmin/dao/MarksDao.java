package com.eduadmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.eduadmin.utils.ConnectionProvider;

public class MarksDao {

    private Connection con;

    public MarksDao() {
        con = ConnectionProvider.getConnection();
    }

    // ✅ INSERT OR UPDATE MARKS (NO DUPLICATE)
    public boolean addOrUpdateMarks(String email, String subject, int marks) {
        try {
            String sql = "REPLACE INTO marks(email, subject, marks) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, subject);
            ps.setInt(3, marks);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ GET MARKS AS MAP (subject → marks)
    public Map<String, Integer> getMarksByStudent(String email) {

        Map<String, Integer> map = new HashMap<>();

        try {
            String sql = "SELECT subject, marks FROM marks WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                map.put(rs.getString("subject"), rs.getInt("marks"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }
}
