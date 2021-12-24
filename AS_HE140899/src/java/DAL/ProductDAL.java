/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Order;
import Model.Product;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class ProductDAL extends BaseDAO<Product> {

    @Override
    public ArrayList<Product> getAll() {
        String sql = "SELECT * FROM Product";
        ArrayList<Product> list = getProduct(sql);
        return list;
    }

    public ArrayList<Product> getMainProduct() {
        String sql = "SELECT * FROM Product WHERE productID in (SELECT productID FROM MainProduct)";
        ArrayList<Product> list = getProduct(sql);
        return list;
    }
    
    public int deleteOneMainProduct(String productID) throws SQLException{
        String sql="DELETE FROM MainProduct WHERE productID="+productID;
        PreparedStatement ps=connection.prepareStatement(sql);
        return ps.executeUpdate();
    }
    
    public int addNewMainProduct(String productID) throws SQLException{
        String sql="INSERT INTO MainProduct(productID) VALUES (" + productID+ ")";
        PreparedStatement ps=connection.prepareStatement(sql);
        return ps.executeUpdate();
    }

    public ArrayList<Product> getProductByType(String typeID) {
        String sql = "SELECT * FROM Product where typeID=" + typeID;
        return getProduct(sql);
    }

    public Product getProductByID(String productID) {
        String sql = "SELECT * FROM Product where productID=" + productID;
        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();

                p.setProductID(rs.getInt("productID"));
                p.setName(rs.getString("name"));
                p.setTypeID(rs.getInt("typeID"));
                p.setStatus(rs.getString("status"));
                p.setPathImage(rs.getString("image"));
                p.setSalePrice(BigDecimal.valueOf(rs.getFloat("salePrice")));
                p.setPrice(BigDecimal.valueOf(rs.getFloat("price")));
                p.setRate(rs.getInt("rate"));
                p.setSold(rs.getInt("sold"));
                p.setAvailable(rs.getBoolean("available"));
                p.setDescription(rs.getString("description"));
                p.setIngredient(rs.getString("ingredient"));

                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getProduct(String sql) {

        ArrayList<Product> list = new ArrayList<>();

        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();

                p.setProductID(rs.getInt("productID"));
                p.setName(rs.getString("name"));
                p.setTypeID(rs.getInt("typeID"));
                p.setStatus(rs.getString("status"));
                p.setPathImage(rs.getString("image"));
                p.setSalePrice(BigDecimal.valueOf(rs.getFloat("salePrice")));
                p.setPrice(BigDecimal.valueOf(rs.getFloat("price")));
                p.setRate(rs.getInt("rate"));
                p.setSold(rs.getInt("sold"));
                p.setAvailable(rs.getBoolean("available"));
                p.setDescription(rs.getString("description"));
                p.setIngredient(rs.getString("ingredient"));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public void insertNewProduct(Product p){
        String sql="INSERT INTO Product VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps=super.connection.prepareCall(sql)){
            ps.setString(1, p.getName());
            ps.setInt(2, p.getTypeID());
            ps.setString(3, p.getStatus());
            ps.setString(4, p.getPathImage());
            ps.setFloat(5, p.getSalePrice().floatValue());
            ps.setFloat(6, p.getPrice().floatValue());
            ps.setInt(7, p.getRate());
            ps.setInt(8, p.getSold());
            ps.setBoolean(9, p.isAvailable());
            ps.setString(10, p.getDescription());
            ps.setString(11, p.getIngredient());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public int updateProduct(Product p){
        String sql="UPDATE Product SET"
                + " name=?, typeID= ?, status=?, image=?, salePrice=?"
                + " , price=?, rate= ?, sold=?, available=?, description=?, ingredient=? "
                + " WHERE productID=?";
        try (PreparedStatement ps=super.connection.prepareCall(sql)){
            ps.setString(1, p.getName());
            ps.setInt(2, p.getTypeID());
            ps.setString(3, p.getStatus());
            ps.setString(4, p.getPathImage());
            ps.setFloat(5, p.getSalePrice().floatValue());
            ps.setFloat(6, p.getPrice().floatValue());
            ps.setInt(7, p.getRate());
            ps.setInt(8, p.getSold());
            ps.setBoolean(9, p.isAvailable());
            ps.setString(10, p.getDescription());
            ps.setString(11, p.getIngredient());
            ps.setInt(12, p.getProductID());
            
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        OrderDAL orderDAL = new OrderDAL();
        ArrayList<Order> listOrder = orderDAL.getListOrderByAccountID(1);
        ProductDAL productDAL = new ProductDAL();
        ArrayList<Product> allProduct = productDAL.getAll();

        HashMap<Integer, Product> orderDetect = new HashMap<Integer, Product>();
        for (Product product : allProduct) {
            orderDetect.put(product.getProductID(), product);
            if(product.getProductID()==16){
                System.out.println(product.getPrice());
            }
        }
        for (Order order : listOrder) {
//            System.out.println(order.getProductID());
            System.out.println(orderDetect.get(order.getProductID()).getPrice());
//            System.out.println(order);
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
}
