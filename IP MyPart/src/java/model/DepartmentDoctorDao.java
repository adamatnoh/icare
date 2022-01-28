/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author zulhu
 */
public class DepartmentDoctorDao {
    Connection con;
    PreparedStatement pst;
    String query;
    ResultSet rs;
    
    public DepartmentDoctorDao(Connection con) {
        this.con = con;
    }
    
    public List<Department> getAllDepartment(){
        List<Department> list  = new ArrayList<>();
        try{
            query = "select * from department";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Department department = new Department();
                department.setDepartmentID(rs.getInt("departmentID"));
                department.setDepartmentName(rs.getString("departmentName"));
                list.add(department);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    
    public List<Doctor> getDoctorByDepartId(int departmentID){
        List<Doctor> list = new ArrayList<>();
        try{
            query = "select * from doctor where availability='Yes' AND departmentID=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, departmentID);
            rs = pst.executeQuery();
            while(rs.next()){
                Doctor doctor = new Doctor();
                doctor.setDoctorID(rs.getInt("doctorID"));
                doctor.setName(rs.getString("name"));
                doctor.setGrade(rs.getString("grade"));
                doctor.setEmail(rs.getString("email"));
                doctor.setMobile(rs.getString("mobile"));
                doctor.setAvailability(rs.getString("availability"));
                doctor.setDepartmentID(rs.getInt("departmentID"));
                list.add(doctor);
            }
        }catch(SQLException e){
            e.printStackTrace();
        } 
        return list;
    }

}

  
