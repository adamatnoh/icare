/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;


public class DepartmentDoctorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            DepartmentDoctorDao csd = new DepartmentDoctorDao(DBCon.getCon());
            
            String op = request.getParameter("operation");
            
            if (op.equals("department")) {
                List<Department> dlist = csd.getAllDepartment();
                Gson json = new Gson();
                String departmentList = json.toJson(dlist);
                response.setContentType("text/html");
                response.getWriter().write(departmentList);
            }

            if (op.equals("doctor")) {
                int id = Integer.parseInt(request.getParameter("id"));
                List<Doctor> drlist = csd.getDoctorByDepartId(id);
                Gson json = new Gson();
                String departmentList = json.toJson(drlist);
                response.setContentType("text/html");
                response.getWriter().write(departmentList);
            }

         
        }
    }
}