import 'package:flutter_weather_app/features/home/data/model/current.dart';
import 'package:flutter_weather_app/features/home/data/model/forecast.dart';
import 'package:flutter_weather_app/features/home/data/model/location.dart';

class WeatherResult{
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  WeatherResult({
    required this.location,
    required this.current,
    required this.forecast
  });
  
  factory WeatherResult.fromJson(Map<String,dynamic> json){
    return WeatherResult(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']),
        forecast: Forecast.fromJson(json['forecast'])
    );
  }
}