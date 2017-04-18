package ir.aut.app;

import ir.aut.app.core.BaseWeather;
import ir.aut.app.core.CurrentWeather;
import ir.aut.app.core.ForecastWeather;
import ir.aut.app.util.OutputFileWriter;

import java.util.Scanner;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        BaseWeather baseWeather = null;
        int mode;
        while (true) {
            System.out.println("Select Mode : 1.Forecast 2.Current 3.Exit");
            mode = scanner.nextInt();

            switch (mode) {
                case 1:
                    baseWeather = new ForecastWeather();
                    break;
                case 2:
                    baseWeather = new CurrentWeather();
                    break;
                case 3:
                    System.out.println("Exit.");
                    return;
                default:
                    System.out.println("Wrong Input");
                    continue;
            }

            System.out.println("1.City 2.location");
            String finalOutput;
            mode = scanner.nextInt();
            if (mode == 1) {
                System.out.println("Enter City :");
                String city = scanner.next();
                finalOutput = baseWeather.getResult(city);
            } else {
                System.out.println("Enter lat and then lon :");
                double lat = scanner.nextDouble();
                double lon = scanner.nextDouble();
                finalOutput = baseWeather.getResult(lat, lon);
            }

            OutputFileWriter fileWriter = new OutputFileWriter();
            fileWriter.write(finalOutput);

        }

    }

}
