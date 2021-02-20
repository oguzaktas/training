package com.example.weatherapiapp;

import android.content.Context;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class WeatherDataService {

    List<WeatherReportModel> weatherReportModels = new ArrayList<>();

    public static final String QUERY_FOR_CITY_ID = "https://www.metaweather.com/api/location/search/?query=";
    public static final String QUERY_FOR_CITY_WEATHER_BY_ID = "https://www.metaweather.com/api/location/";

    Context context;
    String cityId;

    public WeatherDataService(Context context) {
        this.context = context;
    }

    public interface VolleyResponseListener {
        void onError(String message);

        void onResponse(String cityId);
    }

    public void getCityId(String cityName, VolleyResponseListener volleyResponseListener) {
        String url = QUERY_FOR_CITY_ID + cityName;

        JsonArrayRequest request = new JsonArrayRequest(Request.Method.GET, url, null, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                cityId = "";
                try {
                    JSONObject cityInfo = response.getJSONObject(0);
                    cityId = cityInfo.getString("woeid");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                // Toast.makeText(context, "City ID = " + cityId, Toast.LENGTH_SHORT).show();
                volleyResponseListener.onResponse(cityId);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                // Toast.makeText(context, "Error occurred", Toast.LENGTH_SHORT).show();
                volleyResponseListener.onError("Error occurred");
            }
        });

        // Add the request to the RequestQueue.
        // queue.add(request);
        Singleton.getInstance(context).addToRequestQueue(request);

                /*
                // Request a string response from the provided URL.
                StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(MainActivity.this, response, Toast.LENGTH_SHORT).show();
                            }
                        }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(MainActivity.this, "Error occurred", Toast.LENGTH_SHORT).show();
                    }
                });
                 */
    }

    public interface ForecastByIdResponse {
        void onError(String message);

        void onResponse(List<WeatherReportModel> weatherReportModels);
    }

    public void getCityForecastById(String cityId, ForecastByIdResponse forecastByIdResponse) {
        List<WeatherReportModel> report = new ArrayList<>();
        String url = QUERY_FOR_CITY_WEATHER_BY_ID + cityId;

        // Get the JSON object
        JsonObjectRequest request = new JsonObjectRequest(Request.Method.GET, url, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Toast.makeText(context, response.toString(), Toast.LENGTH_SHORT).show();

                try {
                    JSONArray consolidatedWeatherList = response.getJSONArray("consolidated_weather");

                    // Get the first item in the array

                    for (int i = 0; i < consolidatedWeatherList.length(); i++) {
                        WeatherReportModel oneDay = new WeatherReportModel();
                        JSONObject firstFromApi = (JSONObject) consolidatedWeatherList.get(i);
                        oneDay.setId(firstFromApi.getInt("id"));
                        oneDay.setWeatherStateName(firstFromApi.getString("weather_state_name"));
                        oneDay.setWeatherStateAbbr(firstFromApi.getString("weather_state_abbr"));
                        oneDay.setWindDirectionCompass(firstFromApi.getString("wind_direction_compass"));
                        oneDay.setCreated(firstFromApi.getString("created"));
                        oneDay.setApplicableDate(firstFromApi.getString("applicable_date"));
                        oneDay.setMinTemp(firstFromApi.getLong("min_temp"));
                        oneDay.setMaxTemp(firstFromApi.getLong("max_temp"));
                        oneDay.setTheTemp(firstFromApi.getLong("the_temp"));
                        oneDay.setWindSpeed(firstFromApi.getLong("wind_speed"));
                        oneDay.setWindDirection(firstFromApi.getLong("wind_direction"));
                        oneDay.setAirPressure(firstFromApi.getInt("air_pressure"));
                        oneDay.setHumidity(firstFromApi.getInt("humidity"));
                        oneDay.setVisibility(firstFromApi.getLong("visibility"));
                        oneDay.setPredictability(firstFromApi.getInt("predictability"));
                        weatherReportModels.add(oneDay);
                    }

                    forecastByIdResponse.onResponse(weatherReportModels);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });

                // Get the property called "consolidated_weather" which is an array

                // Get each item in the array and assign it to a new WeatherReportModel object

        Singleton.getInstance(context).addToRequestQueue(request);
    }

    public interface GetCityForecastByNameCallback {
        void onError(String message);
        void onResponse(List<WeatherReportModel> weatherReportModels);
    }

    public void getCityForecastByName(String cityName, GetCityForecastByNameCallback getCityForecastByNameCallback) {
        // Fetch the city ID given the city name
        getCityId(cityName, new VolleyResponseListener() {
            @Override
            public void onError(String message) {

            }

            @Override
            public void onResponse(String cityId) {
                getCityForecastById(cityId, new ForecastByIdResponse() {
                    @Override
                    public void onError(String message) {

                    }

                    @Override
                    public void onResponse(List<WeatherReportModel> weatherReportModels) {
                        getCityForecastByNameCallback.onResponse(weatherReportModels);
                    }
                });
            }
        });

        // Fetch the city forecast given the city ID

    }

}
