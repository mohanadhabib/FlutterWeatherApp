import 'package:flutter_weather_app/features/home/data/model/current.dart';

class HomeEntity{
  List<int> getFeatures({required Current weather}){
    List<int> features = [];
    features.add(weather.condition?.text?.toLowerCase() == "rainy" ? 1 : 0);
    features.add(weather.condition?.text?.toLowerCase() == "sunny" ? 1 : 0);
    features.add(weather.tempC! >= 35 ? 1 : 0);
    features.add(weather.tempC! < 35 ? 1 : 0);
    features.add(weather.humidity! >= 30 && weather.humidity! <= 60 ? 1 : 0);
    return features;
  }
}