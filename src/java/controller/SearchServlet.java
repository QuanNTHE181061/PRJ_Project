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
import model.Food;

/**
 *
 * @author quanpyke
 */
public class SearchServlet extends HttpServlet {
   
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
            String[] arraytype=request.getParameterValues("type");
           String type=String.join(" ", arraytype);
            String [] arraystatus=request.getParameterValues("status");
            String status=String.join(" ", arraystatus);
            String[] arraypricetype=request.getParameterValues("price");
            String pricetype=String.join(" ", arraypricetype);
            FoodDao fdao=new FoodDao();
            ArrayList<Food> flist=fdao.getAll();
            ArrayList<Food> slist=new ArrayList<>();
            String search=request.getParameter("search");
     for(int i=0;i<flist.size();i++)
     {
            if(type.contains( String.valueOf(flist.get(i).getType())  ) && status.contains(flist.get(i).getStatus()) && isValidPrice(flist.get(i).getPrice(), pricetype)   &&isSearched(search, flist.get(i).getName())    )
            {
                slist.add(flist.get(i));
            }
         
     }
        HttpSession session=request.getSession(true);
        session.setAttribute("slist", slist);
        response.sendRedirect("search.jsp");
            
            
            
        
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

    
    public boolean isValidPrice(double price , String pricetype  )
    {
        boolean check=false;
        if(pricetype.contains("1"))
        {
               if(price<=20000) check=true;
            
            
            
        }
         if(pricetype.contains("2"))
        {
            
            if(price>=20000 && price<=50000) check=true;
           
            
        }
         if(pricetype.contains("3"))
        {
            if(price>=50000&&price<=100000) check=true;
        }
         if(pricetype.contains("4"))
        {
            if(price>100000) check=true;
        }
        return check;
    }
    public boolean isSearched(String search,String name)
    {
        if(search.isEmpty()) return true;
        else
        {
             if(name.toUpperCase().contains(search.toUpperCase())) return true;
             else return false;
            
            
        }
        
        
    }
    
 
    
}
