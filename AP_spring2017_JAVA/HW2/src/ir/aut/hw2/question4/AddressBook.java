package ir.aut.hw2.question4;

/**
 *
 * Created by Rahimi on 2/26/17.
 */
public class AddressBook {
    public static final int maxSize = 100;
    private Contact [] contacts = new Contact[maxSize];
    private int contactCount;

    public AddressBook() {

    }

    public void add(Contact contact) {
        if (contactCount < maxSize) {
            contacts[contactCount++] = contact;
        }
    }

    public void remove(String toRemove) {
        for (int i = 0; i < contactCount; i++) {
            if (contacts[i].getName().equals(toRemove) || contacts[i].getPhoneNumber().equals(toRemove)) {
                if (contactCount > 0) {
                    contacts[i] = contacts[--contactCount];
                } else {
                    System.out.println("PhoneBook is empty");
                }
            }
        }
    }

    public void displayAll() {
        for (int i = 0; i < contactCount; i++) {
            System.out.println(contacts[i]);
        }
    }

    public int getContactCount() {
        return contactCount;
    }
}
