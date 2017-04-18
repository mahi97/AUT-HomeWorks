package ir.aut.hw3.question1;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * Created by Rahimi on 3/7/17.
 */

public class ComplexNumberExtension {
    private ComplexNumber [] complexArray;
    private ArrayList<ComplexNumber> complexList;
    private int cursor = 0;



    public ComplexNumberExtension() {
        complexArray = new ComplexNumber[100];
    }

    /**
     * This method add a complex number to ArrayList
     * @param complex
     */
    public void addToList(ComplexNumber complex) {
        complexList.add(complex);
    }

    /**
     * Remove a Complex number by index from ArrayList if exist
     * @param index
     */
    public void removeFromList(int index) {
        if ((index > 0) && (index < complexList.size())) {
            complexList.remove(index);
        }
    }


    /**
     * Remove a Complex number from ArrayList if exist
     * @param complex
     */
    public void removeFromList(ComplexNumber complex) {
        for (int i = 0; i < complexList.size(); i++) {
            if (complexList.get(i).isEqual(complex)) {
                complexList.remove(complex);
            }
        }
    }

    /**
     * Add a complex number to array
     * @param complex
     */
    public void addToArr(ComplexNumber complex) {
        complexArray[cursor++] = complex;
    }


    /**
     * Remove a Complex Number by index form Array if exist
     * @param index
     */
    public void removeFromArr(int index) {
        if ((index > 0) && (cursor > index)) {
            complexArray[index] = complexArray[--cursor];
        }
    }


    /**
     * Remove a Complex Number from Array if exist
     * @param complex
     */
    public void removeFromArr(ComplexNumber complex) {
        for (int i = 0; i < cursor; i++) {
            if (complexArray[i].isEqual(complex)) {
                complexArray[i] = complexArray[--cursor];
            }
        }
    }

    /**
     * Show ArrayList Using For
     */
    public void showListWithFor() {
        for (int i = 0; i < complexList.size(); i++) {
            System.out.println(complexList.get(i).toString());
        }
    }

    /**
     * Show ArrayList Using For-Each
     */
    public void showListWithForEach() {
        for (ComplexNumber c :
                complexList) {
            System.out.println(c.toString());
        }
    }

    /**
     * Show ArrayList Using Iterators
     */
    public void showListWithIterator() {
        Iterator<ComplexNumber> it = complexList.iterator();
        while (it.hasNext()) {
            System.out.println(it.next().toString());
        }
    }
    /**
     * Show Array Using For
     */
    public void showArrWithFor() {
        for (int i = 0; i < cursor; i++) {
            System.out.println(complexArray[i].toString());
        }
    }
    /**
     * Show Array Using For-Each
     */
    public void showArrWithForEach() {
        for (ComplexNumber c : complexArray) {
            System.out.println(c.toString());
        }
    }

    /**
     * Search to find a complex number and return the index of list
     * @param complex
     * @return index of complex number in arrayList
     */
    public int find(ComplexNumber complex) {
        for (int i = 0; i < complexList.size(); i++) {
            if (complexList.get(i).isEqual(complex)) {
                return i;
            }
        }
        return -1;
    }

    public void setComplexList(ArrayList<ComplexNumber> complexList) {
        this.complexList = complexList;
    }

    public void setComplexArray(ComplexNumber[] complexArray) {
        this.complexArray = complexArray;
        cursor = complexArray.length;
    }

    public ArrayList<ComplexNumber> getComplexList() {
        return complexList;
    }

    public ComplexNumber[] getComplexArray() {
        return complexArray;
    }
}
