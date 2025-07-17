import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPreferences {
  static Future<SharedPreferences> getSharedPreferences() async{
    return await SharedPreferences.getInstance();
  }
}