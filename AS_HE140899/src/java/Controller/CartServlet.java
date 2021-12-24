/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.OrderDAL;
import DAL.ProductDAL;
import Model.Account;
import Model.Basket;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String deleteProductID = request.getParameter("delete");
        
        if (deleteProductID != null) {
            OrderDAL orderDAL = new OrderDAL();
            orderDAL.deleteByOrderID(deleteProductID);
            
            ArrayList<Basket> listBasket=(ArrayList<Basket>) session.getAttribute("listBasket");
            
            for (int i = 0; i < listBasket.size(); i++) {
                Basket basket=listBasket.get(i);
                if((basket.getProductid()+"").equalsIgnoreCase(deleteProductID)){
                    listBasket.remove(i);
                    break;
                }
            }
        }

        ProductDAL productDAL = new ProductDAL();
        ArrayList<Product> allProduct = productDAL.getAll();

        request.getRequestDispatcher("Cart.jsp").forward(request, response);
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

}
