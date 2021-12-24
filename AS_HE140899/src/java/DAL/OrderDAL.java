/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Account;
import Model.Basket;
import Model.Order;
import Model.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author DELL
 */
public class OrderDAL extends BaseDAO<Order> {

    @Override
    public ArrayList<Order> getAll() {
        String sql = "SELECT * FROM [Order]";
        return getOrderStore(sql);
    }

    public ArrayList<Order> getListOrderByAccountID(int accountID) {
        String sql = "SELECT * FROM [Order] WHERE accountID='" + accountID + "' and [status] = 0";
        return getOrderStore(sql);
    }
    
    public ArrayList<Order> getListOrderInMon(){
        String sql="select * from [Order] where MONTH(dateBuy)=MONTH(GETDATE()) and [status]=1 ORDER BY dateBuy DESC";
        return getOrderStore(sql);
    }

    public ArrayList<Order> getOrderStore(String sql) {

        ArrayList<Order> list = new ArrayList<>();

        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();

                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setProductID(rs.getInt("productID"));
                order.setQuantity(rs.getInt("quantity"));
                order.setStatus(rs.getBoolean("status"));
                order.setDateBuy(rs.getDate("dateBuy"));

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    

    public void deleteByOrderID(String id) {
        String sql = "DELETE FROM [Order] WHERE productID=" + id;
        try (PreparedStatement ps = connection.prepareStatement(sql);) {
            int result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void orderNewOne(Basket basket, Account acc, boolean status) {
        String sql = "insert into [Order] values (?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, acc.getAccountID());
            ps.setInt(2, basket.getProductid());
            ps.setInt(3, basket.getQuantity());
            ps.setBoolean(4, status);
            ps.setDate(5, new Date(new java.util.Date().getTime()));
            int result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Basket> updateAndInsertOrder(ArrayList<Basket> listBasket, ArrayList<Integer> listBuy, Account acc){
        deleteOldOne();
        
        ArrayList<Basket> listB=new ArrayList<>();
        ArrayList<Basket> listStore=new ArrayList<>();
        boolean isBuy=false;
        for (int i = 0; i < listBasket.size(); i++) {
            isBuy=false;
            Basket temp = listBasket.get(i);
            for (int productid : listBuy) {
                if(temp.getProductid()==productid){
                    isBuy=true;
                }
            }
            if(isBuy){
                listB.add(temp);
            }else{
                listStore.add(temp);
            }
        }
        for (Basket basket : listStore) {
            orderNewOne(basket, acc, false);
        }
        for (Basket basket : listB) {
            orderNewOne(basket, acc, true);
        }
        return listStore;
        
    }
    
    public void deleteOldOne(){
        String sql="Delete from [Order] where [status]=0";
        try (PreparedStatement ps=connection.prepareStatement(sql)){
            int result=ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<Order> getListAlreadyBuy(int accountID){
        String sql = "SELECT * FROM [Order] WHERE accountID='" + accountID + "' and [status] = 1";
        return getOrderStore(sql);
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
