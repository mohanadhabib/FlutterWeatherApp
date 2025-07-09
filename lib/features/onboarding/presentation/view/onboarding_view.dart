import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/core/widget/app_main_button.dart';
import 'package:flutter_weather_app/features/login/presentation/view/login_view.dart';
import 'package:flutter_weather_app/features/signup/presentation/view/sign_up_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppDimensions.fullScreenWidth(context),
        height: AppDimensions.fullScreenHeight(context),
        color: AppColors.darkBlue,
        child: Column(
          children: [
            Container(
              width: AppDimensions.fullScreenWidth(context),
              height: AppDimensions.halfScreenHeight(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(MediaQuery.sizeOf(context).width / 2),
                  bottomLeft: Radius.circular(MediaQuery.sizeOf(context).width / 2)
                ),
                color: AppColors.white,
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppMainButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView())),
                    buttonColor: AppColors.lightBlue,
                    text: AppStrings.signUp,
                    fontSize: AppDimensions.buttonTextSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppMainButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView())),
                    buttonColor: AppColors.white,
                    text: AppStrings.logIn,
                    fontSize: AppDimensions.buttonTextSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
