/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.*;//1-import package
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.appointment;

/**
 *
 * @author adamn
 */
public class reportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true); 
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";

        try{
            Class.forName(driver); //2- Load & Register driver
        }catch(ClassNotFoundException ex){
            System.out.println("not found");
            Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String query = "INSERT INTO medicalreport(details, userID, subject, PCondition, nextAppoint, appointmentID) VALUES(?,?,?,?,?,?)";
        
        Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
        PreparedStatement st = con.prepareStatement(query);
        
        String details = request.getParameter("details");
        String userID = request.getParameter("userID");
        String subject = request.getParameter("subject");
        String patientCondition = request.getParameter("PCondition");
        String nextAppointmentDate = request.getParameter("nxtApptD");
        String appointmentID = request.getParameter("appointmentID");
        
        st.setString(1, details);
        st.setString(2, userID);
        st.setString(3, subject);
        st.setString(4, patientCondition);
        st.setString(5, nextAppointmentDate);
        st.setString(6, appointmentID);
        
        st.executeUpdate();
        
        st.close();
        
        Statement statementt = con.createStatement() ; 
        
        ResultSet rs =statementt.executeQuery("select * from appointment where userID="+userID) ;
        rs.next();
        
        PreparedStatement st2 = con.prepareStatement("INSERT INTO appointment(appointmentDate, appointmentTime, appointmentDepartment, appointmentDr, message, appointmentType, appointmentLink, userID, status) VALUES(?,?,?,?,?,?,?,?,?)");
        
        String appointdate = request.getParameter("nxtApptD");
        String appointtime = rs.getString(4);
        String appointdepartment = rs.getString(5);
        String appointdoctor = rs.getString(6);
        String message = request.getParameter("details");
        String appointmentType = "appointment";
        String platform = null;
        
        st2.setString(1, appointdate);
        st2.setString(2, appointtime);
        st2.setString(3, appointdepartment);
        st2.setString(4, appointdoctor);
        st2.setString(5, message);
        st2.setString(6, appointmentType);
        st2.setString(7, platform);
        st2.setInt(8, Integer.parseInt(userID));
        st2.setString(9, "pending");
        
        st2.executeUpdate(); 
        
        st2.close(); //7-close connection
        con.close();
  
        try (PrintWriter out = response.getWriter()) {
            response.sendRedirect ("index.jsp?msg=successful");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
