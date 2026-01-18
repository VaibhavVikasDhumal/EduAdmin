package com.eduadmin.dao;

import java.sql.*;
import com.eduadmin.utils.ConnectionProvider;

public class SubjectDao {

    Connection con;

    public SubjectDao() {
        con = ConnectionProvider.getConnection();
    }

    public boolean assignSubject(String staffEmail, String subject) {
        try {
            String sql = "INSERT INTO staff_subject VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, staffEmail);
            ps.setString(2, subject);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
