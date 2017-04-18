package ir.aut.hw2.question2;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Rect {

    private double sideA;
    private double sideB;

    public enum RectTypeEnum {
        Rect,
        Square
    }


    public Rect() {
        this(0, 0);
    }

    public Rect(double a, double b) {
        sideA = a;
        sideB = b;
    }

    public double getSideB() {
        return sideB;
    }

    public double getSideA() {
        return sideA;
    }

    public void setSideB(double sideB) {
        this.sideB = sideB;
    }

    public void setSideA(double sideA) {
        this.sideA = sideA;
    }

    public RectTypeEnum getType() {
        RectTypeEnum type;
        if (getSideA() == getSideB()) {
            type = RectTypeEnum.Square;
        } else {
            type = RectTypeEnum.Rect;
        }

        return type;
    }

    public boolean isEqual(Rect that) {
        return (sideA == that.sideA && sideB == that.sideB) || (sideB == that.sideA && sideA == that.sideB);
    }

    public double getArea() {
        return sideA * sideB;
    }

    public double getPerimeter() {
        return 2 * (sideA + sideB);
    }


}
