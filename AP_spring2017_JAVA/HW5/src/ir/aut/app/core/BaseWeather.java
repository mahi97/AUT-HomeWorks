package ir.aut.app.core;

import org.json.JSONException;

/**
 * Created by Rahimi on 4/17/17.
 *
 */
public abstract class BaseWeather {
    protected ApiWeather apiWeather;

    public BaseWeather() {
        apiWeather = new ApiWeather();
    }

    public abstract String getResult(String city);
    public abstract String getResult(double lat, double lon);

    protected String parseJSON(String JSONResult) {
        String outputResult = null;
        try {
            outputResult = parseResult(JSONResult);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return outputResult;
    }

    public abstract String parseResult(String json) throws JSONException;

}
