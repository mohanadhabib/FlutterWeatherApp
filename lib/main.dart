import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_weather_app/features/login/presentation/view_model/login_view_model.dart';
import 'package:flutter_weather_app/features/signup/presentation/view_model/sign_up_view_model.dart';
import 'package:flutter_weather_app/features/splash/presentation/view/splash_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginViewModel()),
          ChangeNotifierProvider(create: (context) => SignUpViewModel()),
          ChangeNotifierProvider(create: (context) => HomeViewModel())
        ],
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}