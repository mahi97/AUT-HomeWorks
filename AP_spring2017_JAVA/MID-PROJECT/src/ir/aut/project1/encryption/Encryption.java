package ir.aut.project1.encryption;

/**
 *
 * Created by Rahimi on 3/29/17.
 */
public abstract class Encryption {

    public Encryption(String key) {

    }



    public abstract String encrypt(String plainText);
    public abstract String decrypt(String cipherText);


}
