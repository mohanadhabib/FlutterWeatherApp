import 'package:flutter_weather_app/features/signup/data/data_source/sign_up_data_source.dart';

abstract class SignUpRepository{
  Future<String> signUp({required String email ,required String password});
  Future<String> saveUserData({required String name ,required String email , required String id});
}

class SignUpRepositoryImp implements SignUpRepository{
  final SignUpDataSource _signUpDataSource = SignUpDataSource();
  @override
  Future<String> saveUserData({required String name, required String email, required String id}) {
    return _signUpDataSource.saveUserData(name: name, email: email, id: id);
  }

  @override
  Future<String> signUp({required String email, required String password}) {
    return _signUpDataSource.signUp(email: email, password: password);
  }
}