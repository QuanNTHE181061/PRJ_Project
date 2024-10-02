/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author quanpyke
 */
public class ChangePassword extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession(true);
        String puser= request.getParameter("puser");
        AccountDao dao=new AccountDao();
       
        
        if(puser!=null)
        {
            Account acc=dao.getProfile(puser);
            session.setAttribute("acc", acc);
            response.sendRedirect("changepassword.jsp");
        }
        if(puser==null)
        {
            String change="";
           String oldpass=request.getParameter("oldpassword");
           String newpass=request.getParameter("password");
           String cnewpass=request.getParameter("cpassword");
           Account acc=(Account)session.getAttribute("acc");
           if(!oldpass.equals(acc.getPassword()))
           {
               change="Old Password are not correct";
               request.setAttribute("change", change);
               request.getRequestDispatcher("changepassword.jsp").forward(request, response);
           }
           else if(!newpass.equals(cnewpass))
           {
               change="Password must be equals to confirm password";
                   request.setAttribute("change", change);
               request.getRequestDispatcher("changepassword.jsp").forward(request, response);
           }
           else
           {
               change="Change password sucessfully";
               acc.setPassword(newpass);
               dao.changePassword(acc);
                 request.setAttribute("change", change);
               request.getRequestDispatcher("changepassword.jsp").forward(request, response);
           }
           
        }
        
        
        }
     

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}