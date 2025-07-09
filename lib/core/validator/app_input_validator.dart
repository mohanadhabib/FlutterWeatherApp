abstract class AppInputValidator{
  static String? emailValidator(String? email){
    if(email == null){
    return "Please fill the email";
    }
    else if(email.isEmpty == true){
      return "Email is empty";
    }
    else if(email.contains("@") == false){
      return "Not a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? password){
    if(password == null){
      return "Please fill the password";
    }
    else if(password.isEmpty == true){
      return "Password is empty";
    }
    else if(password.length < 8){
      return "Weak password";
    }
    return null;
  }

  static String? nameValidator(String? email){
    if(email == null){
      return "Please fill the name";
    }
    else if(email.isEmpty == true){
      return "Name is empty";
    }
    return null;
  }

}