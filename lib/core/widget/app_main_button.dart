import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';

class AppMainButton extends StatelessWidget {

  final void Function() onPressed;
  final Color buttonColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const AppMainButton({
    super.key,
    required this.onPressed,
    required this.buttonColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: AppDimensions.buttonWidth(context),
      height: AppDimensions.buttonHeight,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.halfScreenWidth(context))
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
