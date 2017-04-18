package ir.aut.hw3.question2;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * Created by Rahimi on 3/9/17.
 */
public class AddressBook {

    /**
     *  HashMap that contain all of contacts
     */
    private HashMap<String, Contact> contactHashMap;


    /**
     * Constructor of AddressBook
     * Initial HashMap
     */
    public AddressBook() {
        contactHashMap = new HashMap<String, Contact>();
    }


    public void setContactHashMap(HashMap<String, Contact> contactHashMap) {
        this.contactHashMap = contactHashMap;
    }

    public HashMap<String, Contact> getContactHashMap() {
        return contactHashMap;
    }

    /**
     * Show all Contact that stored in hashMap
     */
    public void showAllContact() {
        for (Map.Entry<String, Contact> stringContactEntry : contactHashMap.entrySet()) {
            System.out.println(stringContactEntry.toString());
        }
    }

    /**
     *
     * @return count of contact that stored in addressBook
     */
    public int getSize() {
        return contactHashMap.size();
    }

    /**
     * add a contact to AddressBook
     * @param contact
     */
    public void addContact(Contact contact) {
        contactHashMap.put(contact.getPhoneNumber(), contact);
    }

    /**
     * remove a contact from AddressBook
     * @param contact
     */
    public void removeContact(Contact contact) {
        contactHashMap.remove(contact.getPhoneNumber());
    }

    /**
     * Replace a contact with existing contact in addressbook
     * Edit contact by replacing them
     * @param contact
     */
    public void replaceContact(Contact contact) {
        contactHashMap.replace(contact.getPhoneNumber(), contact);
    }
}
