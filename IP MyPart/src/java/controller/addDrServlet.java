/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hasifhafifi
 */
public class addDrServlet extends HttpServlet {

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
        
        String name = request.getParameter("name");
        String grade = request.getParameter("grade");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String availability = request.getParameter("available");
        String department = request.getParameter("appointdepartment");
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
        String query = "INSERT INTO doctor(name, grade, email, mobile, availability, departmentID) VALUES(?,?,?,?,?,?)";
        
        try{
            Class.forName(driver); //2- Load & Register driver
        }catch(ClassNotFoundException ex){
            System.out.println("not found");
            Logger.getLogger(registrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
        Statement statement = con.createStatement();
        ResultSet rs =statement.executeQuery("SELECT * FROM department WHERE departmentName=\'"+department+"\'");
        rs.next();
        
        int departmentId = rs.getInt(1);
        
        PreparedStatement st = con.prepareStatement(query);
        
        st.setString(1, name);
        st.setString(2, grade);
        st.setString(3, email);
        st.setString(4, mobile);
        st.setString(5, availability);
        st.setInt(6, departmentId);
        
        st.executeUpdate();
        
        st.close(); //7-close connection
        con.close();
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            response.sendRedirect ("manageDr.jsp?msg=successful");
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
            Logger.getLogger(addDrServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addDrServlet.class.getName()).log(Level.SEVERE, null, ex);
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
