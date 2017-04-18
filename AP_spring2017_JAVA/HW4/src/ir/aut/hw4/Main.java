package ir.aut.hw4;

import ir.aut.hw4.question1.SumSquares;
import ir.aut.hw4.question2.CharDictionary;
import ir.aut.hw4.question3.LCS;
import ir.aut.hw4.question4.FilterImage;

import java.util.ArrayList;

/**
 *
 * Created by Rahimi on 3/16/17.
 */
public class Main {

    private static void runQuestion1() {
        SumSquares s = new SumSquares();
        ArrayList<Integer> arr = new ArrayList<>();
        arr.add(3);
        arr.add(4);
        arr.add(5);
        arr.add(6);
        arr.add(7);
        arr.add(8);

        s.setArrayList(arr);
        s.writeOutSquare();
    }

    private static void runQuestion2() {
        CharDictionary cd = new CharDictionary();
        cd.charFrequency("in.txt");
        cd.displayFrequency();
        cd.saveFrequency();
        cd.charFrequency("out.txt");
        cd.displayFrequency();
        cd.saveFrequency();
    }

    private static void runQuestion3() {
        LCS lcs = new LCS();
        System.out.println(lcs.getLongestCommonSequence("first.txt", "second.txt"));

    }

    private static void runQuestion4() {
        FilterImage fi = new FilterImage("img.jpg", "out.jpg");
        fi.writeImage(fi.negativeImage());
    }

    public static void main(String[] args) {
        System.out.println("START 1");
        runQuestion1();
        System.out.println("END 1");
        System.out.println("START 2");
        runQuestion2();
        System.out.println("END 2");
        System.out.println("START 3");
        runQuestion3();
        System.out.println("END 3");
        System.out.println("START 4");
        runQuestion4();
        System.out.println("END 4");

    }
}
