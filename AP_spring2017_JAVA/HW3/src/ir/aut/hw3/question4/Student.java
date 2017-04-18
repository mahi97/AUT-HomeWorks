package ir.aut.hw3.question4;

import com.sun.media.sound.ModelStandardIndexedDirector;

/**
 * Created by Rahimi on 3/9/17.
 */
public class Student {
    protected String name;
    protected String studentNumber;
    protected int entryYear;

    public  Student(String name, String studentNumber, int entryYear) {
        this.name = name;
        this.studentNumber = studentNumber;
        this.entryYear = entryYear;
    }

    public Student(String name, String studentNumber) {
        this(name, studentNumber, 0);
    }

    public void displayInfo() {
        System.out.println("name :" + name + " , studentNo. : " + studentNumber + " , entryYear" + entryYear);
    }

    public void setEntryYear(int entryYear) {
        this.entryYear = entryYear;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public int getEntryYear() {
        return entryYear;
    }

    public String getName() {
        return name;
    }

    public String getStudentNumber() {
        return studentNumber;
    }
}
