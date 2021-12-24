/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.CommentDAL;
import DAL.OrderDAL;
import DAL.ProductDAL;
import Model.Account;
import Model.Basket;
import Model.Comment;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class ProductSingleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        String productID = request.getParameter("productID");

        ProductDAL productDAL = new ProductDAL();
        Product p = productDAL.getProductByID(productID);

        request.setAttribute("product", p);
        
        CommentDAL commentDAL=new CommentDAL();
        
        String comment=request.getParameter("comment");
        if(comment!=null){
            Comment c=new Comment(0, null, null, comment);
            commentDAL.insertNewComment(c, acc, Integer.parseInt(productID));
            
        }
        
        ArrayList<Comment> listComment=commentDAL.getListCommentByProduct(p.getProductID());
        request.setAttribute("commentList", listComment);

        String quantity = request.getParameter("quantity");
        if (quantity != null) {
            ArrayList<Basket> listBasket = (ArrayList<Basket>) session.getAttribute("listBasket");
            int quan=Integer.parseInt(quantity);
            Basket basket = new Basket(Integer.parseInt(productID), quan, null);
            listBasket = doWithBasket(listBasket, basket);
            session.setAttribute("listBasket", listBasket);
        }
        
        commentDAL.doCloseConnection();
        productDAL.doCloseConnection();
        
        request.getRequestDispatcher("Product_Single.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private ArrayList<Basket> doWithBasket(ArrayList<Basket> listBasket, Basket basket) {
        boolean hasExistOrder = false;
        for (Basket b : listBasket) {
            if (b.getProductid() == basket.getProductid()) {
                b.setQuantity(b.getQuantity() + basket.getQuantity());
                hasExistOrder = true;
            }
        }
        if (!hasExistOrder) {
            listBasket.add(basket);
        }
        return listBasket;
    }
}
