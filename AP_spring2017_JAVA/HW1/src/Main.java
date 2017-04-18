import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 *  Created by Mahi on 2/10/17.
 *
 */


public class Main {

    // Leap Year
    public static void isLeepYear(int year) {
        if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)) {
            System.out.println("Leap Year");
        } else {
            System.out.println("Not Leap Year");
        }

    }
    ////////////

    // Show Number
    public static String showNumber(int number) {
        String out = "";
        String[][] numbers = new String[3][];
        numbers[0] = new String[]{"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
        numbers[1] = new String[]{"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
        numbers[2] = new String[]{"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};

        int count = (int) Math.ceil(Math.log10(number));
        int[] a;
        a = new int[count];
        for (int i = 0; i < count; i++) {
            a[i] = (number % 10);
            number /= 10;
            System.out.println(a[i]);
        }

        switch (count) {
            case 0:
                out = "Zero";
                break;
            case 4:
                out += numbers[0][a[3] - 1] + " thousand ";
            case 3:
                if (a[2] != 0) {
                    out += numbers[0][a[2] - 1] + " hundred ";
                }
            case 2:
                if (a[1] == 1) {
                    out += numbers[1][a[0]];
                    break;
                } else if (a[1] != 0) {
                    out += numbers[2][a[1] - 2] + " ";
                }
            case 1:
                out += numbers[0][a[0] - 1];
                break;

        }


        return out;
    }
    /////////////

    // Fix 94
    public static void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public static int check94(int[] nums, int i, int position) {
        if (nums[i] == 9) {
            position = i + 1;

        } else if (nums[i] == 4 && position > 0) {
            if (position < nums.length)
                swap(nums, i, position);

            position = -1;

        }

        return position;
    }

    public static int[] fix94(int[] nums) {
        int position = -1;
        for (int i = 0; i < nums.length; i++) {
            position = check94(nums, i, position);
        }

        for (int i = nums.length - 1; i >= 0; i--) {
            position = check94(nums, i, position);
        }

        return nums;

    }
    //////////////

    // Complex Number
    public static String complexCalc (double real1 ,double img1, double real2, double img2 , int operator ) {

        String ans = "";

        switch (operator) {
            case 0: // Add
                ans = (real1 + real2) + " + " + (img1 + img2) + "i";
                break;
            case 1: // Subtract
                ans = (real1 - real2) + " + " + (img1 - img2) + "i";
                break;
            case 2: // Multiply
                ans = (real1*real2 - img1*img2) + " + " + (img1*real2 + img2*real1) + "i";
                break;
            case 3: // Divide
                double down = real2*real2 + img2*img2;
                ans = ((real1*real2 + img1*img2) / (down)) + " + " + ((img1*real1 - img2*real1) / down) + "i";
                break;
        }

        return  ans;
    }
    /////////////////

    // seqGenerator
    public static int[] seqGenerator (int n, int[] seq, int m) {
        int [] out = new int[m];

        // fill array with seq
        for (int i = 0; i < n && i < m; i++) {
            out[i] = seq[i];
        }

        // generate seq
        for (int i = 0; i < m - n ; i++) {
            out[i + n] = (int) (seq[i % n]*Math.pow(10.0, Math.ceil(i / n) + 1));
        }

        return out;
    }
    ///////////////


    // Main
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);

        // LEAP YEAR
        try {
            int input = scanner.nextInt();
            isLeepYear(input);

        } catch (InputMismatchException e) {
            System.out.println("Wrong Input");
        }
        //////////////


        // Show Numbers
        String out = showNumber(213);
        System.out.println(out);
        //////////////


        // No. 94
        int [] testarr = new int[]{1, 9, 1, 4, 4, 9, 1};
        int [] arr = fix94(testarr);
        for (int a : arr) {
            System.out.println(a);
        }
        //////////////


        // Complex numbers
        String ans = complexCalc(2.3 , 1.2 , 1.2, -3.2, 2);
        System.out.println(ans);
        //////////////


        // Sequence Generator
        try {
            int input = scanner.nextInt();
            int [] seq = new int[input];

            for (int i = 0; i < input; i++) {
                seq[i] = scanner.nextInt();
            }

            int end = scanner.nextInt();


            int [] newSeq = seqGenerator(input, seq, end);
            for (int element : newSeq) {
                System.out.println(element);
            }

        } catch (InputMismatchException e) {
            System.out.println("Wrong Input");
        }
        //////////////

    }

}
