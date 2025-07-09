import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';

class AppMainTextField extends StatelessWidget {

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? icon;


  const AppMainTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.obscureText,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: AppColors.white
      ),
      decoration: InputDecoration(
        fillColor: AppColors.transparentBlue,
        filled: true,
        suffixIcon: icon,
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.transparentBlue
            ),
            borderRadius: BorderRadius.circular(AppDimensions.halfScreenWidth(context))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.transparentBlue
            ),
            borderRadius: BorderRadius.circular(AppDimensions.halfScreenWidth(context))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.transparentBlue
            ),
            borderRadius: BorderRadius.circular(AppDimensions.halfScreenWidth(context))
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.transparentBlue
          ),
          borderRadius: BorderRadius.circular(AppDimensions.halfScreenWidth(context))
        )
      ),
    );
  }
}
