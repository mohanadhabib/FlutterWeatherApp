import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/color/app_colors.dart';
import 'package:flutter_weather_app/core/dimension/app_dimensions.dart';
import 'package:flutter_weather_app/core/firebase/app_firebase.dart';
import 'package:flutter_weather_app/core/string/app_strings.dart';
import 'package:flutter_weather_app/core/validator/app_input_validator.dart';
import 'package:flutter_weather_app/core/widget/app_main_button.dart';
import 'package:flutter_weather_app/core/widget/app_main_text_field.dart';
import 'package:flutter_weather_app/core/widget/app_snack_bar.dart';
import 'package:flutter_weather_app/features/home/presentation/view/home_view.dart';
import 'package:flutter_weather_app/features/login/presentation/view_model/login_view_model.dart';
import 'package:flutter_weather_app/features/signup/presentation/view/sign_up_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = context.watch<LoginViewModel>();
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
                padding: EdgeInsets.only(top: AppDimensions.quarterAndHalfScreenHeight(context) ),
                child: Text(
                  AppStrings.login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.largeTextSize,
                    color: AppColors.white
                  ),
                ),
              ),
              Text(
                AppStrings.loginIntoYourAccount,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: AppDimensions.smallTextSize,
                    color: AppColors.white
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimensions.oneSixthScreenHeight(context),
                    right: AppDimensions.textFieldPadding,
                    left: AppDimensions.textFieldPadding
                ),
                child: Form(
                  key: loginViewModel.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.smallPadding),
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
                        controller: loginViewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppInputValidator.emailValidator,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: AppDimensions.mediumPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.smallPadding),
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
                        controller: loginViewModel.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: AppInputValidator.passwordValidator,
                        obscureText: loginViewModel.passwordVisibility.isPasswordVisible,
                        icon: IconButton(
                            onPressed: (){
                              loginViewModel.passwordVisibility.changePasswordVisibility();
                              loginViewModel.updateState();
                            } ,
                            icon: Icon(loginViewModel.passwordVisibility.isPasswordVisible ? Icons.visibility_off : Icons.visibility)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppDimensions.smallPadding),
                            child: Text(
                              AppStrings.forgetYourPassword,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: AppDimensions.extraSmallTextSize,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppDimensions.largePadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppMainButton(
                                onPressed: () async{
                                 if(loginViewModel.formKey.currentState?.validate() == true){
                                   loginViewModel.signIn(
                                     email: loginViewModel.emailController.text,
                                     password : loginViewModel.passwordController.text
                                   ).then((loginStatus){
                                     AppSnackBar.showSnackBar(context, loginStatus);
                                     loginViewModel.storeUserIdInternally(
                                         userId: AppFirebase.firebaseAuth.currentUser?.uid ?? " ",
                                     ).then((isDataStored){
                                       String dataStatus = isDataStored == true ? AppStrings.dataStoredSuccessfully : AppStrings.dataStoredUnSuccessfully;
                                       AppSnackBar.showSnackBar(context, dataStatus);
                                       if(isDataStored){
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
                                       }
                                     });
                                   });
                                 }
                                },
                                buttonColor: AppColors.lightBlue,
                                text: AppStrings.login,
                                textColor: AppColors.white,
                                fontSize: AppDimensions.buttonTextSize,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView())),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              AppStrings.donTHaveAnAccount,
                              style: TextStyle(
                                  fontSize: AppDimensions.extraSmallTextSize,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.lightBlue
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
