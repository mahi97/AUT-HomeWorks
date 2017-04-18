package ir.aut.hw3.question1;

/**
 *
 * Complex Number Class
 * Created by Rahimi on 2/20/17.
 */

public class ComplexNumber {

    private double real, img;
    private static int count;


    public ComplexNumber() {
        img = real = 0.0;
        this.count++;
    }

    public ComplexNumber(double real, double img) {
        this.real = real;
        this.img  = img;
        this.count++;
    }


    public ComplexNumber add(ComplexNumber that) {
        return new ComplexNumber(this.real + that.getReal(), this.img + that.getImg());
    }

    public ComplexNumber subtract(ComplexNumber that) {
        return new ComplexNumber(this.getReal() - that.getReal(), this.getImg() - that.getImg());
    }

    public ComplexNumber multiply(ComplexNumber that) {
        return new ComplexNumber(this.getReal() * that.getReal() - this.getImg()  * that.getImg(),
                           this.getImg()  * that.getReal() + that.getImg() * this.getReal());
    }

    public ComplexNumber divide(ComplexNumber that) {
        double down = that.getReal()   * that.getReal() + that.getImg() * that.getImg();
        double real = ( this.getReal()  * that.getReal() + this.getImg()  * that.getImg() ) / down;
        double img  = ( that.getReal() * this.getImg()   - that.getImg() * this.getReal() ) / down;

        return new ComplexNumber(real, img);
    }

    public boolean isEqual(ComplexNumber that) {
        return (this.real == that.real) && (this.img == that.img);
    }

    @Override
    public String toString() {
        return real + " + " + img + "i";

    }

    @Override
    protected void finalize() throws Throwable {
        this.count--;
        super.finalize();
    }

    public double getReal() {
        return real;
    }

    public double getImg() {
        return img;
    }



    public void setReal(double real) {
        this.real = real;
    }

    public void setImg(double img) {
        this.img = img;
    }

    public static int getCount() {
        return count;
    }


}
