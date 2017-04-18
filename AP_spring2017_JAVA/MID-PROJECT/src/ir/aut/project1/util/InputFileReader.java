package ir.aut.project1.util;

import java.io.*;

/**
 *
 * Created by Rahimi on 3/29/17.
 */
public class InputFileReader {

    private boolean directory;
    File file;
    public InputFileReader(String _path) {
        file = new File(_path);
        if (file.isDirectory()) {
            directory = true;
        } else {
            directory = false;
        }

    }

    public boolean IsDirectory() {
        return directory;
    }

    public String getPath() {
        return file.getPath();
    }

    public String[] getFiles() {
        return file.list();
    }

    public void removeAfter(boolean remove) {
        if (remove) {

        }
    }

    public byte[] readAll(int fileIndex) {
        if (directory && fileIndex < file.listFiles().length) {
            byte[] fileData = new byte[(int) file.listFiles()[fileIndex].length()];
            DataInputStream dis = null;

            try {
                dis = new DataInputStream(new FileInputStream(file));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

            try {
                dis.readFully(fileData);
                dis.close();
            } catch (IOException e) {

            }
            return fileData;
        } else {
            return readAll();
        }
    }

    public byte[] readAll() {
        byte[] fileData = new byte[(int) file.length()];
        try {
            FileInputStream fis = new FileInputStream(file);
            fis.read(fileData);
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (int i = 0; i < fileData.length; i++) {
            System.out.println("adasfasd" + fileData[i]);
            String s1 = String.format("%8s", Integer.toBinaryString(fileData[i] & 0xFF)).replace(' ', '0');
            System.out.println(s1); // 10000001
        }
        return fileData;
    }

}
