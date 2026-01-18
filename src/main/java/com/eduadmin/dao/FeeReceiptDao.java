package com.eduadmin.dao;

import java.sql.*;
import com.eduadmin.utils.ConnectionProvider;

public class FeeReceiptDao {

    private Connection con;

    public FeeReceiptDao() {
        con = ConnectionProvider.getConnection();
    }

    // Save payment receipt
    public void saveReceipt(String studentEmail, int amount, String accountantEmail) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO fee_receipt(student_email, paid_amount, accountant_email) VALUES (?,?,?)"
            );
            ps.setString(1, studentEmail);
            ps.setInt(2, amount);
            ps.setString(3, accountantEmail);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Fetch latest receipt
    public ResultSet getLatestReceipt(String studentEmail) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM fee_receipt WHERE student_email=? ORDER BY receipt_id DESC LIMIT 1"
            );
            ps.setString(1, studentEmail);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
