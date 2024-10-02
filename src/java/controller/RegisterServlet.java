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
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author quanpyke
 */
public class RegisterServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      
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
         HttpSession session=request.getSession(true);
         session.setAttribute("status", "new");
          response.sendRedirect("register.jsp");
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
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String cpassword=request.getParameter("cpassword");
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        AccountDao dao=new AccountDao();
        HttpSession session=request.getSession(true);
        String reg="";
        ArrayList<Account> acclist=(ArrayList<Account>)dao.getAll();
        boolean status=true;
        if(!password.equals(cpassword))
        {
            reg="Password must be equals to cpassword";
            status=false;
        }
        if(isDuplicated(username, acclist))
        {
            reg="This username have been existed";
            status=false;
        }
         if(!isValidPhone(phone))
        {
             reg="Điện thoại phải là số và có độ dài 10-11";
            status=false;
        }
        if(status)
        {
           Account acc=new Account(username, password, 2, name, email, address,phone);
           dao.insert(acc);
        
 
            session.setAttribute("status", "success");
            response.sendRedirect("register.jsp");
        }
       
        else
        {
            session.setAttribute("reg", reg);
                session.setAttribute("status", "fail");
            response.sendRedirect("register.jsp");
        }
      
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
 public boolean isDuplicated(String username,ArrayList<Account> list)
 {
     boolean check=false;
     for(int i=0;i<list.size();i++)
     {
         if(username.equals(list.get(i).getUsername()))
         {
             check=true;
             break;
         }
     }
     return check;
 }
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
