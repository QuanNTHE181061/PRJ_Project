/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import model.Account;
import model.Food;
import model.OrderHistory;

/**
 *
 * @author quanpyke
 */
public class FoodDao extends DBContext {

    public ArrayList<Food> getAll() {
        ArrayList<Food> list = new ArrayList<>();
        String sql = "select * from Food";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int type = rs.getInt("type");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String status = rs.getString("status");
                String img = rs.getString("img");
                Food f = new Food(id, name, type, price, quantity, status, img);
                list.add(f);
            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return list;
    }

    public void insert(Food f) {
        try {
            String sql = "insert into Food (id,name,type,price,quantity,status,img) \n"
                    + "values\n"
                    + "(?, ?, ? , ?, ?, ?, ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, f.getId());
            pre.setString(2, f.getName());
            pre.setInt(3, f.getType());
            pre.setDouble(4, f.getPrice());
            pre.setInt(5, f.getQuantity());
            pre.setString(6, f.getStatus());
            pre.setString(7, f.getImg());
            pre.executeUpdate();

        } catch (SQLException ex) {

        }
    }

    public Food getFoodbyID(int id) {
        Food f = null; // Đặt acc là null để kiểm tra xem có tìm thấy tài khoản không
        String sql = "select * from Food where id=?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) { // Kiểm tra xem có dữ liệu hay không
                String name = rs.getString("name");
                int type = rs.getInt("type");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String status = rs.getString("status");
                String img = rs.getString("img");
                f = new Food(id, name, type, price, quantity, status, img);

            }

