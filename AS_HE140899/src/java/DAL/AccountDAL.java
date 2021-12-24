/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class AccountDAL extends BaseDAO<Account>{

    @Override
    public ArrayList<Account> getAll() {
        String sql="SELECT * FROM Account";
        ArrayList<Account> list=new ArrayList<>();
        
        try (PreparedStatement ps=super.connection.prepareStatement(sql);
                ResultSet rs=ps.executeQuery()){
            while(rs.next()){
                Account acc=new Account();
                
                acc.setAccountID(rs.getInt("accountID"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setName(rs.getString("name"));
                acc.setXa(rs.getString("Xa"));
                acc.setAddressNo(rs.getString("addressNo"));
                acc.setHomeNo(rs.getString("homeNo"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setRole(rs.getBoolean("role"));
                list.add(acc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public void insertNewAccount(Account acc) throws SQLException{
        String sql="INSERT INTO [Account] VALUES(?,?,?,?,?,?,?,?)";
        
        try (PreparedStatement ps=super.connection.prepareStatement(sql);){
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getPassword());
            ps.setString(3, acc.getName());
            ps.setString(4, acc.getXa());
            ps.setString(5, acc.getAddressNo());
            ps.setString(6, acc.getHomeNo());
            ps.setString(7, acc.getPhone());
            ps.setString(8, acc.getEmail());
            
            int result=ps.executeUpdate();
            
        }
    }
    
    public void updateNewAccount(Account acc){
        String sql="UPDATE [Account] SET [password]=?,name=?, Xa=?, addressNo=?, homeNo=?, phone=?, email=? WHERE accountID=?";
        
        try (PreparedStatement ps=super.connection.prepareStatement(sql);){
            ps.setString(1, acc.getPassword());
            ps.setString(2, acc.getName());
            ps.setString(3, acc.getXa());
            ps.setString(4, acc.getAddressNo());
            ps.setString(5, acc.getHomeNo());
            ps.setString(6, acc.getPhone());
            ps.setString(7, acc.getEmail());
            ps.setInt(8, acc.getAccountID());
            
            int result=ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Account getAccountByUserPass(String username, String password){
        ArrayList<Account> list=getAll();
        Account acc=null;
        
        for (Account account : list) {
            if(account.getUsername().equals(username)&&account.getPassword().equals(password)){
                acc=account;
            }
        }
        
        return acc;
    }
    @Override
    public void doCloseConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
