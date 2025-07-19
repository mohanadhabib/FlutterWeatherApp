import 'package:flutter_weather_app/features/home/data/model/forecast_day.dart';

class Forecast {
  final List<ForecastDay>? forecastDay;

  Forecast({
    required this.forecastDay,
  });

  factory Forecast.fromJson(Map<String,dynamic> json){
    List<ForecastDay> forecastDay = [];
    json['forecastday'].forEach((v) {
      forecastDay.add(ForecastDay.fromJson(v));
    });
    return Forecast(
        forecastDay: forecastDay
    );
  }

}
