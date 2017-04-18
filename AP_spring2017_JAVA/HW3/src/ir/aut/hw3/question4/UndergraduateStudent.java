package ir.aut.hw3.question4;

import sun.security.provider.SHA;

/**
 *
 * Created by Rahimi on 3/9/17.
 */
public class UndergraduateStudent extends Student {

    public static final int TOTAL_CREDIT = 142;
    private Sahmye shamye;


    public UndergraduateStudent(String name, String studentNumber, int entryYear, Sahmye sahmye) {
        super(name, studentNumber, entryYear);
        this.shamye = sahmye;
    }

    public UndergraduateStudent(String name, String studentNumber) {
        super(name, studentNumber);
        this.shamye = Sahmye.Konkur;
    }

    enum Sahmye {
        Konkur,
        Olympiad,
        Faculty
    }

    public void displayStudentInformation() {
        System.out.println("UG Student :" + name +
                ", SN :" + studentNumber +
                "EY : " + entryYear +
                " , Shamye :" + shamye);

    }

    @Override
    public void setEntryYear(int entryYear) {
        super.setEntryYear(entryYear);
    }

    @Override
    public void setName(String name) {
        super.setName(name);
    }

    @Override
    public void setStudentNumber(String studentNumber) {
        super.setStudentNumber(studentNumber);
    }

    public void setShamye(Sahmye shamye) {
        this.shamye = shamye;
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public String getStudentNumber() {
        return super.getStudentNumber();
    }

    @Override
    public int getEntryYear() {
        return super.getEntryYear();
    }

}
