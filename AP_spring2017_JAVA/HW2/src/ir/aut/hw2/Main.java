package ir.aut.hw2;

import ir.aut.hw2.question1.*;
import ir.aut.hw2.question2.*;
import ir.aut.hw2.question3.*;
import ir.aut.hw2.question4.*;
import ir.aut.hw2.question5.*;

/**
 *
 * Created by Rahimi on 2/27/17.
 */


public class Main {

    private static void runQuestion1() {
        // Question Test Case
        System.out.println("Question 1 ");
//        ComplexNumber complex = new ComplexNumber(2.0, 3.1);
//        ComplexNumber complex2 = new ComplexNumber();
//
//        System.out.println("Total count is :" + ComplexNumber.getCount()); //print 2
//        ComplexNumber complex3 = complex2.add(complex);
//        System.out.println(complex2.subtract(complex));
//        boolean equal = complex2.isEqual(complex); //return true or false
//        ComplexNumber complex4 = complex2.divide(complex);
//        ComplexNumber complex5 = complex2.multiply(complex);
//        double imaginary = complex2.getImg();
//        complex.setReal(3.0);
//        // My Test Case
//        System.out.println(imaginary);
//        System.out.println(complex3.getImg());
//        System.out.println(complex4.getReal());
//        System.out.println(complex5);
//        System.out.println(equal);

        ComplexNumber c1 = new ComplexNumber(4, 3);
        ComplexNumber c2 = new ComplexNumber(-1, 1);
        ComplexNumber c3 = c1.divide(c2);
        System.out.println(c3);

        System.out.println("End of 1");

    }


    private static void runQuestion2() {
        System.out.println("Question 2");

        // Question Test Case

//        Triangle triangle = new Triangle(2, 3, 4); // inputs are sides
//        Triangle triangle2 = new Triangle(3, 3, 3);
//        Square square = new Square(3);
//        Circle circle = new Circle(9); //input is radius
//        double area = triangle.getArea();
//        boolean equal = triangle.isEqual(triangle2); //return true / false
//        Triangle.TriangleTypeEnum type = triangle.getType();
//        boolean isosceles = triangle.isIsosceles();
//
//        // My Test Case
//        System.out.println(square.getArea());
//        System.out.println(circle.getArea());
//        System.out.println(area);
//        System.out.println(equal);
//        System.out.println(type);
//        System.out.println(isosceles);

        Triangle t1 = new Triangle(3, 3, 3);
        Triangle t2 = new Triangle(3, 3, 3);
        Circle c1 = new Circle(4);
        System.out.println(t1.getType());
        System.out.println(t2.getType());
        System.out.println(t1.isEqual(t2));
        System.out.println(c1.getArea());


        System.out.println("End of 2");

    }


    private static void runQuestion3() {
        System.out.println("Question 3");

        // Question Test Case
        Address address = new Address("51", "Vali-asr", "93", "Kerman", "1093013");
        Address address2 = new Address("51", "Vali-asr", "93", "Kerman", "1093013");
        String s = address.toString();
        boolean equal = address.isEqual(address2);
//        // My Test Case
        System.out.println(s);
        System.out.println(equal);
        System.out.println("End of 3");

    }


    private static void runQuestion4() {
        System.out.println("Question 4");

        // Question Test Case
        Contact contact1 = new Contact("Jack", "+989122222222");
        Contact contact2 = new Contact("Ben", "091299999999", 1998);
        AddressBook addressBook = new AddressBook();

        addressBook.add(contact1);
        addressBook.add(contact2);
        int contactCount = addressBook.getContactCount(); //return 2
        System.out.println(contactCount);
        addressBook.displayAll();
        System.out.println("------------");
        addressBook.remove("Ben");

        addressBook.add(new Contact("Rose", "9128888888"));
        addressBook.displayAll();
        // My Test Case
        System.out.println("End of 5");


    }


    private static void runQuestion5() {
        System.out.println("Question 5");
        // Question Test Case
        Machine machine = new Machine("ghasemi");
        Machine machine1 = new Machine("Mahi");
        machine.turn(45);
        machine.turn(Machine.TURN_LEFT);
        machine.setCurrentVelocity(10);
        machine1.setCurrentVelocity(15);
        String s = machine.toString();
        double maxSpeed = Machine.getHighestSpeed();
        long id = machine.getId();
        System.out.println(s);
        // My Test Case
        System.out.println("ID  : " + id);
        System.out.println("Max : " + maxSpeed);
        System.out.println("End of 5");

    }

    public static void main(String[] args) {
        runQuestion1();
        runQuestion2();
        runQuestion3();
        runQuestion4();
        runQuestion5();
    }
}
