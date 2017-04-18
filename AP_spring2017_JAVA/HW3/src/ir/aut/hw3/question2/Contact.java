package ir.aut.hw3.question2;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Contact {
    private String address;
    private String phoneNumber;
    private int birthDate;

    public Contact(String address, String phoneNumber, int birthDate) {
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
    }

    public Contact() {
        this("", "", 0);
    }

    public Contact(String phoneNumber, int birthDate) {
        this("", phoneNumber, birthDate);
    }

    public Contact(String address, String phoneNumber) {
        this(address, phoneNumber, 0);
    }

    public void setBirthDate(int birthDate) {
        this.birthDate = birthDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getBirthDate() {
        return birthDate;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    @Override
    public String toString() {
        return address + " " + phoneNumber + " " + birthDate;
    }
}

