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
public class EditUserServlet extends HttpServlet {
   
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
     
            /* TODO output your page here. You may use following sample code. */
            String puser=request.getParameter("puser");
        if(puser!=null){
          
            HttpSession session=request.getSession(true);
                session.setAttribute("puser", puser);
            AccountDao dao=new AccountDao();
         
            Account acc=dao.getProfile(puser);
           session.setAttribute("eacc", acc);
           response.sendRedirect("edituser.jsp");
    }

        
        if(puser==null)
          {
              HttpSession session=request.getSession(true);
        Account  newacc= (Account)session.getAttribute("eacc");
              String name=request.getParameter("name");
              String email=request.getParameter("email");
              String address=request.getParameter("address");
              String phone=request.getParameter("phone");
              int type=Integer.parseInt(request.getParameter("type"));
              if(!isValidPhone(phone))
              {
                   session.setAttribute("Điện thoại phải là số có độ dài 10-11", "error");
                    response.sendRedirect("edituser.jsp");
              }
              
              
              
              newacc.setAddress(address);
              newacc.setName(name);
              newacc.setEmail(email);
              newacc.setPhone(phone);
              newacc.setType(type);
              AccountDao dao=new AccountDao();
              dao.updateProfile(newacc);
              request.getRequestDispatcher("manage").forward(request, response);
              
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
 public boolean isValidPhone(String phone)
 {
     if(phone.length()!=10 && phone.length()!=11   )
     {
         return false;
     }
        char[] c=phone.toCharArray();
        for(int i=0;i<c.length;i++)
        {
            if( ! Character.isDigit(c[i]))
            {
                return false;
            }
        }
     
     return true;
     
 }

}
