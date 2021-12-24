/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listener;

import DAL.ProductDAL;
import Model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

/**
 *
 * @author DELL
 */
public class MyServletAttributeListener implements ServletContextAttributeListener{

    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        ServletContext ctx = event.getServletContext();
        String name=event.getName();
        if(name.equalsIgnoreCase("reset")){
            ProductDAL productDAL = new ProductDAL();
            ArrayList<Product> allProduct = productDAL.getAll();
            HashMap<Integer, Product> orderDetect = new HashMap<Integer, Product>();
            for (Product product : allProduct) {
                orderDetect.put(product.getProductID(), product);
            }
            ctx.setAttribute("orderDetect", orderDetect);
            
            productDAL.doCloseConnection();
        }
    }

    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {
        
    }

    @Override
    public void attributeReplaced(ServletContextAttributeEvent event) {
        ServletContext ctx = event.getServletContext();
        String name=event.getName();
        if(name.equalsIgnoreCase("reset")){
            ProductDAL productDAL = new ProductDAL();
            ArrayList<Product> allProduct = productDAL.getAll();
            HashMap<Integer, Product> orderDetect = new HashMap<Integer, Product>();
            for (Product product : allProduct) {
                orderDetect.put(product.getProductID(), product);
            }
            ctx.setAttribute("orderDetect", orderDetect);
            
            productDAL.doCloseConnection();
        }
    }
    
}
