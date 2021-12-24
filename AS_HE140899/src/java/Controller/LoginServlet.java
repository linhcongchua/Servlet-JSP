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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LoginServlet extends HttpServlet {

    @Override
    //ham nay de dang nhap thang luon neu o trong trang web chi can click vao thui
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPage = request.getParameter("currentPage");
        String useCookie=request.getParameter("useCookie");
        
        String username = null;
        String password = null;
        Account acc = null;
        
        HttpSession session = request.getSession();
        session.setAttribute("currentPage", currentPage);

        if(useCookie==null){
            response.sendRedirect("login.jsp");
            return;
        }
        
        AccountDAL accountDAL = new AccountDAL();

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
            }
            if (username != null && password != null) {
                acc = accountDAL.getAccountByUserPass(username, password);
            }
        }

        if (acc != null) {
            session.setAttribute("acc", acc);
            request.getRequestDispatcher(currentPage).forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String currentPage = (String) session.getAttribute("currentPage");

        if (currentPage == null) {
            currentPage = "home";
        }

        AccountDAL accountDAL = new AccountDAL();
        Account acc = accountDAL.getAccountByUserPass(username, password);

        if (acc != null) {
            String remember = request.getParameter("remember");
            session.setAttribute("acc", acc);
            if (remember != null) {
                Cookie user_c = new Cookie("username", acc.getUsername());
                Cookie pass_c = new Cookie("password", acc.getUsername());

                user_c.setMaxAge(30 * 24 * 3600);
                pass_c.setMaxAge(30 * 24 * 3600);

                response.addCookie(user_c);
                response.addCookie(pass_c);
//                response.sendRedirect("index.html");
            }
            request.getRequestDispatcher(currentPage).forward(request, response);
        } else {
            request.setAttribute("fail", "Login Fail!!! Check your username and password");
            request.getRequestDispatcher("login.jsp").include(request, response);
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
