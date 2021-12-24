/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.BasketDAL;
import DAL.OrderDAL;
import DAL.ProductDAL;
import Model.Account;
import Model.Basket;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        BigDecimal total=new BigDecimal(BigInteger.ZERO);
        
        ArrayList<Integer> listBuy=new ArrayList<>();
        ArrayList<Basket> listBasket = (ArrayList<Basket>) session.getAttribute("listBasket");
        
        ServletContext context = getServletContext();
        String listString = context.getInitParameter("listXa");
        HashMap<Integer, Product> orderDetect=(HashMap<Integer, Product>) context.getAttribute("orderDetect");
        
//dang sua doan nay basket voi order de jsp deisplay
        for (Basket basket : listBasket) {
            String checkID = request.getParameter("check" + basket.getProductid());
            if(checkID!=null){
                String quantity = request.getParameter("quantity" + basket.getProductid());
                int quan = Integer.parseInt(quantity);
                basket.setQuantity(quan);
                listBuy.add(basket.getProductid());
                
                BigDecimal temp=new BigDecimal(quan);
                temp=temp.multiply(orderDetect.get(basket.getProductid()).getPrice());
                total=total.add(temp);
            }
        }

        session.setAttribute("listBuy", listBuy);
        session.setAttribute("listBasket", listBasket);
        request.setAttribute("total", total);

        request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        ArrayList<Basket> listBasket = (ArrayList<Basket>) session.getAttribute("listBasket");
        ArrayList<Integer> listBuy = (ArrayList<Integer>) session.getAttribute("listBuy");
        if (listBuy == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        OrderDAL orderDAL=new OrderDAL();
        listBasket=orderDAL.updateAndInsertOrder(listBasket, listBuy, acc);
        
        session.setAttribute("listBasket", listBasket);
        orderDAL.doCloseConnection();
        response.sendRedirect("home");
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
