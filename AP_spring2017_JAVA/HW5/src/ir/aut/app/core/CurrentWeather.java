package ir.aut.app.core;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public class CurrentWeather extends BaseWeather {

    @Override
    public String getResult(String city) {
        String JSONResult = apiWeather.getURL(city, ApiWeather.API_MODE.Current);
        String outputResult = parseJSON(JSONResult);
        return outputResult;
    }

    @Override
    public String getResult(double lat, double lon) {
        String JSONResult = apiWeather.getURL(lat, lon, ApiWeather.API_MODE.Current);
        String outputResult = parseJSON(JSONResult);
        return outputResult;
    }

    public String parseResult(String json) throws JSONException {

        String line = "=================================================================================\n";
        String header = "City\t\t\tCountry\t\t\tHumidity\t\t\tresultWeather\n";

        JSONObject jsonObject = new JSONObject(json);

        //"sys"
        JSONObject jsonObjectSys = jsonObject.getJSONObject("sys");
        String resultCountry = jsonObjectSys.getString("country");

        //"weather"
        String result_weather;
        JSONArray jsonArrayWeather = jsonObject.getJSONArray("weather");
        if (jsonArrayWeather.length() > 0) {
            JSONObject jsonObjectWeather = jsonArrayWeather.getJSONObject(0);
            int resultId = jsonObjectWeather.getInt("id");
            String resultMain = jsonObjectWeather.getString("main");
            String resultDescription = jsonObjectWeather.getString("description");
            String resultIcon = jsonObjectWeather.getString("icon");

            result_weather = "weather\tid: " + resultId + "\tmain: " + resultMain + "\tdescription: " + resultDescription + "\ticon: " + resultIcon;
        } else {
            result_weather = "weather empty!";
        }

        //"main"
        JSONObject jsonObjectMain = jsonObject.getJSONObject("main");

        Double resultHumidity = jsonObjectMain.getDouble("humidity");

        //"name"
        String resultName = jsonObject.getString("name");

        String result = line + header + line + resultName+"\t"+resultCountry+"\t"+resultHumidity+"\t"+result_weather + "\n" + line;
        System.out.println(result);
        return result;
    }
}
