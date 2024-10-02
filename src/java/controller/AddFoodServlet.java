/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FoodDao;
import jakarta.security.auth.message.callback.PrivateKeyCallback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import model.Food;

/**
 *
 * @author quanpyke
 */
@MultipartConfig(maxFileSize = 16177215)
public class AddFoodServlet extends HttpServlet {
   
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
        FoodDao dao=new FoodDao();
        ArrayList<Food> list=dao.getAll();
              
        
      int id=0;
      String name=request.getParameter("name");
      String ptype=request.getParameter("type");
      int type=getFoodType(ptype);
        System.out.println(type);
      double price=0;
      int quantity=0;
      String status=request.getParameter("status");
       Part file=request.getPart("img");
          String imgfileName = file.getSubmittedFileName();    

        String uploadPath = "C:\\FPTU\\PRJ301\\Baitap\\HE181061_Assignment\\web\\assets\\img"+imgfileName;
        FileOutputStream fos = new FileOutputStream(uploadPath);
        InputStream is = file.getInputStream();
        
        byte[] data = new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();
         String img = "assets/img/"+imgfileName;
        String error="";
       try
       {
           id=Integer.parseInt(request.getParameter("id"));
           if(isDuplicated(id, list) ) throw new NumberFormatException();
       }catch(NumberFormatException nfe)
       {
           error="ID không hợp lệ, ID phải là số nguyên và trùng với loại sản phẩm ";
           request.setAttribute("error", error);
           request.getRequestDispatcher("addfood.jsp").forward(request, response);
           return;
       }
           try
       {
           price=Double.parseDouble(request.getParameter("price"));
           if(price<=0) throw new NumberFormatException();
       }catch(NumberFormatException nfe)
       {
           error="Giá tiền phải lớn hơn 0 ";
           request.setAttribute("error", error);
           request.getRequestDispatcher("addfood.jsp").forward(request, response);
           return;
       }
              try
       {
           quantity=Integer.parseInt(request.getParameter("quantity"));
           if(quantity<0) throw new NumberFormatException();
       }catch(NumberFormatException nfe)
       {
           error="Số lượng phải là số nguyên";
           request.setAttribute("error", error);
           request.getRequestDispatcher("addfood.jsp").forward(request, response);
           return;
       }
       if(error=="")
       {
          Food f=new Food(id, name, type, price, quantity, status, img);
           dao.insert(f);
           error="Add sucessfully";
           request.setAttribute(img, f);
           response.sendRedirect("addfood.jsp");
             
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
  
public int getFoodType(String s)
{
    if(s.equals("Đồ ăn")) return 1;
  else  if(s.equals("Đồ uống")) return 2;
  else if(s.equals("Đồ ăn nhanh")) return 3;
  else if(s.equals("Đồ ăn vặt")) return 4;
  else return 5;
    
    
}
 
}
