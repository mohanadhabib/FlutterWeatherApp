import 'package:flutter_weather_app/features/home/data/model/weather_result.dart';
import 'package:flutter_weather_app/features/home/data/repository/home_repository_imp.dart';

class HomeUseCase {
  final HomeRepositoryImp _homeRepositoryImp = HomeRepositoryImp();

  Future<String> getUserName(){
    return _homeRepositoryImp.getUserName();
  }

  Future<String> storeUserLocation({required double longitude , required double latitude}){
    return _homeRepositoryImp.storeUserLocation(longitude: longitude, latitude: latitude);
  }

  Future<WeatherResult> getWeather(){
    return _homeRepositoryImp.getWeather();
  }
}