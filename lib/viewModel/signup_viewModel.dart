import '/utils/utils.dart';
import 'package:brewery/view/view.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier
{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repassController = TextEditingController();
  bool showPassword = false;
  bool showRePassword = false;

  showHidePassword()
  {
    showPassword = !showPassword;
    notifyListeners();
  }

  showHideRePassword()
  {
    showRePassword = !showRePassword;
    notifyListeners();
  }

  bool matchPassword()
  {
    if(passwordController.text == repassController.text)
      {
        return true;
      }
    else
      {
       return false;
      }
  }

  signUp(BuildContext context) async
  {
    var u = await FirebaseUtility.signUpWithEmailPassword(
        email: usernameController.text,
        password: passwordController.text,
        context: context);
    if(u != null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BreweryListView()));
        Common.showSnackBar('You Successfully Signup!', context);
      }
  }
}