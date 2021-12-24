/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author DELL
 */
public class ThuImage {

    private static String doWithImage(String imagePath) throws IOException {
        File file = new File(imagePath);

        String path = imagePath.substring(imagePath.lastIndexOf("\\") + 1);
        path = path.substring(0, path.lastIndexOf(".")) + ".jpg";

        File fileA = new File("web\\imageAssign\\" + path);
        BufferedImage bImage = ImageIO.read(file);
        if (bImage == null) {
            throw new IOException();
        }
        ImageIO.write(bImage, "jpg", fileA);
        return path;
    }

    private String doWithImage2(String imagePath) throws IOException {
        File file = new File(imagePath);

        String path = imagePath.substring(imagePath.lastIndexOf("\\") + 1);
        path = path.substring(0, path.lastIndexOf(".")) + ".jpg";
        File fileA = new File("web\\imageAssign\\" + path);
        BufferedImage bImage = ImageIO.read(file);
        if (bImage == null) {
            System.out.println("dmno null");
            throw new IOException();
        }
        ImageIO.write(bImage, "jpg", fileA);
        return path;
    }

    public static void main(String[] args) throws IOException {
//        System.out.println(doWithImage("C:\\Users\\DELL\\Pictures\\Camera Roll\\ThuAS.jpg"));
ThuImage t=new ThuImage();
t.doWithImage2("C:\\Users\\DELL\\Pictures\\Camera Roll\\ThuAS.jpg");
    }
}
