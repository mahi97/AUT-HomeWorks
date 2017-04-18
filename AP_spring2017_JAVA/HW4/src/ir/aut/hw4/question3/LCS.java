package ir.aut.hw4.question3;

import java.io.*;

/**
 *
 * Created by Rahimi on 3/16/17.
 */
public class LCS {

    /**
     * Compare two String and return larger one
     * @param a
     * @param b
     * @return The String that have larger length
     */
    private String maxStr(String a, String b) {
        return (a.length() > b.length()) ? a : b;
    }

    /**
     * recursive function to find partially longest common sequence
     * @param a
     * @param b
     * @param ia
     * @param ib
     * @param localLong
     * @return The longest common sequence from String a, b with end index of ia, ib
     */
    private String findLongest(String a, String b, int ia, int ib, String localLong) {
        if (ia == 0 || ib == 0) {
            return "";
        } else if (a.charAt(ia - 1) == b.charAt(ib - 1)) {
            return findLongest(a, b, ia - 1, ib - 1, localLong) + a.charAt(ia - 1);
        } else {
            return maxStr(findLongest(a, b, ia - 1, ib, localLong + a.charAt(ia - 1)),
                          findLongest(a, b, ia, ib - 1, localLong + b.charAt(ib - 1)));
        }
    }

    /**
     * Read Files and find LCS from them
     * @param firstPath
     * @param secondPath
     * @return The Longest Common Sequence From Input File
     */
    public String getLongestCommonSequence(String firstPath, String secondPath) {
        String longest = "";
        try {
            File firstFile  = new File(firstPath);
            File secondFile = new File(secondPath);
            FileWriter outFile    = new FileWriter("longest.txt");
            FileInputStream firstStream = new FileInputStream(firstFile);
            FileInputStream secondStream = new FileInputStream(secondFile);

            byte[] data1 = new byte[(int) firstFile.length()];
            firstStream.read(data1);
            firstStream.close();

            byte[] data2 = new byte[(int) secondFile.length()];
            secondStream.read(data2);
            secondStream.close();

            String firstStr  = new String(data1, "UTF-8");
            String secondStr = new String(data2, "UTF-8");

            longest = findLongest(firstStr, secondStr, firstStr.length(), secondStr.length(), "");

            outFile.write(longest);
            outFile.close();

            return longest;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return longest;
    }

}
