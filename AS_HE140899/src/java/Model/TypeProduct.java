/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author DELL
 */
public class TypeProduct {
    private int id;
    private String name;
    private String description;
    private String pathImage;

    public TypeProduct() {
    }

    public TypeProduct(int id, String name, String description, String pathImage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.pathImage = pathImage;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPathImage() {
        return pathImage;
    }

    public void setPathImage(String pathImage) {
        this.pathImage = pathImage;
    }

    @Override
    public String toString() {
        return "TypeProduct{" + "id=" + id + ", name=" + name + ", description=" + description + ", pathImage=" + pathImage + '}';
    }
    
}
