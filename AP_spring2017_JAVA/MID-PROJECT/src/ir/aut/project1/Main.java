package ir.aut.project1;

import ir.aut.project1.coding.Coding;
import ir.aut.project1.encryption.ComplexEncryption;
import ir.aut.project1.encryption.Encryption;
import ir.aut.project1.encryption.SimpleEncryption;
import ir.aut.project1.util.InputFileReader;
import ir.aut.project1.util.OutputFileWriter;

/**
 *
 * Created by Rahimi on 3/28/17.
 */

public class Main {


    private static String encryptionSimpleKey;
    private static String inputFile;
    private static String outputFile;
    private static String encryptionComplexKey;
    private static boolean removeAfter;
    private static boolean encrypt;
    private static boolean simple;

    private static InputFileReader in;
    private static OutputFileWriter out;
    private static Coding coding;
    private static Encryption encryption;


    private static boolean parseArgs(String[] args) {
        boolean parseOK = false;
        try {
            for (int i = 0; i < args.length; i++) {
                if (args[i].equals("-r")) {
                    removeAfter = true;
                } else if (args[i].equals("-i")) {
                    inputFile = args[++i];
                } else if (args[i].equals("-o")) {
                    outputFile = args[++i];
                } else if (args[i].equals("-es")) {
                    encryptionSimpleKey = args[++i];
                    simple = true;
                    encrypt = true;
                    parseOK = true;
                } else if (args[i].equals("-ds")) {
                    encryptionSimpleKey = args[++i];
                    simple = true;
                    encrypt = false;
                    parseOK = true;
                } else if (args[i].equals("-ec")) {
                    encryptionComplexKey = args[++i];
                    simple = false;
                    encrypt = true;
                    parseOK = true;
                } else if (args[i].equals("-dc")) {
                    encryptionComplexKey = args[++i];
                    simple = false;
                    encrypt = false;
                    parseOK = true;
                }
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            parseOK = false;
        }
        return parseOK;
    }

    private static String encryptThis(String text) {

        if (encrypt) {
            return encryption.encrypt(text);

        } else {
            return encryption.decrypt(text);

        }
    }

    private static void runForDirectory() {
        for (int i = 0; i < in.getFiles().length; i++) {
            String result;
            String text;
            text = coding.encode(in.readAll(i));
            result = encryptThis(text);
            out.write(coding.decode(result), in.getFiles()[i] + ".out");
        }
    }

    private static void runForFile() {
        String result = "Salam+khoobi+khoobam";
        String text;
        text = coding.encode(in.readAll());
        result = encryptThis(text);
        out.write(coding.decode(result));
        System.out.println("TEXT: " + text);
    }

    public static void main(String[] args) {

        Coding coding1 = new Coding();
        System.out.println("NEW " + coding1.encode("KeepCalmAndWait".getBytes()));

//        return;

        if (!parseArgs(args)) {
            System.out.println("Bad Args!");
            return;
        }

        in = new InputFileReader(inputFile);

        if (outputFile == null) {
            outputFile = "out.dat";
        }

        out = new OutputFileWriter(outputFile);

        coding = new Coding();

        if (simple) {
            encryption = new SimpleEncryption(encryptionSimpleKey);

        } else {
            encryption = new ComplexEncryption(encryptionComplexKey);

        }

        if (in.IsDirectory()) {
            runForDirectory();
        } else {
            runForFile();
        }

        in.removeAfter(removeAfter);

    }
}
