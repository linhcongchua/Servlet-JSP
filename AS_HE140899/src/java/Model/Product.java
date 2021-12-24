/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.math.BigDecimal;

/**
 *
 * @author DELL
 */
public class Product {
    private int productID;
    private String name;
    private int typeID;
    private String status;
    private String pathImage;
    private BigDecimal salePrice;
    private BigDecimal price;
    private int rate;
    private int sold;
    private boolean available;
    private String description;
    private String ingredient;

    public Product() {
    }

    public Product(int productID, String name, int typeID, String status, String pathImage, BigDecimal salePrice, BigDecimal price, int rate, int sold, boolean available, String description, String ingredient) {
        this.productID = productID;
        this.name = name;
        this.typeID = typeID;
        this.status = status;
        this.pathImage = pathImage;
        this.salePrice = salePrice;
        this.price = price;
        this.rate = rate;
        this.sold = sold;
        this.available = available;
        this.description = description;
        this.ingredient = ingredient;
    }

    
    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPathImage() {
        return pathImage;
    }

    public void setPathImage(String pathImage) {
        this.pathImage = pathImage;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", typeID=" + typeID + ", status=" + status + ", pathImage=" + pathImage + ", salePrice=" + salePrice + ", price=" + price + ", rate=" + rate + ", sold=" + sold + ", available=" + available + ", description=" + description + ", ingredient=" + ingredient + '}';
    }

    
    
}
