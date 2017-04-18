package ir.aut.hw2.question4;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Contact {
    private String name;
    private String phoneNumber;
    private int birthDate;

    public Contact(String name, String phoneNumber, int birthDate) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
    }

    public Contact(String name, String phoneNumber) {
        this(name, phoneNumber, 0);
    }

    public void setBirthDate(int birthDate) {
        this.birthDate = birthDate;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getBirthDate() {
        return birthDate;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    @Override
    public String toString() {
        return name + " " + phoneNumber + " " + birthDate;
    }
}

