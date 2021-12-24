/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyTag;

import Model.Star;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author DELL
 */
public class TagStarView extends SimpleTagSupport {

    private ArrayList<Star> listStar;
    private String classFather, classIn;

    public void setListStar(ArrayList<Star> listStar) {
        this.listStar = listStar;
    }

    public void setClassFather(String classFather) {
        this.classFather = classFather;
    }

    public void setClassIn(String classIn) {
        this.classIn = classIn;
    }
    
    private final static String FORM_TEMPLATE="<i class=\"%s\"></i>";
    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        JspWriter out = pageContext.getOut();
        for (Star star : listStar) {
            out.println("<p class=\"" + classFather + ">");
            out.println("<span>");
            for (int i = 0; i <= star.getType(); i++) {
                out.println(String.format(FORM_TEMPLATE, classIn));
            }
            out.println(star.getPercent()+"%");
            out.println("</span>");
            out.println("<span>"+star.getNumReview()+" Reviews</span>");
            out.println("</p>");
        }

    }

}
