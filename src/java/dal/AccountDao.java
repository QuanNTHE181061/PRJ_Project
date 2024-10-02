/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author quanpyke
 */

    public class AccountDao extends DBContext{
    public List<Account> getAll()
    {
        List<Account> list=new ArrayList<>();
        String sql="select * from Account";
        try {
            //thuc thi cau truy van
            PreparedStatement pre=connection.prepareStatement(sql);
            ResultSet rs=pre.executeQuery();
            while(rs.next())
            {
                String username=rs.getString("username");
                String password=rs.getString("password");
                int type=rs.getInt("type");
                String name=rs.getString("name");
                String email=rs.getString("email");
                String address=rs.getString("address");
                String phone=rs.getString("phone");
                Account acc=new Account(username, password, type, name, email, address,phone);
                list.add(acc);
            }
            
        } catch (SQLException e) {
            System.out.println("e");
        }
        
        return list;
    }
      public void insert(Account acc)
  {
          try {
            String sql = "insert into Account (username,password,type,name,email,address,phone) \n" +
                    "values\n" +
                    "(?,?, ?,?,?,?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, acc.getUsername());
            pre.setString(2, acc.getPassword());
            pre.setInt(3, acc.getType());
            pre.setString(4, acc.getName());
            pre.setString(5, acc.getEmail());
            pre.setString(6, acc.getAddress());
            pre.setString(7, acc.getPhone());
            pre.executeUpdate();
            
        } catch (SQLException ex) {
                

        }
  }
      public Account getProfile(String username) {
    Account acc = null; // Đặt acc là null để kiểm tra xem có tìm thấy tài khoản không
    String sql = "select * from Account where username=?";
    
    try {
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, username);
        ResultSet rs = pre.executeQuery();
        
        if (rs.next()) { // Kiểm tra xem có dữ liệu hay không
            String password = rs.getString("password");
            int type = rs.getInt("type");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String address = rs.getString("address");
            String phone=rs.getString("phone");
            acc = new Account(username, password, type, name, email, address,phone);
        }
        
        // Đóng ResultSet và PreparedStatement
        rs.close();
        pre.close();
        
    } catch (SQLException ex) {
        ex.printStackTrace(); // In ra lỗi để dễ dàng kiểm tra và sửa lỗi
    }
    
    return acc;
}
       public void updateProfile(Account acc)
  {
          try {
            String sql = "update Account "
                    + "set name=?,email=?,address=?, phone=? , type=? "
                    + " where username=?";

            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, acc.getName());
            pre.setString(2, acc.getEmail());
            pre.setString(3, acc.getAddress());
            pre.setString(4, acc.getPhone());
            pre.setInt(5, acc.getType());
            pre.setString(6, acc.getUsername());
            pre.executeUpdate();
            
        } catch (SQLException ex) {
                

        }
  }
       
              public void changePassword(Account acc)
  {
          try {
            String sql = "update Account "
                    + "set password=? "
                    + " where username=?";

            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, acc.getPassword());
            pre.setString(2, acc.getUsername());
           
            pre.executeUpdate();
            
        } catch (SQLException ex) {
                

        }
  }
        
              public static void main(String[] args) {
            Account acc=new Account("admin", "123", 0, "NT QUAN 3", "admin@gmail.com", "Ha Noi", "0968356204");
            AccountDao dao=new AccountDao();
            dao.updateProfile(acc);
                  
                  
        }
             public void delete(String username)
  {
          try {
            String sql = "delete from Account \n" +
                    "where username=?" ;
                    
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
        
            pre.executeUpdate();
            
        } catch (SQLException ex) {
                

        }
  
}
    }
