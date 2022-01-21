/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hasifhafifi
 */
public class paymentController extends HttpServlet {

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
        String query = "INSERT INTO payment(total, cardNo, cvv, expiryDate, appointmentID) VALUES(?,?,?,?,?)";
        
        try{
            Class.forName(driver); //2- Load & Register driver
        }catch(ClassNotFoundException ex){
            System.out.println("not found");
            Logger.getLogger(registrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
        PreparedStatement st = con.prepareStatement(query);
        
        int cardNo = Integer.parseInt(request.getParameter("cardNo"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        String expDate = request.getParameter("expDate");
        double total = Double.parseDouble(request.getParameter("total"));
        Integer appointmentID =  (Integer) session.getAttribute("appointmentID");
//        int appointmentID = 41; //change to session get id later
        
        st.setDouble(1, total);
        st.setInt(2, cardNo);
        st.setInt(3, cvv);
        st.setString(4, expDate);
        st.setInt(5, appointmentID);
        
//        st.setDouble(1, 50);
//        st.setInt(2, 12341234);
//        st.setInt(3, 123);
//        st.setString(4, expDate);
//        st.setInt(5, appointmentID);
        
        int insertStatus = 0;
        
        st.executeUpdate();
        System.out.println(insertStatus + "row affected");//6- process result
        
        st.close(); //7-close connection
        con.close();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet paymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>card no: "+cardNo+"</h1>");
            out.println("<h1>card no: "+cvv+"</h1>");
            out.println("<h1>card no: "+expDate+"</h1>");
            out.println("<h1>card no: "+total+"</h1>");
            out.println("<h1>card no: "+appointmentID+"</h1>");
            RequestDispatcher rd = request.getRequestDispatcher("appointmentPatient.jsp");
            rd.include(request, response);
            out.println("</body>");
            out.println("</html>");
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
            Logger.getLogger(paymentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(paymentController.class.getName()).log(Level.SEVERE, null, ex);
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
