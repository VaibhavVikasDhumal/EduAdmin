package com.eduadmin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.eduadmin.utils.ConnectionProvider;

public class StudentProfileDao {

    private Connection con;

    public StudentProfileDao() {
        con = ConnectionProvider.getConnection();
    }

    public void saveProfile(String email, Date dob, String standard) {
        try {
            String sql = "REPLACE INTO student_profile VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setDate(2, dob);
            ps.setString(3, standard);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
