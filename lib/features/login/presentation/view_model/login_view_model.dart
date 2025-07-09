import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/core/password_visibility/app_password_visibility.dart';
import 'package:flutter_weather_app/features/login/data/repository/login_repository.dart';

class LoginViewModel extends ChangeNotifier{
  final AppPasswordVisibility passwordVisibility = AppPasswordVisibility();
  final LoginRepositoryImp _loginRepositoryImp = LoginRepositoryImp();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<String> signIn({required String email ,required String password}){
    return _loginRepositoryImp.signIn(email: email,password: password);
  }

  void updateState(){
    notifyListeners();
  }
}