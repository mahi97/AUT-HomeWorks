package ir.aut.app.core;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by Rahimi on 4/17/17.
 */
public class ForecastWeather extends BaseWeather {


    @Override
    public String getResult(String city) {
        String JSONResult = apiWeather.getURL(city, ApiWeather.API_MODE.Forecast);
        String outputResult = parseJSON(JSONResult);
        return outputResult;
    }

    @Override
    public String getResult(double lat, double lon) {
        String JSONResult = apiWeather.getURL(lat, lon, ApiWeather.API_MODE.Forecast);
        String outputResult = parseJSON(JSONResult);
        return outputResult;
    }

    public String parseResult(String json) throws JSONException {

        String line = "=================================================================================\n";
        String header = "city\tcountry\tcoordination\thumidity\tdescription\t\t\tmain\n";
        String result = line + header + line;

        JSONObject jsonObject = new JSONObject(json);

        //"coord"
        JSONObject jsonObjectCity = jsonObject.getJSONObject("city");
        String name = jsonObjectCity.getString("name");
        String country = jsonObjectCity.getString("country");
        JSONObject jsonObjectCoord = jsonObjectCity.getJSONObject("coord");
        Double resultLon = jsonObjectCoord.getDouble("lon");
        Double resultLat = jsonObjectCoord.getDouble("lat");

        //"list"
        JSONArray jsonArray = jsonObject.getJSONArray("list");
        Integer cnt = jsonObject.getInt("cnt");
        String[] myinfo = new String[cnt];

        for (int i = 0; i < cnt; i++) {
            myinfo[i] = name + "\t" + country + "\t" + "(" + resultLon + "," + resultLat + ")" + "\t";
            JSONObject jsonObjectData = jsonArray.getJSONObject(i);
            Integer humidity = jsonObjectData.getInt("humidity");

            //"weather"
            JSONArray jsonArrayWeather = jsonObjectData.getJSONArray("weather");
            JSONObject jsonObjectWeather = jsonArrayWeather.getJSONObject(0);
            String main = jsonObjectWeather.getString("main");
            String description = jsonObjectWeather.getString("description");

            myinfo[i] += humidity + "\t\t\t" + description + "\t\t\t" + main + "\n";
            result += myinfo[i];
        }
        result += line;
        return result;
    }
}
