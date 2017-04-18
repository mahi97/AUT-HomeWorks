package ir.aut.hw4.question1;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Sum Squares Class
 * Created by Rahimi on 3/16/17.
 */

public class SumSquares {
    /**
     * The ArrayList of all numbers
     */
    private ArrayList<Integer> arrayList;

    public void setArrayList(ArrayList<Integer> arrayList) {
        this.arrayList = arrayList;
    }

    /**
     * Write the square of each number in a file also sum of them in the next line
     */
    public void writeOutSquare() {
        Integer tempSum = 0;
        FileWriter file;
        try {
            file = new FileWriter("out.txt");

            for (Integer i : arrayList) {
                int tempSquare = i * i;
                file.write(tempSquare + " ");
                tempSum += tempSquare;
            }

            file.write("\n" + tempSum.toString());
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
