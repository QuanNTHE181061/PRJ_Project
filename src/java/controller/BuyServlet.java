/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FoodDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Food;

/**
 *
 * @author quanpyke
 */
public class BuyServlet extends HttpServlet {
   
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
        ArrayList<Food> blist= ( ArrayList<Food> ) session.getAttribute("blist");
        String buy=(String )session.getAttribute("buy");
        FoodDao fdao=new FoodDao();
        Account acc=(Account) session.getAttribute("acc");
        for(int i=0;i<blist.size();i++)
        {
            Food f=fdao.getFoodbyID(blist.get(i).getId());
            f.setQuantity(f.getQuantity()-blist.get(i).getQuantity());
            
            
         if(f.getQuantity()==0)
         {
             f.setStatus("Hết hàng");
         }
            
            fdao.update(f, f.getId());
          
            
            
        }
          fdao.insertHistory(blist, acc.getUsername());
        if(buy.equals("cart"))
        {
            for(int i=0;i<blist.size();i++)
            {
                fdao.deleteCart(blist.get(i).getId(), acc.getUsername());
            }
        }
        
        response.sendRedirect("data");
        
        
        
        
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
