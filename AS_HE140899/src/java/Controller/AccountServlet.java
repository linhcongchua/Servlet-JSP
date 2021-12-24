/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.AccountDAL;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Account acc = (Account) session.getAttribute("acc");
        request.getRequestDispatcher("Account.jsp").forward(request, response);
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
        String password=request.getParameter("password");
        String name=request.getParameter("hoten");
        String Xa = request.getParameter("Xa");
        String addressNo = request.getParameter("addressNo");
        String homeNo = request.getParameter("homeNo");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Account accUpdate=new Account(acc.getAccountID(), acc.getUsername(), password, name, Xa, addressNo, homeNo, phone, email,false);
        
        AccountDAL accountDAL=new AccountDAL();
        accountDAL.updateNewAccount(accUpdate);
        accountDAL.doCloseConnection();
        
        response.sendRedirect("logout");
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