            // Đóng ResultSet và PreparedStatement
            rs.close();
            pre.close();

        } catch (SQLException ex) {
            ex.printStackTrace(); // In ra lỗi để dễ dàng kiểm tra và sửa lỗi
        }

        return f;
    }

    public void update(Food f, int fid) {
        String sql = "UPDATE Food SET id=?, name=?, type=?, price=?, quantity=?, status=?, img=? WHERE id=?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, f.getId());
            pre.setString(2, f.getName());
            pre.setInt(3, f.getType());
            pre.setDouble(4, f.getPrice());
            pre.setInt(5, f.getQuantity());
            pre.setString(6, f.getStatus());
            pre.setString(7, f.getImg());
            pre.setInt(8, fid);
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void delete(int fid) {
        String sql = "Delete from Food \n"
                + "where id=? ";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, fid);
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public ArrayList<Food> getCart(String username) {
        ArrayList<Food> list = new ArrayList<>();
        String sql = "SELECT * FROM Cart WHERE username=?";

        try {
            // Thực thi câu truy vấn
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);  // Đặt giá trị cho tham số username
            ResultSet rs = pre.executeQuery();
            FoodDao dao = new FoodDao();
            ArrayList<Food> flist = dao.getAll();
            while (rs.next()) {
                int fid = rs.getInt("fid");
                Food f = getFoodbyID(fid);
                int quantity = rs.getInt("quantity");

                f.setQuantity(quantity);

                list.add(f);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // In ra chi tiết ngoại lệ
        }

        return list;
    }

    public void insertCart(Food f, String username) {
        FoodDao dao = new FoodDao();
        ArrayList<Food> cart = dao.getCart(username);
        Food f1 = getFoodInList(f.getId(), cart);
        if (f1 != null) {
            f1.setQuantity(f1.getQuantity() + f.getQuantity());
            dao.updateCart(f1, username);

        } else {

            try {
                String sql = "insert into Cart (username,fid,quantity) \n"
                        + "values\n"
                        + "(?, ?, ? )";
                PreparedStatement pre = connection.prepareStatement(sql);
                pre.setString(1, username);
                pre.setInt(2, f.getId());
                pre.setInt(3, f.getQuantity());

                pre.executeUpdate();

            } catch (SQLException ex) {

            }

        }
    }

    public void updateCart(Food f, String username) {
        try {
            String sql = "update  Cart  \n"
                    + " set quantity=? \n"
                    + " where fid=? AND username=? ";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, f.getQuantity());
            pre.setInt(2, f.getId());
            pre.setString(3, username);

            pre.executeUpdate();

        } catch (SQLException ex) {

        }

    }

    public void deleteCart(int fid, String username) {
        String sql = "Delete from Cart \n"
                + "where fid=? AND username=?  ";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, fid);
            pre.setString(2, username);
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void insertHistory(ArrayList<Food> flist, String username) {
        FoodDao fdao = new FoodDao();
        Hashtable<String, ArrayList<OrderHistory>> table = getAllHistory();
        String orderid = generateOrderID(table);
        try {
            String sql = "insert into History (OrderId, username,fid,quantity,date) \n"
                    + "values\n"
                    + "(?,?, ?, ?,? )";
            PreparedStatement pre = connection.prepareStatement(sql);
            for (int i = 0; i < flist.size(); i++) {
                pre.setString(1, orderid);
                pre.setString(2, username);
                pre.setInt(3, flist.get(i).getId());
                pre.setInt(4, flist.get(i).getQuantity());
                pre.setString(5, getCurrentDate());
                pre.executeUpdate();
            }
        } catch (SQLException ex) {

        }
    }

    public Hashtable<String, ArrayList<OrderHistory>> getAllHistory() {
        Hashtable<String, ArrayList<OrderHistory>> table = new Hashtable<>();
        String sql = "select * from History";
        FoodDao fdao = new FoodDao();
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {

                String orderid = rs.getString("OrderID");
                ArrayList<OrderHistory> oh = fdao.getHistoryByOrderId(orderid);
                table.put(orderid, oh);

            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return table;
    }

    public Hashtable<String, ArrayList<OrderHistory>> getUserHistory(String username) {
        Hashtable<String, ArrayList<OrderHistory>> table = new Hashtable<>();
        String sql = "select * from History where username=? ";
        FoodDao fdao = new FoodDao();
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {

                String orderid = rs.getString("OrderID");
                ArrayList<OrderHistory> oh = fdao.getHistoryByOrderId(orderid);
                table.put(orderid, oh);

            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return table;
    }

    public Hashtable<String, ArrayList<OrderHistory>> getDateHistory(int distance) {
        Hashtable<String, ArrayList<OrderHistory>> table = new Hashtable<>();
        String sql = "select * from History \n "
                + " where date between DATEADD(day, -?, ?) AND ?    ";
        FoodDao fdao = new FoodDao();
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, distance);
            pre.setString(2, getCurrentDate());
            pre.setString(3, getCurrentDate());
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {

                String orderid = rs.getString("OrderID");
                ArrayList<OrderHistory> oh = fdao.getHistoryByOrderId(orderid);
                table.put(orderid, oh);

            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return table;
    }

    public double getDatePrice(int distance) {
        double sum = 0;

        Hashtable<String, ArrayList<OrderHistory>> table = getDateHistory(distance);
        for (String orderid : table.keySet()) {

            ArrayList<OrderHistory> oh = table.get(orderid);
            for (int i = 0; i < oh.size(); i++) {
                Food f = oh.get(i).getF();
                sum = sum + (oh.get(i).getQuantity() * f.getPrice());

            }

        }
        return sum;

    }

    public Food getFoodQuantity(int distance) {

        String sql = "SELECT top 1  fid,  Sum(quantity) as quantity\n"
                + "FROM History\n"
                + "\n"
                + "WHERE date between DATEADD(day, -?, ?) AND ?\n"
                + "\n"
                + "group by fid\n"
                + "order by Sum(quantity) desc\n";
        int quantity=-1;
        Food f=null;
 try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,distance );
               pre.setString(2, getCurrentDate());
               pre.setString(3, getCurrentDate());
          ResultSet rs = pre.executeQuery();
           if (rs.next()) {
              int fid=rs.getInt("fid");
            quantity = rs.getInt("quantity");
            f=getFoodbyID(fid);
            f.setQuantity(quantity);
        }
          
 }catch (SQLException e) {
            System.out.println("e");
        }
      return f;     

    }

    public ArrayList<OrderHistory> getHistoryByOrderId(String orderid) {
        ArrayList<OrderHistory> list = new ArrayList<>();

        String sql = "select * from History\n"
                + " where orderid=? ";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, orderid);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                int fid = rs.getInt("fid");
                Food f = getFoodbyID(fid);
                int quantity = rs.getInt("quantity");
                f.setQuantity(quantity);
                String date = rs.getString("date");
                OrderHistory oh = new OrderHistory(username, f, quantity, date);
                list.add(oh);

            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return list;

    }

    public String generateOrderID(Hashtable<String, ArrayList<OrderHistory>> table) {
        String orderID = String.format("Or%04d", table.size() + 1);
        return orderID;
    }

    public Food getFoodInList(int id, ArrayList<Food> list) {
        Food f = null;
        for (int i = 0; i < list.size(); i++) {
            if (id == list.get(i).getId()) {
                f = list.get(i);
                break;
            }
        }
        return f;
    }

    public String getCurrentDate() {
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();

        // Định dạng ngày dưới dạng chuỗi
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return currentDate.format(formatter);
    }

 
}
