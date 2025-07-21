import 'package:flutter_weather_app/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_weather_app/features/home/data/model/weather_result.dart';
import 'package:flutter_weather_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository{
  final HomeDataSource _homeDataSource = HomeDataSource();
  @override
  Future<String> getUserName() async{
    return _homeDataSource.getUserName();
  }
  
  @override
  Future<String> storeUserLocation({required double longitude, required double latitude}) {
    return _homeDataSource.storeUserLocation(longitude: longitude, latitude: latitude);
  }

  @override
  Future<WeatherResult> getWeather() {
    return _homeDataSource.getWeather();
  }

  @override
  Future<String> getPrediction({required List<int> features}) {
    return _homeDataSource.getPrediction(features: features);
  }
  
}