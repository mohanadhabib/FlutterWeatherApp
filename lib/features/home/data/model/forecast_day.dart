import 'package:flutter_weather_app/features/home/data/model/astro.dart';
import 'package:flutter_weather_app/features/home/data/model/current.dart';
import 'package:flutter_weather_app/features/home/data/model/day.dart';

class ForecastDay {
  final String? date;
  final num? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Current>? hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    List<Current> hour = [];
    json['hour'].forEach((v) {
      hour.add(Current.fromJson(v));
    });
    return ForecastDay(
        date: json['date'],
        dateEpoch: json['date_epoch'],
        day: Day.fromJson(json['day']),
        astro: Astro.fromJson(json['astro']),
        hour: hour
    );
  }
}