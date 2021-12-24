/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author DELL
 */
public class Account {
    private int accountID;
    private String username;
    private String password;
    
    private String name;
    private String Xa;
    private String addressNo;
    private String homeNo;
    private String phone;
    private String email;
    private boolean role;
    public Account() {
    }

    public Account(int accountID, String username, String password, String name, String Xa, String addressNo, String homeNo, String phone, String email, boolean role) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.name = name;
        this.Xa = Xa;
        this.addressNo = addressNo;
        this.homeNo = homeNo;
        this.phone = phone;
        this.email = email;
        this.role = role;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }
    
    
    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
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

    public String getXa() {
        return Xa;
    }

    public void setXa(String Xa) {
        this.Xa = Xa;
    }

    public String getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(String addressNo) {
        this.addressNo = addressNo;
    }

    public String getHomeNo() {
        return homeNo;
    }

    public void setHomeNo(String homeNo) {
        this.homeNo = homeNo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
