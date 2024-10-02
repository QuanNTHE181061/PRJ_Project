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
import model.Food;

/**
 *
 * @author quanpyke
 */
public class StatisticServlet extends HttpServlet {
   
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
        FoodDao dao=new FoodDao();
        HttpSession session=request.getSession();
        double price0=dao.getDatePrice(0);
        session.setAttribute("price0", price0);
        double price7=dao.getDatePrice(7);
        session.setAttribute("price7", price7);
        double price30=dao.getDatePrice(30);
        session.setAttribute("price30", price30);
        double priceall=dao.getDatePrice(10000);
        session.setAttribute("priceall", priceall);
        
        
        Food f0=dao.getFoodQuantity(0);
        session.setAttribute("f0", f0);
                Food f7=dao.getFoodQuantity(7);
        session.setAttribute("f7", f7);
                Food f30=dao.getFoodQuantity(30);
        session.setAttribute("f30", f30);        
        Food fall=dao.getFoodQuantity(10000);
        session.setAttribute("fall", fall);
        
        response.sendRedirect("statistic.jsp");
        
        
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
