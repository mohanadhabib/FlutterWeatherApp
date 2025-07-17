import 'package:flutter_weather_app/features/home/data/model/condition.dart';

class Current{
  final num? lastUpdatedEpoch;
  final String? lastUpdated;
  final num? tempC;
  final num? tempF;
  final num? isDay;
  final Condition? condition;
  final num? windMph;
  final num? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final num? pressureIn;
  final num? preCipMm;
  final num? preCipIn;
  final num? humidity;
  final num? cloud;
  final num? feelsLikeC;
  final num? feelsLikeF;
  final num? windchillC;
  final num? windchillF;
  final num? heatIndexC;
  final num? heatIndexF;
  final num? dewPointC;
  final num? dewPointF;
  final num? visKm;
  final num? visMiles;
  final num? uv;
  final num? gustMph;
  final num? gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.preCipMm,
    required this.preCipIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatIndexC,
    required this.heatIndexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph});

  factory Current.fromJson(Map<String,dynamic> json){
    return Current(
        lastUpdatedEpoch: json['last_updated_epoch'],
        lastUpdated: json['last_updated'],
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        isDay: json['is_day'],
        condition: Condition.fromJson(json['condition']),
        windMph: json['wind_mph'],
        windKph: json['wind_kph'],
        windDegree: json['wind_degree'],
        windDir: json['wind_dir'],
        pressureMb: json['pressure_mb'],
        pressureIn: json['pressure_in'],
        preCipMm: json['precip_mm'],
        preCipIn: json['precip_in'],
        humidity: json['humidity'],
        cloud: json['cloud'],
        feelsLikeC: json['feelslike_c'],
        feelsLikeF: json['feelslike_f'],
        windchillC: json['windchill_c'],
        windchillF: json['windchill_f'],
        heatIndexC: json['heatindex_c'],
        heatIndexF: json['heatindex_f'],
        dewPointC: json['dewpoint_c'],
        dewPointF: json['dewpoint_f'],
        visKm: json['vis_km'],
        visMiles: json['vis_miles'],
        uv: json['uv'],
        gustMph: json['gust_mph'],
        gustKph: json['gust_kph']
    );
  }
}