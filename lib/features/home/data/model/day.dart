import 'package:flutter_weather_app/features/home/data/model/condition.dart';

class Day {
  final num? maxTempC;
  final num? maxTempF;
  final num? minTempC;
  final num? minTempF;
  final num? avgTempC;
  final num? avgTempF;
  final num? maxWindMph;
  final num? maxWindKph;
  final num? totalPreCipMm;
  final num? totalPreCipIn;
  final num? totalSnowCm;
  final num? avgVisKm;
  final num? avgVisMiles;
  final num? avgHumidity;
  final num? dailyWillItRain;
  final num? dailyChanceOfRain;
  final num? dailyWillItSnow;
  final num? dailyChanceOfSnow;
  final Condition? condition;
  final num? uv;

  Day({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalPreCipMm,
    required this.totalPreCipIn,
    required this.totalSnowCm,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory  Day.fromJson(Map<String, dynamic> json) {
   return Day(
       maxTempC: json['maxtemp_c'],
       maxTempF: json['maxtemp_f'],
       minTempC: json['mintemp_c'],
       minTempF: json['mintemp_f'],
       avgTempC: json['avgtemp_c'],
       avgTempF:  json['avgtemp_f'],
       maxWindMph: json['maxwind_mph'],
       maxWindKph: json['maxwind_kph'],
       totalPreCipMm: json['totalprecip_mm'],
       totalPreCipIn: json['totalprecip_in'],
       totalSnowCm:  json['totalsnow_cm'],
       avgVisKm:  json['avgvis_km'],
       avgVisMiles:  json['avgvis_miles'],
       avgHumidity: json['avghumidity'],
       dailyWillItRain: json['daily_will_it_rain'],
       dailyChanceOfRain: json['daily_chance_of_rain'],
       dailyWillItSnow: json['daily_will_it_snow'],
       dailyChanceOfSnow: json['daily_chance_of_snow'],
       condition: Condition.fromJson(json['condition']),
       uv: json['uv']);
  }
}