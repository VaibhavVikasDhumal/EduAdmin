package com.eduadmin.dao;

import java.sql.*;
import com.eduadmin.utils.ConnectionProvider;

public class FeeStructureDao {

    Connection con;

    public FeeStructureDao() {
        con = ConnectionProvider.getConnection();
    }

    public boolean setFee(String standard, int totalFee) {
        try {
            String sql = "REPLACE INTO fee_structure VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, standard);
            ps.setInt(2, totalFee);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getFeeByStandard(String standard) {
        try {
            String sql = "SELECT total_fee FROM fee_structure WHERE standard=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, standard);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total_fee");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
