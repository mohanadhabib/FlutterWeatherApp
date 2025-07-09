class AppPasswordVisibility{
  bool isPasswordVisible = true;

  bool changePasswordVisibility (){
    isPasswordVisible = !isPasswordVisible;
    return isPasswordVisible;
  }

}