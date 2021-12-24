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
public class Star {
    private int type;//1-5 star
    private int percent;
    private int numReview;

    public Star() {
    }

    public Star(int type, int percent, int numReview) {
        this.type = type;
        this.percent = percent;
        this.numReview = numReview;
    }
    
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public int getNumReview() {
        return numReview;
    }

    public void setNumReview(int numReview) {
        this.numReview = numReview;
    }
    
}
