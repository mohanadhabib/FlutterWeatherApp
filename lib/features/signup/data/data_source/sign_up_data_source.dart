import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';

class SignUpDataSource{
  Future<String> signUp({required String email ,required String password}) async{
    try {
      await AppFirebase.firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return AppStrings.signUpSuccessful;
    }
    on FirebaseException catch(e){
      return e.message ?? "";
    }
  }

  Future<String> saveUserData({required String name ,required String email , required String id}) async{
    try {
      await AppFirebase.firebaseFirestore
          .collection(AppStrings.usersCollection)
          .doc(id)
          .set(
          {
            "name" : name,
            "email" : email
          }
      );
      return AppStrings.userInfoSavedSuccessfully;
    }
    on FirebaseException catch(e){
      return e.message ?? "";
    }
  }
}