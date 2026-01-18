package com.eduadmin.dao;

import java.sql.*;
import com.eduadmin.utils.ConnectionProvider;

public class AttendanceDao {

    Connection con;

    public AttendanceDao() {
        con = ConnectionProvider.getConnection();
    }

    public boolean markAttendance(String email, Date date, String status) {
        try {
            String sql = "INSERT INTO attendance VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setDate(2, date);
            ps.setString(3, status);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
