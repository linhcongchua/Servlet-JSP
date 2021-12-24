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
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author DELL
 */
public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
//        ctx.setAttribute("thu", "adu thu dc ko");
        Object check = ctx.getAttribute("orderDetect");
        if (check == null) {
            ProductDAL productDAL = new ProductDAL();
            ArrayList<Product> allProduct = productDAL.getAll();
            HashMap<Integer, Product> orderDetect = new HashMap<Integer, Product>();
            for (Product product : allProduct) {
                orderDetect.put(product.getProductID(), product);
            }
            ctx.setAttribute("orderDetect", orderDetect);
            
            productDAL.doCloseConnection();
        }
        Object listXa = ctx.getAttribute("listXa");
        if (listXa == null) {
            String listString = ctx.getInitParameter("listXa");
            String[] listXa1 = listString.split(";");
            List<String> listXaSplit = new ArrayList<>();
            for (String string : listXa1) {
                listXaSplit.add(string);
            }
            ctx.setAttribute("listXa", listXaSplit);
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

}
