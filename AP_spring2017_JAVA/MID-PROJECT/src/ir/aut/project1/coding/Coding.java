package ir.aut.project1.coding;

import ir.aut.project1.util.Character;

/**
 * Created by Rahimi on 3/29/17.
 */
public class Coding {

    public Coding() {

    }

    private static byte[] toByteArray(boolean[] bits, int size) {
        byte[] bytes = new byte[(size + 7) / 8];
        System.out.println(size);
        for (int i = 0; i < size; i++) {
            if (bits[i]) {
                bytes[bytes.length - i / 8 - 1] |= 1 << (i % 8);
            }
        }
        for (int i = 0; i < (size + 7) / 8; i++) {
            String s1 = String.format("%8s", Integer.toBinaryString(bytes[i] & 0xFF)).replace(' ', '0');
            System.out.println(s1); // 10000001
        }
        return bytes;
    }

    public byte[] decode(String input) {
        boolean[] bitSet = new boolean[input.length() * 6];
        for (int i = input.length() - 1; i >= 0; i--) {
            int temp = Character.getInt(input.charAt(input.length() - i - 1));
            int index = 0;
            while (index < 6) {
                if (temp % 2 != 0) {
                    bitSet[(i * 6) + index] = true;
                } else {
                    bitSet[(i * 6) + index] = false;
                }
                ++index;
                temp = temp >> 1;
            }
        }

        return toByteArray(bitSet, bitSet.length);
    }


    public String encode(byte[] input) {
        int mode = input.length%3;
        int byteIndex = 0;
        String result = "";
        for (int i = 0; i < input.length; i++) {
            String s1 = String.format("%8s", Integer.toBinaryString(input[i] & 0xFF)).replace(' ', '0');
            System.out.println(s1); // 10000001

        }

        System.out.println(mode);

        if (mode == 0 || mode == 3) {
            while (input.length - byteIndex > 0) {
                char[] tempCharArr = new char[4];
                int temp;
                if (input.length - byteIndex >= 1) {

                    temp = (input[byteIndex] & 0xFF);
                    temp = temp >> 2;
                    tempCharArr[0] = Character.getChar(temp);

                } else {
                    result += tempCharArr[0];
                    break;
                }

                if (input.length - byteIndex >= 2) {
                    int temp1 = input[byteIndex] & 0xFF;
                    int temp2 = input[byteIndex + 1] & 0xFF;
                    temp2 = temp2 >> 4;
                    temp1 = temp1 & 0b00000011;
                    temp1 = temp1 << 4;
                    System.out.println(temp1);
                    System.out.println(temp2);
                    temp1 |= temp2;
                    tempCharArr[1] = Character.getChar(temp1);
                } else {

                    result += tempCharArr[0] + tempCharArr[1];
                    break;
                }

                if (input.length - byteIndex >= 3) {
                    int temp1 = input[byteIndex + 1] & 0xFF;
                    int temp2 = input[byteIndex + 2] & 0xFF;
                    temp1 = temp1 & 0b00001111;
                    temp2 = temp2 >> 6;
                    temp1 = temp1 << 2;
                    temp1 |= temp2;
                    tempCharArr[2] = Character.getChar(temp1);
                    temp = input[byteIndex + 2] & 0b00111111;
                    tempCharArr[3] = Character.getChar(temp);
                    byteIndex += 3;
                } else {
                    temp = (input[byteIndex + 1] & 0b00001111);
                    temp = temp << 2;
                    tempCharArr[2] = Character.getChar(temp);
                    result += tempCharArr[0] + tempCharArr[1] + tempCharArr[2];
                    break;
                }

                result += new String(tempCharArr);
            }
            return result;

        } else if (mode == 1) {
            return new String("SADf");
        } else if (mode == 2) {
            return new String("SADf");

        }

        return new String("SADf");

    }


}
