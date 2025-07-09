import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';

abstract class AppSnackBar{
  static void showSnackBar(BuildContext context , String text){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.lightBlue,
          content: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: AppDimensions.mediumTextSize
            ),
          )
        )
    );
  }
}