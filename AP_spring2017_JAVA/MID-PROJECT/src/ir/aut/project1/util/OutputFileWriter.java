package ir.aut.project1.util;

import java.io.*;

/**
 *
 * Created by Rahimi on 3/29/17.
 */
public class OutputFileWriter {

    private String path;

    public OutputFileWriter(String path) {
        this.path = path;
    }

    public boolean write(byte[] input) {
        DataOutputStream dis;
        try {
            dis = new DataOutputStream(new FileOutputStream(path));
        } catch (FileNotFoundException e) {
            return false;
        }

        try {
            dis.write(input);
            dis.close();
        } catch (IOException e) {
            return false;
        }
        return true;
    }

    public boolean write(byte[] input, String path) {
        DataOutputStream dis;

        try {
            dis = new DataOutputStream(new FileOutputStream(path));
        } catch (FileNotFoundException e) {
            return false;
        }

        try {
            dis.write(input);
            dis.close();
        } catch (IOException e) {
            return false;
        }
        return true;
    }
}
