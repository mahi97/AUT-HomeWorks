package ir.aut.hw2.question2;

/**
 *
 * Circle Class
 * Created by Rahimi on 2/20/17.
 */

public class Circle {

    public final static double PI = 3.14159;

    private double radius;

    public Circle() {
        this(0.0);
    }

    public Circle(double radius) {
        this.radius = radius;
    }

    public double getArea() {
        return PI * radius * radius;
    }

    public double getPerimeter() {
        return 2 * PI * radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public boolean isEqual(Circle that) {
        return this.radius == that.getRadius();
    }

    public double getRadius() {
        return radius;
    }
}
