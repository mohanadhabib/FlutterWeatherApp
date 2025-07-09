import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
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
}