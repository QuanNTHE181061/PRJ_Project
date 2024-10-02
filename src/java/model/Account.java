/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanpyke
 */
public class Account {
    String username;
    String password;
   int type;
   String name;
     String email;
   String address;
  String phone;
  String typename;
    public Account(String username, String password, int type, String name, String email, String address) {
        this.username = username;
        this.password = password;
        this.type = type;
        this.name = name;
        this.email = email;
        this.address = address;
    }

    public Account(String username, String password, int type, String name, String email, String address, String phone) {
        this.username = username;
        this.password = password;
        this.type = type;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    

    public Account() {
    }

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Account(String username, String password, int type) {
        this.username = username;
        this.password = password;
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getTypeName()
    {
        if(type==0) return "Admin";
        else if(type==1) return "Employee";
        else return "Customer";
        
    }
    
}
