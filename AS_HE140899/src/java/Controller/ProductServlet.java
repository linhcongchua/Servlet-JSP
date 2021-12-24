/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.OrderDAL;
import DAL.ProductDAL;
import DAL.TypeProductDAL;
import Model.Account;
import Model.Basket;
import Model.Order;
import Model.Product;
import Model.TypeProduct;
import java.io.IOException;
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
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        //check product buy in product.jsp click buy
        if(acc==null){
            String isBuy=request.getParameter("isBuy");
            if(isBuy!=null){
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        
        //list danh sach product
        String typeID = request.getParameter("typeID");
        if (typeID == null) {
            typeID=(String) request.getAttribute("typeID");
            if(typeID==null){
                typeID = "1";
            }
        }
        

        Product p = null;

        String productID = request.getParameter("productID");

        ProductDAL productDAL = new ProductDAL();
        ArrayList<Product> productList = productDAL.getProductByType(typeID);
        request.setAttribute("productList", productList);

        //list danh sach cac loa do
        TypeProductDAL typeProductDAL = new TypeProductDAL();
        ArrayList<TypeProduct> typeList = typeProductDAL.getAll();

        request.setAttribute("typeList", typeList);

        //hashMap type loaij number voi string
        HashMap<Integer, String> typeDetect = new HashMap<>();
        for (TypeProduct typeProduct : typeList) {
            typeDetect.put(typeProduct.getId(), typeProduct.getName());
        }
        request.setAttribute("typeDetect", typeDetect);
        
        if (acc != null) {
            //xem acc voi productID co null ko de add them vao gio hang
            if (productID != null) {
                ArrayList<Basket> listBasket=(ArrayList<Basket>)session.getAttribute("listBasket");
                Basket basket=new Basket(Integer.parseInt(productID), 1, null);
                listBasket=doWithBasket(listBasket,basket);
                session.setAttribute("listBasket", listBasket);
            }
        }
        
        productDAL.doCloseConnection();
        typeProductDAL.doCloseConnection();

        request.getRequestDispatcher("Product.jsp").forward(request, response);
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
        doGet(request, response);
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
        boolean hasExistOrder=false;
        for (Basket b : listBasket) {
            if(b.getProductid()==basket.getProductid()){
                b.setQuantity(b.getQuantity()+basket.getQuantity());
                hasExistOrder=true;
            }
        }
        if(!hasExistOrder){
            listBasket.add(basket);
        }
        return listBasket;
    }

}
