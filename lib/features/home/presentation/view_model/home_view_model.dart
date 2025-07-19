import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/core/days_of_week/days_of_week.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/features/home/data/model/weather_result.dart';
import 'package:flutter_weather_app/features/home/domain/use_case/home_use_case.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeUseCase _homeUseCase = HomeUseCase();
  final List<int> dates = [DateTime.now().day , DateTime.now().day + 1 , DateTime.now().day + 2];
  final List<String?> days = [daysMap[DateTime.now().weekday] , daysMap[DateTime.now().weekday + 1] , daysMap[DateTime.now().weekday + 2]];
  int currentDayIndex = 0;
  Position? currentLocation;


  Future<String> checkServiceEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      return AppStrings.locationServiceEnabled;
    } else {
      return AppStrings.locationServiceDisabled;
    }
  }

  Future<String> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return AppStrings.locationPermissionDenied;
      } else {
        return AppStrings.locationPermissionAccepted;
      }
    } else {
      return AppStrings.locationPermissionAccepted;
    }
  }

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getUserName(){
    return _homeUseCase.getUserName();
  }

  Future<String> storeUserLocation({required double longitude , required double latitude}){
    return _homeUseCase.storeUserLocation(longitude: longitude, latitude: latitude);
  }

  Future<WeatherResult> getWeather(){
    return _homeUseCase.getWeather();
  }

  void updateState(){
    notifyListeners();
  }
}
