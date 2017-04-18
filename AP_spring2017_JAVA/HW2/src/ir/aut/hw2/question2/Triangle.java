package ir.aut.hw2.question2;

/**
 *
 * Created by Rahimi on 2/20/17.
 */

public class Triangle {

    public enum TriangleTypeEnum {
        Isosceles,
        Equilateral,
        Scalene
    }

    private double sideA;
    private double sideB;
    private double sideC;

    public Triangle() {
        this(0, 0, 0);
    }

    public Triangle(double a, double b, double c) {
        this.sideA = a;
        this.sideB = b;
        this.sideC = c;

    }

    public double getSideA() {
        return sideA;
    }

    public void setSideA(double sideA) {
        this.sideA = sideA;
    }

    public double getSideB() {
        return sideB;
    }

    public void setSideB(double sideB) {
        this.sideB = sideB;
    }

    public double getSideC() {
        return sideC;
    }

    public void setSideC(double sideC) {
        this.sideC = sideC;
    }

    public double getPerimeter() {
        return sideA + sideB + sideC;
    }

    public double getArea() {
        double halfP = getPerimeter() / 2.0;
        return Math.sqrt(halfP * (halfP - sideA) * (halfP - sideB) * (halfP - sideC));
    }

    public boolean isEquilateral() {
        return sideA == sideB && sideB == sideC;
    }

    public boolean isIsosceles() {
        return sideA == sideB || sideA == sideC || sideB == sideC;
    }

    public TriangleTypeEnum getType() {

        TriangleTypeEnum type;
        if (isEquilateral()) {
            type = TriangleTypeEnum.Equilateral;
        } else if (isIsosceles()) {
            type = TriangleTypeEnum.Isosceles;
        } else {
            type = TriangleTypeEnum.Scalene;
        }

        return type;
    }

    public boolean isEqual(Triangle that) {
        return this.sideA == that.sideA && this.sideB == that.sideB && this.sideC == that.sideC;
    }

}
