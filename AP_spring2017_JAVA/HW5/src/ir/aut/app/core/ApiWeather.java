package ir.aut.app.core;

import ir.aut.app.util.InputFileReader;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public class ApiWeather {
    private static final String KEY = "a1b207b9a01f65cfe468bb8bab0fc286";

    public enum API_MODE {
        Current,
        Forecast
    }

    private String getModeStr(API_MODE api_mode) {
        String apiString = null;
        if (api_mode == API_MODE.Current) {
            apiString = "weather";
        } else if (api_mode == API_MODE.Forecast){
            apiString = "forecast/daily";
        }
        return apiString;
    }

    public String getURL(String city, API_MODE api_mode) {
         return getJSON("http://api.openweathermap.org/data/2.5/"+ getModeStr(api_mode) +"?q="+ city +",uk&appid="+ KEY);
    }

    public String getURL(double lat, double lon, API_MODE api_mode) {
        return getJSON("http://api.openweathermap.org/data/2.5/" + getModeStr(api_mode) +"?lat="+ lat + "&lon=" + lon + "&appid="+ KEY);
    }


    private String getJSON(String URLOpenMap) {
        String result = "";
        try {
            java.net.URL urlWeather = new URL(URLOpenMap);
            HttpURLConnection httpURLConnection = (HttpURLConnection) urlWeather.openConnection();

            if (httpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {

                InputFileReader inputFileReader = new InputFileReader(httpURLConnection.getInputStream());
                result = inputFileReader.getResult();

            } else {
                System.out.println("Error in httpURLConnection.getResponseCode()!!!");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

}
