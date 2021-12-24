/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Order {
    private int orderID;
    private int accountID;
    private int productID;
    private int quantity;
    private boolean status;//trong gio hang hoc la da mua
    private Date dateBuy;

    public Order() {
    }

    public Order(Order o) {
        this.orderID = o.getOrderID();
        this.accountID = o.getAccountID();
        this.productID = o.getProductID();
        this.quantity = o.getQuantity();
        this.status = o.isStatus();
        this.dateBuy = o.getDateBuy();
    }

    
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getDateBuy() {
        return dateBuy;
    }

    public void setDateBuy(Date dateBuy) {
        this.dateBuy = dateBuy;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", accountID=" + accountID + ", productID=" + productID + ", quantity=" + quantity + ", status=" + status + ", dateBuy=" + dateBuy + '}';
    }
    
}
