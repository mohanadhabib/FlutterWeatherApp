import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/password_visibility/app_password_visibility.dart';
import 'package:flutter_weather_app/features/signup/data/repository/sign_up_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AppPasswordVisibility passwordVisibility = AppPasswordVisibility();
  final SignUpRepositoryImp _signUpRepositoryImp = SignUpRepositoryImp();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<String> saveUserData({required String name, required String email, required String id}){
    return _signUpRepositoryImp.saveUserData(name: name, email: email, id: id);
  }

  Future<String> signUp({required String email, required String password}){
    return _signUpRepositoryImp.signUp(email: email, password: password);
  }

  void updateState(){
    notifyListeners();
  }
}