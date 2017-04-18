package ir.aut.project1.util;

/**
 *
 * Created by Rahimi on 4/2/17.
 */

public class Character {

    static public char getChar(int key) {
        if (key < -1) {
            System.out.println("It Should Be Positive");
            return '/';
        }
        if (key < 26) {
            return (char)((int)'A' + key);
        } else if (key < 52) {
            return (char) ((int) 'a' + key - 26);
        } else if (key < 62){
            return (char) ((int) '0' + key - 52);
        } else if (key == 62) {
            return '+';
        } else if (key == 63) {
            return '/';
        } else {
            System.out.println("INVALID INT" + key);
            return '/';
        }
    }

    static public int getInt(char key) {

        if (key >= 'A' && key <= 'Z') {
            return key - (int)'A';
        } else if (key >= 'a' && key <= 'z') {
            return key - (int)'a' + 26;
        } else if (key >= '0' && key <= '9') {
            return key - (int)'0' + 52;
        } else if (key == '+') {
            return 62;
        } else if (key == '/') {
            return 63;
        } else {
            System.out.println("INVALID CHAR");
            return 63;
        }
    }
}
