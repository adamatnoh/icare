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
 * @author zulhu
 */
public class appointmentController extends HttpServlet {

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
        Integer userID =  (Integer) session.getAttribute("userLoginID");
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
        String query = "INSERT INTO appointment(appointmentDate, appointmentTime, appointmentDepartment, appointmentDr, message, appointmentType, appointmentLink, userID,status) VALUES(?,?,?,?,?,?,?,?,?)";
        
        try{
            Class.forName(driver); //2- Load & Register driver
        }catch(ClassNotFoundException ex){
            System.out.println("not found");
            Logger.getLogger(appointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, pass); //3- Establish connection
        PreparedStatement st = con.prepareStatement(query);
        
        String appointdate = request.getParameter("appointdate");
        String appointtime = request.getParameter("appointtime");
        String appointdepartment = request.getParameter("appointdepartment");
        String appointdoctor = request.getParameter("appointdoctor");
        String message = request.getParameter("message");
        String appointmentType = request.getParameter("appointmentType");
        String platform = request.getParameter("platform");
        
        st.setString(1, appointdate);
        st.setString(2, appointtime);
        st.setString(3, appointdepartment);
        st.setString(4, appointdoctor);
        st.setString(5,message);
        st.setString(6,appointmentType);
        st.setString(7,platform);
        st.setInt(8,userID);
        st.setString(9,"Pending");
        
        int insertStatus=st.executeUpdate();
        //System.out.println(insertStatus + "row affected");//6- process result
        
        st.close(); //7-close connection
        con.close();
        
        appointment appointment = new appointment();
        appointment.setAppointmentDate(appointdate);
        appointment.setAppointmentTime(appointtime);
        appointment.setAppointmentDepartment(appointdepartment);
        appointment.setAppointmentDr(appointdoctor);
        appointment.setMessage(message);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if(appointmentType.equals("appointment"))
            {
                RequestDispatcher rd = request.getRequestDispatcher("appointmentPatient.jsp");
                rd.include(request, response);
            }
            else if(appointmentType.equals("online"))
            {
                Connection conn = DriverManager.getConnection(url, userName, pass); //3- Establish connection
                Statement statement = conn.createStatement();
                ResultSet rs =statement.executeQuery("SELECT * FROM appointment WHERE appointmentType=\'"+appointmentType+"\' AND appointmentDate=\'"+appointdate+"\' AND userID=\'"+userID+"\' AND appointmentTime=\'"+appointtime+"\'");
                rs.next();
                session.setAttribute("appointmentID", rs.getInt(1));
                
                RequestDispatcher rd = request.getRequestDispatcher("onlinePayment.jsp");
                rd.include(request, response);
            }
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
            Logger.getLogger(appointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(appointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
