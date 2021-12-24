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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hoten = request.getParameter("hoten");
        String xa = request.getParameter("Xa");
        String addressNo = request.getParameter("addressNo");
        String homeNo = request.getParameter("homeNo");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Account acc = new Account(0, username, password, hoten, xa, addressNo, homeNo, phone, email, false);

        AccountDAL accountDAL = new AccountDAL();
        try {
            accountDAL.insertNewAccount(acc);
            HttpSession session = request.getSession();
            session.setAttribute("acc", acc);
            request.getRequestDispatcher("home").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("excep", "Register Fail");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
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
