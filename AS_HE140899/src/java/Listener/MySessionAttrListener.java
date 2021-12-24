/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listener;

import DAL.BasketDAL;
import DAL.OrderDAL;
import Model.Account;
import Model.Basket;
import Model.Order;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 *
 * @author DELL
 */
public class MySessionAttrListener implements HttpSessionAttributeListener {

    public void attributeAdded(HttpSessionBindingEvent sessionBindingEvent) {
        sessionBindingEvent.getSession();
        // Get the session
        HttpSession session = sessionBindingEvent.getSession();

        // Log some information
        System.err.println("[SessionAttr] " + new java.util.Date() + " Attribute added, session " + session + ": " + sessionBindingEvent.getName() + "=" + sessionBindingEvent.getValue());
        if(sessionBindingEvent.getName().equals("acc")){
            BasketDAL basketDAL=new BasketDAL();
            
            Account acc=(Account) sessionBindingEvent.getValue();
            ArrayList<Basket> listBasket = basketDAL.getListBasket(acc.getAccountID());
            
            basketDAL.doCloseConnection();
            session.setAttribute("listBasket", listBasket);
        }
    }

    public void attributeRemoved(HttpSessionBindingEvent sessionBindingEvent) {

        // Get the session
        HttpSession session = sessionBindingEvent.getSession();

        // Log some information
        System.out.println("[SessionAttr] " + new java.util.Date() + " Attribute removed, session " + session + ": " + sessionBindingEvent.getName());
    }

    public void attributeReplaced(HttpSessionBindingEvent sessionBindingEvent) {

        // Get the session
        HttpSession session = sessionBindingEvent.getSession();

        // Log some information
        System.out.println("[SessionAttr] " + new java.util.Date() + " Attribute replaced, session " + session + ": " + sessionBindingEvent.getName() + "=" + sessionBindingEvent.getValue());
    }

}
