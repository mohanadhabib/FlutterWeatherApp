import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
import 'package:flutter_weather_app/core/shared_preferences/app_shared_preferences.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';

class LoginDataSource{
  Future<String> signIn({required String email,required String password}) async{
    try {
      await AppFirebase.firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password);
      return AppStrings.loginSuccessful;
    }
    on FirebaseException catch(e){
      return e.message ?? "";
    }
  }

  Future<bool> storeUserIdInternally({required String userId}) async{
    try{
      final sharedPreferences = await AppSharedPreferences.getSharedPreferences();
      await sharedPreferences.setString(AppStrings.userIdKey, userId);
      return true;
    }catch (e){
      return false;
    }
  }
}