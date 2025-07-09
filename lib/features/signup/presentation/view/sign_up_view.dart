import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/core/validator/app_input_validator.dart';
import 'package:flutter_weather_app/core/widget/app_main_button.dart';
import 'package:flutter_weather_app/core/widget/app_main_text_field.dart';
import 'package:flutter_weather_app/core/widget/app_snack_bar.dart';
import 'package:flutter_weather_app/features/login/presentation/view/login_view.dart';
import 'package:flutter_weather_app/features/signup/presentation/view_model/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpViewModel signUpViewModel = context.watch<SignUpViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: AppDimensions.fullScreenWidth(context),
          height: AppDimensions.fullScreenHeight(context),
          color: AppColors.darkBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.oneSixthScreenHeight(context),
                ),
                child: Text(
                  AppStrings.signUp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.largeTextSize,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                AppStrings.createAnAccount,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: AppDimensions.smallTextSize,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.largePadding,
                  right: AppDimensions.textFieldPadding,
                  left: AppDimensions.textFieldPadding,
                ),
                child: Form(
                  key: signUpViewModel.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.smallPadding,
                        ),
                        child: Text(
                          AppStrings.fullName,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppDimensions.mediumTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppMainTextField(
                        controller: signUpViewModel.nameController,
                        keyboardType: TextInputType.text,
                        validator: AppInputValidator.nameValidator,
                        obscureText: false,
                      ),
                      SizedBox(height: AppDimensions.mediumPadding),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.smallPadding,
                        ),
                        child: Text(
                          AppStrings.email,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppDimensions.mediumTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppMainTextField(
                        controller: signUpViewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppInputValidator.emailValidator,
                        obscureText: false,
                      ),
                      SizedBox(height: AppDimensions.mediumPadding),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.smallPadding,
                        ),
                        child: Text(
                          AppStrings.password,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppDimensions.mediumTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppMainTextField(
                        controller: signUpViewModel.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: AppInputValidator.passwordValidator,
                        obscureText: signUpViewModel.passwordVisibility.isPasswordVisible,
                        icon: IconButton(
                            onPressed: (){
                              signUpViewModel.passwordVisibility.changePasswordVisibility();
                              signUpViewModel.updateState();
                            },
                            icon: Icon(signUpViewModel.passwordVisibility.isPasswordVisible ? Icons.visibility_off : Icons.visibility)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppDimensions.largePadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppMainButton(
                              onPressed: () async {
                                if(signUpViewModel.formKey.currentState?.validate() == true){
                                  signUpViewModel
                                      .signUp(
                                    email: signUpViewModel.emailController.text,
                                    password:
                                    signUpViewModel.passwordController.text,
                                  ).then((value) async {
                                    AppSnackBar.showSnackBar(
                                        context,
                                        value
                                    );
                                    signUpViewModel.saveUserData(
                                      name: signUpViewModel.nameController.text,
                                      email: signUpViewModel.emailController.text,
                                      id: AppFirebase.firebaseAuth.currentUser?.uid ?? "",
                                    ).then((value) {
                                      AppSnackBar.showSnackBar(
                                        context,
                                        value,
                                      );
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
                                    });
                                  });
                                }
                              },
                              buttonColor: AppColors.lightBlue,
                              text: AppStrings.signUp,
                              textColor: AppColors.white,
                              fontSize: AppDimensions.buttonTextSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView())),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              AppStrings.haveAnAccount,
                              style: TextStyle(
                                fontSize: AppDimensions.extraSmallTextSize,
                                fontWeight: FontWeight.normal,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
