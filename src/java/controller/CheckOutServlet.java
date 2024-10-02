/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDao;
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
public class CheckOutServlet extends HttpServlet {
   
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
         AccountDao accdao=new AccountDao();
           FoodDao fdao=new FoodDao();
       if(request.getParameter("buy").contains("Mua"))
       {
           String username=request.getParameter("username");
           int fid=Integer.parseInt(request.getParameter("bfood"));
           int quanity=Integer.parseInt(request.getParameter("quantity"));
          
           Account acc= accdao.getProfile(username);
           Food f=fdao.getFoodbyID(fid);
           f.setQuantity(quanity);
           
           ArrayList<Food> blist=new ArrayList<>();
           blist.add(f);
           HttpSession session=request.getSession(true);
           session.setAttribute("blist", blist);
           session.setAttribute("total", f.getQuantity()*f.getPrice());
           session.setAttribute("buy", "buy");
           response.sendRedirect("checkout.jsp");
           
           
       }
       else
       {
           String username=request.getParameter("username");
           int fid=Integer.parseInt(request.getParameter("bfood"));
           int quantity=Integer.parseInt(request.getParameter("quantity"));
           Food f=fdao.getFoodbyID(fid);
           f.setQuantity(quantity);
           ArrayList<Food> cart=fdao.getCart(username);
            
           fdao.insertCart(f, username);
           request.setAttribute("addcart", "Thêm vào giỏ hàng thành công");
           request.getRequestDispatcher("pdetail.jsp").forward(request, response);
           
           
       }
        
        
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

    public boolean isDuplicated(int id,ArrayList<Food> list)
    {
        boolean check=false;
        for(int i=0;i<list.size();i++)
        {
            if(id==list.get(i).getId())
            {
                check=true;
                break;
            }
        }
        return check;
    }
  
}
