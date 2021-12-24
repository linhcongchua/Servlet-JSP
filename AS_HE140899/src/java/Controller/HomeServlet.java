/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.CommentDAL;
import DAL.OrderDAL;
import DAL.ProductDAL;
import DAL.TypeProductDAL;
import Model.Account;
import Model.Comment;
import Model.Order;
import Model.Product;
import Model.TypeProduct;
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
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        //list danh sach product
        ProductDAL productDAL = new ProductDAL();
        ArrayList<Product> productList = productDAL.getMainProduct();
        request.setAttribute("productList", productList);
        
        //list danh sach cac loa do
        TypeProductDAL typeProductDAL = new TypeProductDAL();
        ArrayList<TypeProduct> typeList = typeProductDAL.getAllExist();
        
        if(acc!=null){
            if(acc.isRole()){
                typeList=typeProductDAL.getAll();
            }
        }

        request.setAttribute("typeList", typeList);

        //hashMap type loaij number voi string
        HashMap<Integer, String> typeDetect = new HashMap<>();
        for (TypeProduct typeProduct : typeList) {
            typeDetect.put(typeProduct.getId(), typeProduct.getName());
        }
        request.setAttribute("typeDetect", typeDetect);
        
        CommentDAL commentDAL=new CommentDAL();
        ArrayList<Comment> listComment=commentDAL.getList3Comment();
        request.setAttribute("listComment", listComment);
        
        productDAL.doCloseConnection();
        typeProductDAL.doCloseConnection();
        commentDAL.doCloseConnection();

        request.getRequestDispatcher("Home.jsp").forward(request, response);
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

}
