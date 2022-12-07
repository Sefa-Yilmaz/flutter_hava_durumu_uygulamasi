import 'dart:convert';

import 'package:flutter_hava_durumu_uygulamasi/model/weather_data.dart';
import 'package:flutter_hava_durumu_uygulamasi/model/weather_data_current.dart';
import 'package:flutter_hava_durumu_uygulamasi/model/weather_data_daily.dart';
import 'package:flutter_hava_durumu_uygulamasi/model/weather_data_hourly.dart';
import 'package:flutter_hava_durumu_uygulamasi/utlis/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );
    return weatherData!;
  }
}
