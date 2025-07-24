import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/core/widget/app_main_button.dart';
import 'package:flutter_weather_app/core/widget/app_snack_bar.dart';
import 'package:flutter_weather_app/features/home/data/model/current.dart';
import 'package:flutter_weather_app/features/home/presentation/widget/app_weather_calender.dart';
import 'package:flutter_weather_app/features/home/presentation/widget/app_weather_home.dart';
import 'package:flutter_weather_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      floatingActionButton:
          homeViewModel.currentLocation == null
              ? FloatingActionButton(
                backgroundColor: AppColors.lightBlue,
                onPressed: () async {
                  String serviceStatus =
                      await homeViewModel.checkServiceEnabled();
                  AppSnackBar.showSnackBar(context, serviceStatus);
                  if (serviceStatus == AppStrings.locationServiceEnabled) {
                    String permissionStatus =
                        await homeViewModel.checkPermission();
                    AppSnackBar.showSnackBar(context, permissionStatus);
                    if (permissionStatus ==
                        AppStrings.locationPermissionAccepted) {
                      homeViewModel.currentLocation =
                          await homeViewModel.getCurrentPosition();
                      double longitude =
                          homeViewModel.currentLocation?.longitude ?? 0;
                      double latitude =
                          homeViewModel.currentLocation?.latitude ?? 0;
                      String locationStatus = await homeViewModel
                          .storeUserLocation(
                            longitude: longitude,
                            latitude: latitude,
                          );
                      AppSnackBar.showSnackBar(context, locationStatus);
                      homeViewModel.updateState();
                    }
                  }
                },
                child: const Icon(Icons.location_on, color: AppColors.white),
              )
              : null,
      body: Container(
        height: AppDimensions.fullScreenHeight(context),
        color: AppColors.darkBlue,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.largePadding,
            vertical: AppDimensions.largePadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: TextStyle(
                  fontSize: AppDimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightBlue,
                ),
              ),
              FutureBuilder(
                future: homeViewModel.getUserName(),
                builder:
                    (context, snapshot) => Text(
                      snapshot.data ?? "",
                      style: TextStyle(
                        fontSize: AppDimensions.mediumTextSize,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
              ),
              SizedBox(height: AppDimensions.largePadding),
              AppWeatherCalender(
                dates: homeViewModel.dates,
                days: homeViewModel.days,
                onFirstDayTap: (index) {
                  homeViewModel.currentDayIndex = index;
                  homeViewModel.updateState();
                },
                onSecondDayTap: (index) {
                  homeViewModel.currentDayIndex = index;
                  homeViewModel.updateState();
                },
                onThirdDayTap: (index) {
                  homeViewModel.currentDayIndex = index;
                  homeViewModel.updateState();
                },
              ),
              SizedBox(height: AppDimensions.largePadding),
              FutureBuilder(
                future: homeViewModel.getWeather(),
                builder: (context, snapshot) {
                  String temp = "";
                  String condition = "";
                  String humidity = "";
                  String feelsLike = "";
                  String pressureMb = "";
                  if(homeViewModel.currentDayIndex == 0){
                    homeViewModel.weather = snapshot.data?.current;
                    temp = snapshot.data?.current?.tempC.toString() ?? "";
                    condition = snapshot.data?.current?.condition?.text ?? "";
                    humidity = snapshot.data?.current?.humidity.toString() ?? "";
                    feelsLike = snapshot.data?.current?.feelsLikeC.toString() ?? "";
                    pressureMb = snapshot.data?.current?.pressureMb.toString() ?? "";
                    homeViewModel.updateState();
                  }
                  else if(homeViewModel.currentDayIndex == 1){
                    homeViewModel.weather = snapshot.data?.forecast?.forecastDay?[1].hour?[0];
                    temp = snapshot.data?.forecast?.forecastDay?[1].hour?[0].tempC.toString() ?? "" ;
                    condition = snapshot.data?.forecast?.forecastDay?[1].hour?[0].condition?.text ?? "";
                    humidity = snapshot.data?.forecast?.forecastDay?[1].hour?[0].humidity.toString() ?? "";
                    feelsLike = snapshot.data?.forecast?.forecastDay?[1].hour?[0].feelsLikeC.toString() ?? "";
                    pressureMb = snapshot.data?.forecast?.forecastDay?[1].hour?[0].pressureMb.toString() ?? "";
                    homeViewModel.updateState();
                  }
                  else if(homeViewModel.currentDayIndex == 2){
                    homeViewModel.weather = snapshot.data?.forecast?.forecastDay?[2].hour?[0];
                    temp = snapshot.data?.forecast?.forecastDay?[2].hour?[0].tempC.toString() ?? "" ;
                    condition = snapshot.data?.forecast?.forecastDay?[2].hour?[0].condition?.text ?? "";
                    humidity = snapshot.data?.forecast?.forecastDay?[2].hour?[0].humidity.toString() ?? "";
                    feelsLike = snapshot.data?.forecast?.forecastDay?[2].hour?[0].feelsLikeC.toString() ?? "";
                    pressureMb = snapshot.data?.forecast?.forecastDay?[2].hour?[0].pressureMb.toString() ?? "";
                    homeViewModel.updateState();
                  }
                  return AppWeatherHome(
                    temp: temp,
                    condition: condition,
                    humidity: humidity,
                    feelsLike: feelsLike,
                    pressureMb: pressureMb,
                  );
                }
              ),
              SizedBox(
                height: AppDimensions.mediumPadding,
              ),
              Center(
                child: AppMainButton(
                    onPressed: () async{
                      if(homeViewModel.weather == null){
                        AppSnackBar.showSnackBar(context, AppStrings.pleaseWaitForWeatherForecast);
                      }
                      else {
                        Current weather = homeViewModel.weather!;
                        String result = await homeViewModel.getPrediction(weather: weather);
                        String aiResponse;
                        if(result == "0"){
                          aiResponse = AppStrings.doNotPlayToday;
                        }
                        else if(result == "1") {
                          aiResponse = AppStrings.goToPlayToday;
                        }
                        else {
                          aiResponse = result;
                        }
                        AppSnackBar.showSnackBar(context, aiResponse);
                      }
                    },
                    buttonColor: AppColors.lightBlue,
                    text: "Get Prediction",
                    textColor: AppColors.white,
                    fontSize: AppDimensions.mediumTextSize,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
