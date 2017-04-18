package ir.aut.hw2.question3;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class Address {

    private String plaque;
    private String street;
    private String apartmentNumber;
    private String city;
    private String zipCode;

    public Address(String plaque, String street, String apartmentNumber, String city, String zipCode) {
        this.plaque = plaque;
        this.street = street;
        this.apartmentNumber = apartmentNumber;
        this.city = city;
        this.zipCode = zipCode;
    }

    public Address(String plaque, String street, String city, String zipCode) {
        this(plaque, street, "", city, zipCode);
    }

    @Override
    public String toString() {
        return plaque + " " + street + " " +apartmentNumber + " " + city + " " + zipCode;
    }

    public boolean isEqual(Address that) {
        return this.toString().equals(that.toString());
    }

}
