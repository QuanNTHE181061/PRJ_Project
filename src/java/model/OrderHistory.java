/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanpyke
 */
public class OrderHistory {
    String username;
    Food f;
    int quantity;
    String date;

    public OrderHistory(String username, Food f, int quantity, String date) {
        this.username = username;
        this.f = f;
        this.quantity = quantity;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Food getF() {
        return f;
    }

    public void setF(Food f) {
        this.f = f;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    
    
    
    
}