import 'package:flutter_weather_app/features/home/data/model/weather_result.dart';

abstract class HomeRepository {
  Future<String> getUserName();
  Future<String> storeUserLocation({required double longitude, required double latitude});
  Future<WeatherResult> getWeather();
}