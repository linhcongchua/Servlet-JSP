/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.TypeProduct;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class TypeProductDAL extends BaseDAO<TypeProduct>{


    public ArrayList<TypeProduct> getAllExist() {
        String sql="SELECT * FROM ProductType WHERE typeID in (SELECT typeID FROM Product)";
        ArrayList<TypeProduct> list=new ArrayList<>();
        
        try (PreparedStatement ps=super.connection.prepareStatement(sql);
                ResultSet rs=ps.executeQuery()){
            while(rs.next()){
                TypeProduct tp=new TypeProduct();
                
                tp.setId(rs.getInt("typeID"));
                tp.setName(rs.getString("name"));
                tp.setPathImage(rs.getString("image"));
                tp.setDescription(rs.getString("description"));
                
                list.add(tp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public ArrayList<TypeProduct> getAll(){
        String sql="SELECT * FROM ProductType";
        ArrayList<TypeProduct> list=new ArrayList<>();
        
        try (PreparedStatement ps=super.connection.prepareStatement(sql);
                ResultSet rs=ps.executeQuery()){
            while(rs.next()){
                TypeProduct tp=new TypeProduct();
                
                tp.setId(rs.getInt("typeID"));
                tp.setName(rs.getString("name"));
                tp.setPathImage(rs.getString("image"));
                tp.setDescription(rs.getString("description"));
                
                list.add(tp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public int addNewType(TypeProduct typeProduct) throws SQLException{
        String sql="INSERT INTO ProductType VALUES (?,?,?)";
        try (PreparedStatement ps=connection.prepareStatement(sql);){
            ps.setString(1, typeProduct.getName());
            ps.setString(2, typeProduct.getPathImage());
            ps.setString(3, typeProduct.getDescription());
            return ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
        return 0;
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
