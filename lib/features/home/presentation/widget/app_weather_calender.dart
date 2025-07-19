import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class AppWeatherCalender extends StatelessWidget {
  final List<int> dates;
  final List<String?> days;
  final void Function(int) onFirstDayTap;
  final void Function(int) onSecondDayTap;
  final void Function(int) onThirdDayTap;

  const AppWeatherCalender({
    super.key,
    required this.dates,
    required this.days,
    required this.onFirstDayTap,
    required this.onSecondDayTap,
    required this.onThirdDayTap,
  });

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Container(
      height: AppDimensions.oneEighthScreenHeight(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.calenderRadius),
        color: AppColors.transparentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              homeViewModel.currentDayIndex = 0;
              homeViewModel.updateState();
              onFirstDayTap(0);
            },
            child: Container(
              width: AppDimensions.calenderTileWidth,
              decoration:
                  homeViewModel.currentDayIndex == 0
                      ? BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.calenderRadius,
                        ),
                      )
                      : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[0] ?? "",
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 0
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    dates[0].toString(),
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 0
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeViewModel.currentDayIndex = 1;
              homeViewModel.updateState();
              onSecondDayTap(1);
            },
            child: Container(
              width: AppDimensions.calenderTileWidth,
              decoration:
                  homeViewModel.currentDayIndex == 1
                      ? BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.calenderRadius,
                        ),
                      )
                      : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[1] ?? "",
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 1
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    dates[1].toString(),
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 1
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeViewModel.currentDayIndex = 2;
              homeViewModel.updateState();
              onThirdDayTap(2);
            },
            child: Container(
              width: AppDimensions.calenderTileWidth,
              decoration:
                  homeViewModel.currentDayIndex == 2
                      ? BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.calenderRadius,
                        ),
                      )
                      : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[2] ?? "",
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 2
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.smallTextSize,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    dates[2].toString(),
                    style: TextStyle(
                      color:
                          homeViewModel.currentDayIndex == 2
                              ? AppColors.lightBlue
                              : AppColors.white,
                      fontSize: AppDimensions.mediumTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
