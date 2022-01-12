/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author zulhu
 */
public class appointment {
    
    private int appointmentID;
    private String appointmentDate;
    private String appointmentTime;
    private String appointmentDepartment;
    private String appointmentDr;
    private String message;
    
    
    public void appointment()
    {
        
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentDepartment() {
        return appointmentDepartment;
    }

    public void setAppointmentDepartment(String appointmentDepartment) {
        this.appointmentDepartment = appointmentDepartment;
    }

    public String getAppointmentDr() {
        return appointmentDr;
    }

    public void setAppointmentDr(String appointmentDr) {
        this.appointmentDr = appointmentDr;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
