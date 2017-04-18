package ir.aut.project1.encryption;

import ir.aut.project1.util.Character;

/**
 *
 * Created by Rahimi on 3/29/17.
 */
public class ComplexEncryption extends Encryption {

    int[] index;
    public ComplexEncryption(String key) {
        super(key);
        index = new int[key.length()];
        for (int i = 0; i < key.length(); i++) {
            index[i] = Character.getInt(key.charAt(i));
        }
    }

    @Override
    public String encrypt(String plainText) {
        int indexing = 0;
        char[] charArr = new char[plainText.length()];
        for (int i = 0; i < plainText.length(); i++) {
            if (indexing == index.length) {
                indexing = 0;
            }
            int tempInt = Character.getInt(plainText.charAt(i)) - index[indexing];
            if (tempInt < 0) {
                tempInt += 64;
            } else if (tempInt > 63) {
                tempInt -= 64;
            }
            charArr[i] = Character.getChar(tempInt);
            indexing++;
        }
        return new String(charArr);
    }

    @Override
    public String decrypt(String cipherText) {
        int indexing = 0;
        char[] charArr = new char[cipherText.length()];
        for (int i = 0; i < cipherText.length(); i++) {
            if (indexing == index.length) {
                indexing = 0;
            }
            int tempInt = Character.getInt(cipherText.charAt(i)) + index[indexing];
            if (tempInt < 0) {
                tempInt += 64;
            } else if (tempInt > 63) {
                tempInt -= 64;
            }
            charArr[i] = Character.getChar(tempInt);
            indexing++;
        }
        return new String(charArr);
    }



}
