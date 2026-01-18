package com.eduadmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.eduadmin.utils.ConnectionProvider;

public class StudentFeeDao {

    private Connection con;

    public StudentFeeDao() {
        con = ConnectionProvider.getConnection();
    }

    // Assign fee when student selects standard
    public boolean assignFee(String email, String standard, int totalFee) {
        try {
            String sql = "REPLACE INTO student_fee(email, standard, total_fee, paid_fee) VALUES (?,?,?,0)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, standard);
            ps.setInt(3, totalFee);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getTotalFee(String email) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "SELECT total_fee FROM student_fee WHERE email=?"
            );
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total_fee");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getPaidFee(String email) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "SELECT paid_fee FROM student_fee WHERE email=?"
            );
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("paid_fee");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getRemainingFee(String email) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "SELECT total_fee - paid_fee AS remaining FROM student_fee WHERE email=?"
            );
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("remaining");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean payFee(String email, int amount) {
        try {
            int remaining = getRemainingFee(email);
            if (amount > remaining) return false;

            PreparedStatement ps = con.prepareStatement(
                "UPDATE student_fee SET paid_fee = paid_fee + ? WHERE email=?"
            );
            ps.setInt(1, amount);
            ps.setString(2, email);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
