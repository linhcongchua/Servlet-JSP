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
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author DELL
 */
public class SessionListen implements HttpSessionListener{

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session created");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ArrayList<Basket> listOrder=(ArrayList<Basket>) session.getAttribute("listBasket");
        Account acc=(Account) session.getAttribute("acc");
//        BasketDAL basketDAL=new BasketDAL();
//        basketDAL.order(listOrder, acc, false);
//        basketDAL.doCloseConnection();
        OrderDAL orderDAL=new OrderDAL();
        ArrayList<Integer> listBuy=new ArrayList<>();
        orderDAL.updateAndInsertOrder(listOrder, listBuy, acc);
        orderDAL.doCloseConnection();
    }
    
}
