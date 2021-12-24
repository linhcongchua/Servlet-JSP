/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.AccountDAL;
import DAL.OrderDAL;
import DAL.ProductDAL;
import DAL.TypeProductDAL;
import Model.Account;
import Model.Order;
import Model.Product;
import Model.TypeProduct;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeRequest = request.getParameter("typeRequest");
        
        switch (typeRequest) {
            case "addNewProduct":
                TypeProductDAL typeProductDAL = new TypeProductDAL();
                ArrayList<TypeProduct> listType = typeProductDAL.getAll();
                request.setAttribute("listType", listType);
                request.getRequestDispatcher("AddProduct_A.jsp").forward(request, response);
                return;
            case "addNewMainProduct":
                doAddMainProduct(request, response);
                return;
            case "deleteMainProduct":
                doDeleteMainProduct(request, response);
                return;
            case "addNewType":
                response.sendRedirect("AddType_A.jsp");
                return;
            case "editProduct":
                doEditProductGet(request, response);
                return;
            case "doanhThu":
                doListDoanhThu(request, response);
                return;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeRequest = request.getParameter("typeRequest");
        switch (typeRequest) {
            case "addNewProduct":
                addNewProduct(request, response);
                break;
            case "addNewType":
                addNewType(request, response);
            case "editProduct":
                editProduct(request, response);
            default:

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

    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String availableP = request.getParameter("available");
        String typeID_P = request.getParameter("typeID");
        String status = request.getParameter("status");
        String price_P = request.getParameter("price");
        String salePrice_P = request.getParameter("salePrice");
        String rateP = request.getParameter("rate");
        String soldP = request.getParameter("sold");
        String description = request.getParameter("description");
        String ingredient = request.getParameter("ingredient");
        String imagePath = request.getParameter("imagePath");
        // chinh sua neu loi say ra
        String imagePathAssign = doWithImage(imagePath);

        int typeID = Integer.parseInt(typeID_P);
        BigDecimal salePrice = new BigDecimal(salePrice_P);
        BigDecimal price = new BigDecimal(price_P);
        int rate = Integer.parseInt(rateP);
        int sold = Integer.parseInt(soldP);
        boolean available = availableP != null;

        Product pro = new Product(0, name, typeID, status, imagePathAssign, salePrice, price, rate, sold, available, description, ingredient);
        ProductDAL productDAL = new ProductDAL();
        productDAL.insertNewProduct(pro);
        productDAL.doCloseConnection();

        //reset list product detect by productID
        ServletContext context = getServletContext();
        context.setAttribute("reset", true);
        //type de tro ve dung trang type
        request.setAttribute("typeID", pro.getTypeID() + "");

        request.getRequestDispatcher("product").forward(request, response);

    }

    private String doWithImage(String imagePath) throws IOException {
        ServletContext ctx = getServletContext();
        String pathProject = ctx.getRealPath("");

        File file = new File(imagePath);

        String path = imagePath.substring(imagePath.lastIndexOf("\\") + 1);
        path = path.substring(0, path.lastIndexOf(".")) + ".jpg";

        File fileA = new File(pathProject + "\\imageAssign\\" + path);
        System.err.println(fileA.getAbsolutePath());
        BufferedImage bImage = ImageIO.read(file);
        if (bImage == null) {
            System.out.println("dmno null");
            throw new IOException();
        }
        ImageIO.write(bImage, "jpg", fileA);
        return path;
    }

    private void doDeleteMainProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        try {
            ProductDAL productDAL = new ProductDAL();
            productDAL.deleteOneMainProduct(productID);
            productDAL.doCloseConnection();
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("home").forward(request, response);
    }

    private void doAddMainProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        try {
            ProductDAL productDAL = new ProductDAL();
            productDAL.addNewMainProduct(productID);
            productDAL.doCloseConnection();
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("home").forward(request, response);
    }

    private void addNewType(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imagePath = request.getParameter("imagePath");

        String path = doWithImage(imagePath);
        TypeProduct type = new TypeProduct(0, name, description, path);

        TypeProductDAL typeProductDAL = new TypeProductDAL();
        try {
            typeProductDAL.addNewType(type);
        } catch (SQLException ex) {
            System.err.println(ex);
        } finally {
            typeProductDAL.doCloseConnection();
        }
        request.getRequestDispatcher("home").forward(request, response);

    }

    private void doEditProductGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext ctx = getServletContext();
        
        String productID_P = request.getParameter("productID");
        int productID = Integer.parseInt(productID_P);
        
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
        
        HashMap<Integer, Product> orderDetect = (HashMap<Integer, Product>) ctx.getAttribute("orderDetect");
        Product p = orderDetect.get(productID);
        request.setAttribute("product", p);
        
        request.getRequestDispatcher("EditProduct_A.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext ctx = getServletContext();
        
        String name=request.getParameter("name");
        String productID_P=request.getParameter("productID");
        String available_P=request.getParameter("available");
        String typeID_P=request.getParameter("typeID");
        String price_P=request.getParameter("price");
        String salePrice_P=request.getParameter("salePrice");
        String rate_P=request.getParameter("rate");
        String sold_P=request.getParameter("sold");
        String description=request.getParameter("description");
        String ingredient=request.getParameter("ingredient");
        String status=request.getParameter("status");
        String imagePath=request.getParameter("imagePath");
        
        boolean available=available_P!=null;
        int typeID=Integer.parseInt(typeID_P);
        BigDecimal salePrice=new BigDecimal(salePrice_P);
        BigDecimal price=new BigDecimal(price_P);
        int rate=Integer.parseInt(rate_P);
        int sold=Integer.parseInt(sold_P);
        int productID=Integer.parseInt(productID_P);
        
        HashMap<Integer, Product> orderDetect=(HashMap<Integer, Product>) ctx.getAttribute("orderDetect");
        Product p=orderDetect.get(productID);
        String realPath="";
        if(imagePath.isEmpty()){
            realPath=p.getPathImage();
        }else{
            try {
                realPath=doWithImage(imagePath);
            } catch (IOException ex) {
                realPath=p.getPathImage();
            }
        }
        
        
        Product pUpdate=new Product(productID, name, typeID, status, realPath, salePrice, price, rate, sold, available, description, ingredient);
        
        ProductDAL productDAL=new ProductDAL();
        productDAL.updateProduct(pUpdate);
        productDAL.doCloseConnection();
        
        ctx.setAttribute("reset", true);
        
//        PrintWriter out = response.getWriter();
//        out.print(pUpdate);
        request.getRequestDispatcher("product?typeID="+p.getTypeID()).forward(request, response);
    }

    private void doListDoanhThu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAL orderDAL=new OrderDAL();
        ArrayList<Order> listOrder = orderDAL.getListOrderInMon();
        request.setAttribute("listOrder", listOrder);
        orderDAL.doCloseConnection();
        
        AccountDAL accountDAL=new AccountDAL();
        ArrayList<Account> listAccount = accountDAL.getAll();
        HashMap<Integer, Account> mapAcc=new HashMap<>();
        for (Account account : listAccount) {
            mapAcc.put(account.getAccountID(), account);
        }
        request.setAttribute("mapAcc", mapAcc);
        request.getRequestDispatcher("ListMonOrder_A.jsp").forward(request, response);
    }
    

}
