import 'package:flutter_weather_app/features/login/data/data_source/login_data_source.dart';

abstract class LoginRepository{
  Future<String> signIn({required String email,required String password});
}

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource _dataSource = LoginDataSource();

  @override
  Future<String> signIn({required String email,required String password}) {
    return _dataSource.signIn(email: email,password:  password);
  }
}