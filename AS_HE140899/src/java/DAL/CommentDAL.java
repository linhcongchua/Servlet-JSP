/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Account;
import Model.Comment;
import Model.Product;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class CommentDAL extends BaseDAO<Comment>{

    @Override
    public ArrayList<Comment> getAll() {
        return null;
    }

    public ArrayList<Comment> getListCommentByProduct(int productID){
        ArrayList<Comment> list=new ArrayList<>();
        
        String sql="select A.id,B.name,A.dateC,A.contentC from Comment as A join Account as B on A.accountid=B.accountID where productid="+productID;
        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Comment comment=new Comment(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));

                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Comment> getList3Comment(){
        ArrayList<Comment> list=new ArrayList<>();
        
        String sql="select top 3 A.id,B.name,A.dateC,A.contentC from Comment as A join Account as B on A.accountid=B.accountID";
        try (PreparedStatement ps = super.connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Comment comment=new Comment(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));

                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void insertNewComment(Comment comment, Account acc, int productID){
        String sql = "insert into Comment values (?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, acc.getAccountID());
            ps.setInt(2, productID);
            ps.setString(3, comment.getContent());
            ps.setDate(4, new Date(new java.util.Date().getTime()));
            int result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
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
    public static void main(String[] args) {
        CommentDAL commentDAL=new CommentDAL();
        ArrayList<Comment> adu = commentDAL.getListCommentByProduct(1);
        for (Comment comment : adu) {
            System.out.println(comment);
        }
    }
    
}
