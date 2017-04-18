package ir.aut.hw3.question4;

/**
 *
 * Created by Rahimi on 3/9/17.
 */
public class GranduateStudent extends Student {
    public static final int TOTAL_CREDIT = 32;

    public GranduateStudent(String name, String studentNumber, int entryYear) {
        super(name, studentNumber, entryYear);
    }

    public GranduateStudent(String name, String studentNumber) {
        this(name, studentNumber, 0);
    }

    public void displayStudentInformation() {
        System.out.println("G Student :" + name + ", SN :" + studentNumber + "EY : " + entryYear);
    }

    @Override
    public void setStudentNumber(String studentNumber) {
        super.setStudentNumber(studentNumber);
    }

    @Override
    public void setName(String name) {
        super.setName(name);
    }

    @Override
    public void setEntryYear(int entryYear) {
        super.setEntryYear(entryYear);
    }

    @Override
    public int getEntryYear() {
        return super.getEntryYear();
    }

    @Override
    public String getStudentNumber() {
        return super.getStudentNumber();
    }

    @Override
    public String getName() {
        return super.getName();
    }
}
