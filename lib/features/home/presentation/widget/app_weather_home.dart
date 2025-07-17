import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';

class AppWeatherHome extends StatelessWidget {
  final String temp;
  final String condition;
  final String humidity;
  final String feelsLike;
  final String pressureMb;

  const AppWeatherHome({
    super.key,
    required this.temp,
    required this.condition,
    required this.humidity,
    required this.feelsLike,
    required this.pressureMb,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              temp,
              style: TextStyle(
                fontSize: AppDimensions.largeTextSize,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppDimensions.smallPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              condition,
              style: TextStyle(
                fontSize: AppDimensions.smallTextSize,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppDimensions.largePadding,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  AppStrings.feelsLike,
                  style: TextStyle(
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlue
                  ),
                ),
                SizedBox(
                  height: AppDimensions.smallPadding,
                ),
                Text(
                  feelsLike,
                  style: TextStyle(
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppDimensions.largePadding,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  AppStrings.humidity,
                  style: TextStyle(
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlue
                  ),
                ),
                SizedBox(
                  height: AppDimensions.smallPadding,
                ),
                Text(
                  humidity,
                  style: TextStyle(
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppDimensions.largePadding,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  AppStrings.pressure,
                  style: TextStyle(
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlue
                  ),
                ),
                SizedBox(
                  height: AppDimensions.smallPadding,
                ),
                Text(
                  pressureMb,
                  style: TextStyle(
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
