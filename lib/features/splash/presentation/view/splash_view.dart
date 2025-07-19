import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/shared_preferences/app_shared_preferences.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/features/home/presentation/view/home_view.dart';
import 'package:flutter_weather_app/features/onboarding/presentation/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  @override
  Future<void> didChangeDependencies() async{
    super.didChangeDependencies();
    final sharedPreferences = await AppSharedPreferences.getSharedPreferences();
    Timer(
        Duration(seconds: 3),
            (){
          if(sharedPreferences.getString(AppStrings.userIdKey) == null){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingView()));
          }
          else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
          }
        }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppDimensions.fullScreenWidth(context),
        height: AppDimensions.fullScreenHeight(context),
        color: AppColors.darkBlue,
        child: Center(
          child: Image.asset('assets/images/weather_icon.png'),
        ),
      ),
    );
  }
}