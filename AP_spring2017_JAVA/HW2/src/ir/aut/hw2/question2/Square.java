package ir.aut.hw2.question2;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Square {


    private double side;

    public Square() {
        this(0);
    }

    public Square(double a) {
        side = a;
    }

    public void setSide(double side) {
        this.side = side;
    }

    public double getSide() {
        return side;
    }

    public double getDiameter() {
        return Math.sqrt(2) * side;
    }

    public double getArea() {
        return side * side;
    }

    public double getPerimeter() {
        return 4 * side;
    }

    public boolean isEqual(Square that) {
        return this.side == that.side;
    }


}
