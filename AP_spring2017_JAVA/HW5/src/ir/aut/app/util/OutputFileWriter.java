package ir.aut.app.util;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public class OutputFileWriter {

    FileWriter fileWriter;

    public void write(String text) {
        try {
            fileWriter = new FileWriter("./" + new Date(System.currentTimeMillis()).toString());
            fileWriter.write(text);
            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
