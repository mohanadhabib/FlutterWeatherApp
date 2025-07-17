import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
import 'package:flutter_weather_app/core/shared_preferences/app_shared_preferences.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/features/home/data/model/weather_result.dart';

class HomeDataSource {
  
  Future<String> getUserName() async {
    try{
      final sharedPreferences = await AppSharedPreferences.getSharedPreferences();
      final userId = sharedPreferences.getString(AppStrings.userIdKey);
      final data = await AppFirebase.firebaseFirestore.collection(AppStrings.usersCollection).doc(userId).get();
      final userName = data["name"] as String;
      return userName;
    }on FirebaseException catch(e){
      return e.message ?? "";
    }
  }

  Future<String> storeUserLocation({required double longitude,required double latitude}) async {
    try{
    final sharedPreferences = await AppSharedPreferences.getSharedPreferences();
    sharedPreferences.setDouble(AppStrings.longitude, longitude);
    sharedPreferences.setDouble(AppStrings.latitude, latitude);
    return AppStrings.userInfoSavedSuccessfully;
    }
    catch (e){
      return AppStrings.dataStoredUnSuccessfully;
    }
  }

  Future<WeatherResult> getWeather() async{
    final sharedPreferences = await AppSharedPreferences.getSharedPreferences();
    final longitude = sharedPreferences.getDouble(AppStrings.longitude);
    final latitude = sharedPreferences.getDouble(AppStrings.latitude);
    final uri = Uri.parse(AppStrings.baseUrl+AppStrings.endPoint).replace(queryParameters: {
      "key" : AppStrings.apiKey,
      "days" : "3",
      "q": "$latitude,$longitude"
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String,dynamic>;
    final weatherResult = WeatherResult.fromJson(json);
    return weatherResult;
  }
}
