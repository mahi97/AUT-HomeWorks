package ir.aut.hw4.question2;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;

/**
 *
 * Created by Rahimi on 3/16/17.
 */

public class CharDictionary {

    /**
     * The hash map that contain all characters as key and number of them as value
     */
    private HashMap<Character, Integer> hashMap;


    public CharDictionary() {
        hashMap = new HashMap<>();
    }


    /**
     * Read the file and find the char Frequency
     * @param filePath
     */
    public void charFrequency(String filePath) {
        hashMap.clear();
        try {
            FileReader file = new FileReader(filePath);
            int r;
            while ((r = file.read()) != -1) {
                char ch = (char) r;
                int i = 0;
                if (hashMap.containsKey(ch)) {
                    i = hashMap.get(ch);
                }
                hashMap.put(ch, i + 1);
            }
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * Display the frequency of chars
     */
    public void displayFrequency() {
        System.out.println(hashMap.toString().replace(",", "\n"));
    }


    /**
     * Save the hashMap of char Frequency to File
     */
    public void saveFrequency() {
        FileWriter file;
        try {
            file = new FileWriter("frequency.txt");
            file.write(hashMap.toString().replace(",", "\n"));
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
