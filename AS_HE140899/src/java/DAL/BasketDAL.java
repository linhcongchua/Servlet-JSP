/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Account;
import Model.Basket;
import Model.Order;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class BasketDAL extends BaseDAO<Basket>{

    @Override
    public ArrayList<Basket> getAll() {
        return null;
    }
    
    public void orderNewOne(Basket b, Account acc, boolean isBuy) {
        String sql = "insert into [Order] values (?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, acc.getAccountID());
            ps.setInt(2, b.getProductid());
            ps.setInt(3, b.getQuantity());
            ps.setBoolean(4, isBuy);
            ps.setDate(5, new Date(new java.util.Date().getTime()));
            int result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void order(ArrayList<Basket> listOrder, Account acc, boolean isBuy) {
        for (Basket basket : listOrder) {
            orderNewOne(basket, acc,isBuy);
        }
    }
    //ham phat hien cai nao moi order new ko thi update
    public void order(ArrayList<Basket> listOrder,ArrayList<Integer> listBuy , Account acc, boolean isBuy) {
        for (Basket basket : listOrder) {
            for (Integer integer : listBuy) {
                if(basket.getProductid()==integer){
                    orderNewOne(basket, acc,isBuy);
                }
            }
        }
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

    public ArrayList<Basket> getListBasket(int accountID) {
        ArrayList<Basket> list = new ArrayList<>();
        String sql="SELECT A.productID,A.quantity,B.[image] FROM [Order] AS A JOIN [PRODUCT] AS B ON A.productID=B.productID  WHERE accountID="+accountID+" and A.status=0";
        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Basket b=new Basket(rs.getInt(1), rs.getInt(2), rs.getString(3));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
