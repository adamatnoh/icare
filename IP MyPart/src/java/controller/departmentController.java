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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zulhu
 */
@WebServlet(name = "departmentController", urlPatterns = {"/departmentController"})
public class departmentController extends HttpServlet {

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
       
        try (PrintWriter out = response.getWriter()) {

            String driver = "com.mysql.jdbc.Driver";
            String dbName = "icare";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pass = "";
            String action=request.getParameter("action");
            

            if (action.equals("ADD"))
            {
                String query = "INSERT INTO department(departmentName) VALUES(?)";

                try{
                    Class.forName(driver); //2- Load & Register driver
                }catch(ClassNotFoundException ex){
                    System.out.println("not found");
                    Logger.getLogger(departmentController.class.getName()).log(Level.SEVERE, null, ex);
                }

                Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
                PreparedStatement st = con.prepareStatement(query);
                String depName=request.getParameter("depName");
                st.setString(1, depName);

                int insertStatus=st.executeUpdate();
        
                st.close(); //7-close connection
                con.close();
                RequestDispatcher rd=request.getRequestDispatcher("/viewDepartment.jsp?msg=successful");
                rd.forward(request,response);

            }
            if (action.equals("VIEW"))
            {
		RequestDispatcher rd=request.getRequestDispatcher("/viewDepartment.jsp");
                rd.forward(request,response);
            }
            if (action.equals("EDIT"))
            {   
                HttpSession session=request.getSession(true);
                String depID = (String)request.getParameter("id");
                session.setAttribute("depID", depID);
                
		RequestDispatcher rd=request.getRequestDispatcher("/editDepartment.jsp");
                rd.forward(request,response);
            }
            if (action.equals("DETAILS"))
            {   
              
                RequestDispatcher rd=request.getRequestDispatcher("/departmentDetails.jsp");
                rd.forward(request,response);
            }
            if (action.equals("DELETE"))
            {   
                String id=request.getParameter("id");
                String query ="DELETE FROM department WHERE departmentID='"+id+"'";
                
                Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
                Statement st = con.createStatement();
     
                st.executeUpdate(query);
        
                st.close(); //7-close connection
                con.close();
		RequestDispatcher rd=request.getRequestDispatcher("/viewDepartment.jsp?msg=deleted");
                rd.forward(request,response);
            }
            if (action.equals("UPDATE"))
            {   String id=request.getParameter("depID");
                String depName=request.getParameter("depName");
               
                
                String query = "UPDATE department SET departmentName=? WHERE departmentID=?";

                try{
                    Class.forName(driver); //2- Load & Register driver
                }catch(ClassNotFoundException ex){
                    System.out.println("not found");
                    Logger.getLogger(departmentController.class.getName()).log(Level.SEVERE, null, ex);
                }

                Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
                PreparedStatement st = con.prepareStatement(query);
                    
                st.setString(1, depName);
                st.setString(2,id);
                
                st.executeUpdate();
        
                st.close(); //7-close connection
                con.close();
                RequestDispatcher rd=request.getRequestDispatcher("/viewDepartment.jsp");
                rd.forward(request,response);
                
            }
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
            Logger.getLogger(departmentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(departmentController.class.getName()).log(Level.SEVERE, null, ex);
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
