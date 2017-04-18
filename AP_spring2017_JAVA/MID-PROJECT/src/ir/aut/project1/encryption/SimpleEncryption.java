package ir.aut.project1.encryption;


import ir.aut.project1.util.Character;

/**
 *
 * Created by Rahimi on 3/29/17.
 */
public class SimpleEncryption extends Encryption {

    private int key;
    public SimpleEncryption(String key) {
        super(key);
        this.key = Integer.parseInt(key);

    }

    @Override
    public String encrypt(String plainText) {
        char [] charArr = new char[plainText.length()];
        for (int i = 0; i < plainText.length(); i++) {
            int tempInt = Character.getInt(plainText.charAt(i)) - key;
            if (tempInt < 0) {
                tempInt += 64;
            } else if (tempInt > 63) {
                tempInt -= 64;
            }
            charArr[i] = Character.getChar(tempInt);
        }

        return new String(charArr);
    }

    @Override
    public String decrypt(String cipherText) {
        char [] charArr = new char[cipherText.length()];
        for (int i = 0; i < cipherText.length(); i++) {
            int tempInt = Character.getInt(cipherText.charAt(i)) + key;
            if (tempInt < 0) {
                tempInt += 64;
            } else if (tempInt > 63) {
                tempInt -= 64;
            }
            charArr[i] = Character.getChar(tempInt);
        }

        return new String(charArr);
    }
}
