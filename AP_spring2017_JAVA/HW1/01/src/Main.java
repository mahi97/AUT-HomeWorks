import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Created by Rahimi on 2/10/17.
 */
public class Main {

    public static void main (String args[]) {
        Scanner scanner = new Scanner(System.in);
        try {
            int input = scanner.nextInt();

            if (input % 400 == 0 || (input % 100 != 0 && input % 4 == 0)) {
                System.out.println("Leap Year");
            } else {
                System.out.println("Not Leap Year");
            }

        } catch (InputMismatchException e) {
            System.out.println("Wrong Input");
        }


    }

}
