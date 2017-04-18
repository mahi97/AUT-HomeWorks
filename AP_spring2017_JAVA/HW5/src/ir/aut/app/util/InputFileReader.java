package ir.aut.app.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public class InputFileReader {

    private BufferedReader bufferedReader;
    private InputStreamReader inputStreamReader;
    private String result;
    public InputFileReader(InputStream inputStream) {
        inputStreamReader = new InputStreamReader(inputStream);
        bufferedReader = new BufferedReader(inputStreamReader, 8192);
        result = "";

    }

    public String getResult() throws IOException {
        String line = null;
        while ((line = bufferedReader.readLine()) != null) {
            result += line;
        }
        bufferedReader.close();
        return result;
    }

}
